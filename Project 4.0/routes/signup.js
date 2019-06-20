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
    res.render("signup", { layout: false });
});


router.post('/', (req, res) => {
    var idCopy = 1;
    var userCopy = userModel.findById(idCopy);
    var userAll = userModel.getAllUser();
    Promise.all([
        userCopy,
        userAll])
        .then(values => {
            var listUser = values[1];
            // tìm ID lớn nhất
            var maxID = 1;
            for (const item of listUser) {
                if (maxID < item.id)
                    maxID = item.id;
            }
            var entity = values[0];
            entity.username = req.body.username;
            entity.id = maxID + 1;
            var rs = userModel.addUser(entity);
            console.log(entity);
            rs.then(rs => {
                console.log('ADD success');
                res.redirect('/login');
                res.json(200);
            }).catch(err => {
                console.log(err);
                res.redirect('/login');
            });
        })
        .catch(err => {
            console.log(err);
            res.redirect('/login');
        })
});

module.exports = router;