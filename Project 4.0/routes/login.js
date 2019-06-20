var express = require('express');
var router = express.Router();
var passport = require('passport');
var userModel = require('../models/user.model');
//var express = require('express');
var app = express();
//var router = express.Router();
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
//var passport = require('passport');
var localStrategy = require('passport-local').Strategy;
const bcrypt= require('bcrypt')


router.get("/", function (req, res) {
    res.render("login", { layout: false });
});

router.post('/', (req, res, next) => {
    passport.authenticate('local', (err, user, info) => {
        if (err)        
            return next(err);
        if (!user) {
            return res.render('login', {
                layout: false,
                err_message: info.message
            })
        }

        req.logIn(user, err => {
            if (err) return next(err);
            var redirectTo = req.session.redirectTo;
            var temp='/'; // lưu đường dẫn đến phiên đăng nhâp hiện tại
            switch (user.role_id) {
                    case 1:
                        temp = '/';
                        break;
                    case 2:
                        temp = '/subscriber/profile/index';
                        break;
                    case 3:
                        temp = '/writter';
                        break;
                    case 4:
                        temp = '/editor/manage-post/waitPublish';
                        break;
                    case 5:
                         temp = '/admin';
                        break;
            }
            if (!redirectTo)
                redirectTo=temp;
            saveDirect=temp; // lưu đường dẫn đến phân quyền hiện tại vào biến toàn cục
            req.session.user = user; // lưu phiên đăng nhập
            delete req.session.redirectTo;
            console.log(res.locals.redirectTo);
            return res.redirect(redirectTo);
            // sự khác nhau giữ redirectTo và saveDirect khi truy cập trang phân quyền
            // redirectTo dẫn đến trang vừa truy cập trước khi dẫn tới login dù đúng quyền hay không
            // saveDirect dẫn đến trang phân quyền theo thông tin vừa đăng nhập
        });
    })(req, res, next);
})

module.exports = router;