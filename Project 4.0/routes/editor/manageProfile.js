var express = require('express');
var tagdb=require('../../models/tag.model');
var userdb=require('../../models/user.model');
var post_tageddb=require('../../models/post_taged.model');
var dateFormat = require('dateformat');
var router=express.Router();

router.get('/index',(req,res,next)=>{
    var userNow=req.session.user;
    var tagAll=tagdb.getAllTag();
    var postTagAll=post_tageddb.getAllPostTag();
    Promise.all([
        userNow,
        tagAll,
        postTagAll])
        .then( values =>{
            var curUser=values[0];
            console.log(curUser);
            // Lấy ra ngày chuẩn
                console.log(`username: ${curUser.username}`);
                var shortCreateDate = dateFormat(curUser.created_at, "fullDate");
                var shortBirthday = dateFormat(curUser.birthday, "fullDate");
                curUser['shortCreateDate'] = shortCreateDate;
                curUser['shortBirthday'] = shortBirthday;
            // Lấy tên phiên đăng nhập hiện tại để hiển thị ở mini-icon                       
            var userName="editor";
            if(req.session.user)
            userName=req.session.user.name;
        res.render('editor/profile', {
        layout: 'editor.hbs',
        curUser: curUser,
        userName: userName
        })
    }).catch(next)
})
router.post('/index', (req, res) => {
    var userNow=req.session.user;
    var id=userNow.id;
    var entitys = userNow;
    Promise.all([
        entitys]).then(values => {
        var entity=values[0];
        entity.name = req.body.p_name;
        entity.birthday = req.body.p_birthday;
        entity.email = req.body.p_email;
        entity.created_at = req.body.p_created;
        var rs = userdb.updateUser(id, entity);
        console.log(entity);
        rs.then(rs => {
            console.log('Update success');
            res.redirect('/editor');
            res.json(200);
        }).catch(err => {
            console.log(err);
            res.redirect('/editor');
        });
    })
        .catch(err => {
            console.log(err);
            res.redirect('/editor');
        })
})
module.exports=router;