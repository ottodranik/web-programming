const { pagesQuery, genresQuery, authorsQuery } = require('./shared');

module.exports = {
  getBooks: (req, res) => {
    const isAjaxRequest = req.xhr || req.headers.accept.indexOf('json') > -1;
    global.currentPage = 2;
    const user_id = req.session.user ? req.session.user.id : 0;
    const keywordsQuery = "SELECT * FROM `keywords` WHERE page_id="+currentPage+";";
    const booksQuery = "\
        SELECT b.*, a.author_name, g.genre_name"+ (user_id ? ', m.mark_value' : '') +"\
        FROM `books` AS `b`\
        INNER JOIN `books_authors` AS `ba` ON b.id = ba.book_id\
        INNER JOIN `authors` AS `a` ON ba.author_id = a.id\
        INNER JOIN `books_genres` AS `bg` ON b.id = bg.book_id\
        INNER JOIN `genres` AS `g` ON bg.genre_id = g.id\
        "+ (user_id ? " LEFT JOIN `marks` AS `m` ON b.id = m.book_id AND m.user_id = '"+user_id+"'": "")+"\
        WHERE b.status = 1\
        "+ (req.params.genre_id ? " AND genre_id = '"+req.params.genre_id+"'" : "")+"\
        "+ (req.query.authors ? " AND author_id IN ('"+req.query.authors+"')" : "")+"\
        "+ (req.query.mark ? " AND average_mark >= '"+req.query.mark+"'" : "")+"\
        ORDER BY b.created_at DESC\
    ;";

    const subscriptionsQuery = "\
        SELECT GROUP_CONCAT(s.book_id) AS ids FROM `subscriptions` AS `s`\
        WHERE s.user_id = '"+user_id+"'\
    ;";

    const lastMarks = "\
        SELECT m.*, b.book_name, b.id AS book_id, u.email, u.id AS user_id, g.id AS genre_id FROM `marks` AS `m`\
        INNER JOIN `books` AS `b` ON m.book_id = b.id\
        INNER JOIN `users` AS `u` ON m.user_id = u.id\
        INNER JOIN `books_genres` AS `bg` ON b.id = bg.book_id\
        INNER JOIN `genres` AS `g` ON bg.genre_id = g.id\
        "+ (req.params.genre_id ? " AND genre_id = "+req.params.genre_id : "")+"\
        ORDER BY m.updated_at DESC\
        LIMIT 5\
    ;";
    
    // execute query
    db.query(pagesQuery+keywordsQuery+booksQuery+genresQuery+lastMarks+authorsQuery+subscriptionsQuery, (err, results) => {
      if (err) {
        res.redirect('/');
      }
      const currentGenre = results[3].find(item => item.id === +req.params.genre_id);
      res.render(!isAjaxRequest ? 'books.ejs' : 'partials/book-list.ejs', {
        pages: results[0],
        keywords: results[1],
        books: results[2],
        genres: results[3],
        user: req.session.user,
        lastMarks: results[4],
        authors: results[5],
        subscriptions: results[6][0].ids ? results[6][0].ids.split(',').map(item => +item) : [],
        currentGenre
      })
    });
  },

  getBook: (req, res) => {
    const keywordsQuery = "SELECT * FROM `keywords` WHERE page_id=1;";
    const user_id = req.session.user ? req.session.user.id : 0;
    const bookQuery = "\
        SELECT b.*, a.author_name, g.genre_name "+ (user_id ? ', m.mark_value' : '') +"\
        FROM `books` AS `b`\
        INNER JOIN `books_authors` AS `ba` ON b.id = ba.book_id\
        INNER JOIN `authors` AS `a` ON ba.author_id = a.id\
        INNER JOIN `books_genres` AS `bg` ON b.id = bg.book_id\
        INNER JOIN `genres` AS `g` ON bg.genre_id = g.id\
        "+ (user_id ? " LEFT JOIN `marks` AS `m` ON b.id = m.book_id AND m.user_id = '"+user_id+"'": "")+"\
        WHERE b.status = 1\
        AND b.id = "+req.params.book_id+"\
        ORDER BY b.created_at DESC\
    ;";

    const subscriptionsQuery = "\
        SELECT GROUP_CONCAT(s.book_id) AS ids FROM `subscriptions` AS `s`\
        WHERE s.user_id = '"+user_id+"'\
    ;";
    
    // execute query
    db.query(pagesQuery+keywordsQuery+bookQuery+genresQuery+subscriptionsQuery, (err, results) => {
      if (err) {
        res.redirect('/');
      }
      res.render('book.ejs', {
        pages: results[0],
        keywords: results[1],
        item: results[2][0],
        genres: results[3],
        user: req.session.user,
        subscriptions: results[4][0].ids ? results[4][0].ids.split(',').map(item => +item) : [],
      })
    });
  },

  subscriptOnBook: (req, res) => {
    const book_id = req.params.book_id;
    const user_id = req.session.user ? req.session.user.id : null;
    const subscription_type = 1;

    const query = "INSERT INTO `subscriptions`\
    (book_id, user_id, subscription_type_id, subscription_end_date) VALUES ('" +
    book_id + "', '" + user_id + "', '" + subscription_type + "', CURDATE() + INTERVAL 14 DAY);";

    db.query(query, (err, result) => {
      if (err) {
        console.log(err)
        return res.status(500).send({ message: {
          text: 'Ви повинні авторизуватися щоб мати змогу підписатися на книгу'
        } });
      }
      res.status(200).send();
    });
  },

  setMark: (req, res) => {
    const book_id = req.params.book_id;
    const mark_value = req.params.mark_value;
    const user_id = req.session.user ? req.session.user.id : null;

    const queryDelete = "DELETE FROM `marks` WHERE book_id = '"+book_id+"' AND user_id = '"+user_id+"';";
    const queryInsert = "INSERT INTO `marks`\
    (book_id, user_id, mark_value, updated_at) VALUES ('" +
    book_id + "', '" + user_id + "', '" + mark_value + "', NOW());";

    const querySetAverageMark = "UPDATE `books` SET average_mark = \
    (SELECT sum(m.mark_value)/count(*)\ FROM `marks` AS `m`\
    WHERE book_id = '"+book_id+"')\
    WHERE id = '"+book_id+"';"

    db.query(queryDelete+queryInsert+querySetAverageMark, (err, result) => {
      if (err) {
        console.log(err)
        return res.status(400).send({ message: {
          text: 'Ви повинні авторизуватися щоб мати змогу оцінити книгу'
        } });
      }
      res.status(200).send();
    });
  },

  unsetMark: (req, res) => {
    const book_id = req.params.book_id;
    const user_id = req.session.user ? req.session.user.id : null;

    const queryDelete = "DELETE FROM `marks` WHERE book_id = '"+book_id+"' AND user_id = '"+user_id+"';";

    const querySetAverageMark = "UPDATE `books` SET average_mark = \
    (SELECT sum(m.mark_value)/count(*)\ FROM `marks` AS `m`\
    WHERE book_id = '"+book_id+"')\
    WHERE id = '"+book_id+"';"

    db.query(queryDelete+querySetAverageMark, (err, result) => {
      if (err) {
        console.log(err)
        return res.status(400).send({ message: {
          text: 'Ви повинні авторизуватися щоб мати змогу відмінити оцінку'
        } });
      }
      res.status(200).send();
    });
  }
};