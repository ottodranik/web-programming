const { pagesQuery, genresQuery } = require('./shared');

module.exports = {
    getHomePage: (req, res) => {
        global.currentPage = 1;
        const keywordsQuery = "SELECT * FROM `keywords` WHERE page_id="+currentPage+";";
        const user_id = req.session.user ? req.session.user.id : 0;
        const lastBooksQuery = "\
            SELECT b.*, a.author_name "+ (user_id ? ', m.mark_value' : '') +"\
            FROM `books` AS `b`\
            INNER JOIN `books_authors` AS `ba` ON b.id = ba.book_id\
            INNER JOIN `authors` AS `a` ON ba.author_id = a.id\
            "+ (user_id ? " LEFT JOIN `marks` AS `m` ON b.id = m.book_id AND m.user_id = '"+user_id+"'": "")+"\
            WHERE b.status = 1\
            ORDER BY b.created_at DESC\
            LIMIT 5\
        ;";
        const lastMarks = "\
            SELECT m.*, b.book_name, b.id AS book_id, u.email, u.id AS user_id FROM `marks` AS `m`\
            INNER JOIN `books` AS `b` ON m.book_id = b.id\
            INNER JOIN `users` AS `u` ON m.user_id = u.id\
            ORDER BY m.updated_at DESC\
            LIMIT 5\
        ;";

        const subscriptionsQuery = "\
            SELECT GROUP_CONCAT(s.book_id) AS ids FROM `subscriptions` AS `s`\
            WHERE s.user_id = '"+(req.session.user ? req.session.user.id : 0)+"'\
        ;";

        // execute query
        db.query(pagesQuery+keywordsQuery+genresQuery+lastBooksQuery+lastMarks+subscriptionsQuery, (err, results) => {
            if (err) {
                res.redirect('/');
            }
            res.render('index.ejs', {
                pages: results[0],
                keywords: results[1],
                genres: results[2],
                books: results[3],
                user: req.session.user,
                lastMarks: results[4],
                subscriptions: results[5][0].ids ? results[5][0].ids.split(',').map(item => +item) : [],
            });
        });
    },
};