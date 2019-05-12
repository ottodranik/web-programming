const { pagesQuery, genresQuery, keywordsQuery } = require('./shared');
const bcrypt = require('bcrypt');

const saltRounds = 10;

const validPassword = (password, hash) => {
  return bcrypt.compareSync(password, hash);
}

const bcryptPassword = async function(password) {
  return await bcrypt.hash(password, saltRounds);
}

const registerUser = async (req, res) => {
  let email = req.body.email;
  let password = req.body.password;

  const hashPwd = await bcryptPassword(password);
  let query = "\
    INSERT INTO `users` (email, password, status) VALUES ('" +
    email + "', '" + hashPwd + "', 1)\
  ";

  db.query((query), (error, result) => {
    if (error) {
      req.session.message = {
        text: 'Під час реєстрації сталася помилка: '+ error + '. Спробуйте ще раз.',
        is_error: true
      }
      res.redirect('/signup')
    } else {
      req.session.message = {
        text: 'Ви успішно зареєструвалися! Увійдіть у систему!'
      }
      res.redirect('/signin')
    }
  });
}

module.exports = {
  getLoginPage: (req, res) => {
    db.query(pagesQuery+keywordsQuery+genresQuery, (err, results) => {
      if (err) {
        res.redirect('/');
      }
      const message = {
        ...req.session.message
      };
      req.session.message = null;
      res.render('signin.ejs', {
        pages: results[0],
        keywords: results[1],
        genres: results[2],
        message,
        user: req.session.user
      });
    });
  },

  getSignupPage: (req, res) => {
    db.query(pagesQuery+keywordsQuery+genresQuery, (err, results) => {
      if (err) {
        res.redirect('/');
      }
      const message = {
        ...req.session.message
      };
      req.session.message = null;
      res.render('signup.ejs', {
        pages: results[0],
        keywords: results[1],
        genres: results[2],
        message,
        user: req.session.user
      });
    });
  },

  registerUser,

  loginUser: (req, res) => {
    let email = req.body.email;
    let password = req.body.password;

    let query = "SELECT * FROM `users` WHERE email = '"+ email +"'";

    db.query(query, (error, result) => {
      const user = result[0];
      console.log(user)
      if (!user || !validPassword(password, user.password)) {
        req.session.message = {
          text: 'Немає користувача з такими даними',
          is_error: true
        }
        res.redirect('/signin');
      } else {
        req.session.user = user;
        req.cookies.user_sid = user.id;
        res.redirect('/');
      }
    });
  },

  sessionChecker: (req, res, next) => {
    console.log('checker', req.session.user, req.cookies.user_sid)
    if (req.session.user && req.cookies.user_sid) {
      res.redirect('/');
    } else {
      next();
    }
  },

  logoutUser: (req, res) => {
    if (req.session.user && req.cookies.user_sid) {
      res.clearCookie('user_sid');
      req.session.user = null;
      res.redirect('/');
    } else {
      res.redirect('/signin');
    }
  }
};
