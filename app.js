const express = require('express');
const fileUpload = require('express-fileupload');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const path = require('path');
const app = express();
const session = require("express-session");
const cookieParser = require('cookie-parser');

const { getHomePage } = require('./routes/index');
const { getFeedbackPage, addFeedback } = require('./routes/feedback');
const { getSignupPage, getLoginPage, registerUser, loginUser, logoutUser, sessionChecker } = require('./routes/auth');
const { getAbotPage } = require('./routes/about');
const { getBooks, getBook, subscriptOnBook, setMark, unsetMark } = require('./routes/books');
const port = 2000;

// create connection to database
// the mysql.createConnection function takes in a configuration object which contains host, user, password and the database name.
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'RooT1234',
    database: 'web_prog',
    multipleStatements: true
});

// connect to database
db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('Connected to database');
});
global.db = db;

app.use(cookieParser());

app.use(session({
    key: "user_sid",
    secret: "132456543tegrb453g4g",
    resave: false,
    saveUninitialized: false,
    cookie: {
        expires: 600000
    }
}));

// configure middleware
app.set('port', process.env.port || port); // set express to use this port
app.set('views', __dirname + '/views'); // set express to look in this folder to render our view
app.set('view engine', 'ejs'); // configure template engine
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json()); // parse form data client
app.use('/static', express.static(path.join(__dirname, 'public'))) // configure express to use public folder
app.use(fileUpload()); // configure fileupload

// routes for the app

app.get('/', getHomePage);
app.get('/books', getBooks);
app.get('/book/:book_id', getBook);
app.post('/books/:book_id/subscript', subscriptOnBook);
app.post('/books/:book_id/mark/set/:mark_value', setMark);
app.post('/books/:book_id/mark/unset/', unsetMark);
app.get('/genre/:genre_id/books', getBooks);

app.route('/signup')
    .get(sessionChecker, getSignupPage);
app.post('/auth/signup', registerUser);
app.route('/signin')
    .get(sessionChecker, getLoginPage);
app.post('/auth/signin', loginUser);
app.get('/signout', logoutUser);

app.get('/feedback', getFeedbackPage);
app.post('/feedback/add', addFeedback);
app.get('/about', getAbotPage);

// set the app to listen on the port
app.listen(port, () => {
    console.log(`Server running on port: ${port}`);
});