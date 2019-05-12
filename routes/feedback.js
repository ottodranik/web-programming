const { pagesQuery, genresQuery } = require('./shared');

module.exports = {
  getFeedbackPage: (req, res) => {
    global.currentPage = 3;
    const feedbacksQuery = "SELECT * FROM `feedbacks` ORDER BY created_at DESC LIMIT 5;";
    const keywordsQuery = "SELECT * FROM `keywords` WHERE page_id="+currentPage+";";

    // execute query
    db.query(pagesQuery+keywordsQuery+feedbacksQuery+genresQuery, (err, results) => {
      if (err) {
        res.redirect('/');
      }
      res.render('feedback.ejs', {
        pages: results[0],
        keywords: results[1],
        feedbacks: results[2],
        genres: results[3],
        user: req.session.user
      });
    });
  },

  addFeedback: (req, res) => {
    let name = req.body.name;
    let text = req.body.text;
    let phone = req.body.phone;
    let email = req.body.email;

    let query = "INSERT INTO `feedbacks` (client_name, phone_number, email, text, is_approved) VALUES ('" +
    name + "', '" + phone + "', '" + email + "', '" + text + "', 1)";
    db.query(query, (err, result) => {
      if (err) {
        return res.status(500).send(err);
      }
      res.redirect('/feedback');
    });
  },
};