const { pagesQuery, genresQuery } = require('./shared');

module.exports = {
  getAbotPage: (req, res) => {
    global.currentPage = 4;
    const keywordsQuery = "select * from `keywords` where page_id="+currentPage+" order by id asc;";

    // execute query
    db.query(pagesQuery+keywordsQuery+genresQuery, (err, results) => {
      if (err) {
        res.redirect('/');
      }
      res.render('about.ejs', {
        pages: results[0],
        keywords: results[1],
        genres: results[2],
        user: req.session.user
      });
    });
  }
};