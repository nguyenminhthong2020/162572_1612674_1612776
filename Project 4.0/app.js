var express= require('express');
var exphbs=require('express-handlebars')
var app=express();
var passport = require('passport');
var flash = require('connect-flash');
var morgan = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var session = require('express-session');

//require('./middlewares/passport.mdw')(passport);
// cài đặt ứng dùng express
app.use(morgan('dev')); // log tất cả request ra console log
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
// các cài đặt cần thiết cho passport
app.use(session({
    secret: 'iloveworld',
    resave: true,
    saveUninitialized: true
}));
app.use(flash()); // use connect-flash for flash messages stored in session
app.use(passport.initialize());
app.use(passport.session()); // persistent login sessions

// set engine
app.engine('hbs', exphbs(
    {
        defaultLayout: 'main.hbs',
        layoutsDir: 'views/_layouts',
        helpers:{
            // Function to do basic mathematical operation in handlebar
            math: function(lvalue, operator, rvalue) {lvalue = parseFloat(lvalue);
                rvalue = parseFloat(rvalue);
                return {
                    "+": lvalue + rvalue,
                    "-": lvalue - rvalue,
                    "*": lvalue * rvalue,
                    "/": lvalue / rvalue,
                    "%": lvalue % rvalue
                }[operator];
            }
        }
    }
));
app.set('view engine', 'hbs');

// set static folder
app.use(express.static(__dirname + '/public'));

// set middlerwares
app.use(require('./middlewares/local.mdw'));
//require('./middlewares/session')(app);
require('./middlewares/passport.mdw')(app);
// set router
const routes = require(__dirname + '/routes');
app.use(routes);
//require((__dirname + '/routes'))(app, passport);
var saveDirect='/'; // lưu đường dẫn đến phân quyền hiện tại
var saveUsername='';
app.get('/',(req,res)=>
{
//res.end('Hello to my web!!');
res.render('home');
})
app.listen(3003,()=>
{
console.log('Server is running at http://localhost:3003');
})
