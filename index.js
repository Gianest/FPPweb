const express = require("express");
const app = express();
const path = require("path");
const router = express.Router();
const exphbs = require('express-handlebars');
const bodyParser = require('body-parser')
const db = require('./api/conn')
var session = require('express-session');
app.set('views', __dirname + '/views/');
app.engine('handlebars', exphbs({ defaultLayout: 'main' }));
app.set('view engine', 'handlebars');
var hbs = require('handlebars');

app.use(session({
    secret: 'ssshhhhh',
    saveUninitialized: false,
    resave: false
}));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static('stat'));

app.get('/', (req, res) =>{
  db.getConnection(function(err) {
    if (err) throw err;
    let sql = "SELECT namstat FROM stat";
    let query = db.query(sql, function (err, result) {
    if(err) throw err;
    res.render('index', {
    results: result
    });
});
});
});

app.get('/trims', (req, res) =>{
    res.sendFile(__dirname+'/views/trims.html');
});

app.post('/tiket',(req, res) => {
db.getConnection(function(err) {
    if (err) throw err;
    let sql = "SELECT * FROM kereta WHERE stasiun LIKE ? AND stasiun LIKE ?";
    let query = db.query(sql,['%'+req.body.st1+'%','%'+req.body.st2+'%'], function (err, result) {
    if(err) throw err;
    res.render('tiket',{
      results: result
    });
});
});
});
 
app.post('/auth', function(req, res) {
	var username = req.body.username;
	var password = req.body.password;
	if (username && password) {
		db.query('SELECT * FROM user WHERE email = ? AND password = ?', [username, password], function(error, results, fields) {
			if (results.length > 0) {
				req.session.loggedin = true;
				req.session.username = username;
				res.render('admin',{title: 'test'});
				hbs.registerHelper("if", function(conditional, options) {
  				if (conditional) {
    			return options.fn(this);
				  }
				});

			} else {
				res.send('Incorrect Username and/or Password!');
			}			
		});
	} else {
		res.send('Please enter Username and Password!');
	}
});

app.get('/logout', function(req, res, next) {
  if (req.session) {
    // delete session object
    req.session.destroy(function(err) {
      if(err) {
        return next(err);
      } else {
      		hbs.registerHelper("if", function(conditional, options) {
  			if (!conditional) {
    		return options.fn(this);
			  }
			});
        return res.redirect('/');
      }
    });
  }
});


app.post('/daftar',(req, res) => {
  var username = req.body.username;
  var password = req.body.password;
  let sql = "INSERT INTO user (email,password) VALUE (?,?)";
  let query = db.query(sql,[username,password],(err, results) => {
    if(err) throw err;
    res.redirect('/');
  });
});

app.get('/auth', function(req, res) {
	if (req.session.loggedin) {
		db.getConnection(function(err) {
		    if (err) throw err;
		    let query = db.query('SELECT * FROM stat', function (err, result) {
		    if(err) throw err;
		    res.render('admin',{
		      results: result
		    });
		});
		});    
	} 
	else {
		res.send('Please login to view this page!');
	}
});	

app.get('/authka', (req, res) =>{
  db.getConnection(function(err) {
    if (err) throw err;
    let sql = "SELECT * FROM kereta";
    let query = db.query(sql, function (err, result) {
    if(err) throw err;
    res.render('adminka', {
    results: result
    });
});
});
});

app.get('/del/(:id)', function(req, res, next) {

    let id = req.params.id;

    db.query('DELETE FROM stat WHERE id_stat = ' + id, function(err, result) {
    if (err) throw err;
    res.redirect('/auth');
    });
});

app.post('/ins', function(req, res, next) {
	let sql = "INSERT INTO stat (namstat) VALUE (?)";
    db.query(sql,[req.body.insto], function(err, result) {
    if (err) throw err;
    res.redirect('/auth');
    });
});

app.get('/delka/(:id)', function(req, res, next) {
    let id = req.params.id;

    db.query('DELETE FROM kereta WHERE id_ka = ' + id, function(err, result) {
    if (err) throw err;
    res.redirect('/authka');
    });
});

app.post('/inska', function(req, res, next) {
	let sql = "INSERT INTO kereta VALUE (?,?,?,?)";
    db.query(sql,[req.body.idka,req.body.nmka,req.body.stt,req.body.hrg], function(err, result) {
    if (err) throw err;
    res.redirect('/authka');
    });
});

const PORT = process.env.PORT || 8000;

app.listen(PORT, () => console.log(`Server started on port ${PORT}`));