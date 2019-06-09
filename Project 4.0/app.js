var express= require('express');
var exphbs=require('express-handlebars')
var app=express();

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

// set router
const routes = require(__dirname + '/routes');
app.use(routes);
app.get('/',(req,res)=>
{
//res.end('Hello to my web!!');
res.render('home');
})
app.listen(3003,()=>
{
console.log('Server is running at http://localhost:3003');
})
