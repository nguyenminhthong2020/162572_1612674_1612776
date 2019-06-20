var express = require('express');
var tagdb=require('../../models/tag.model');
var userdb=require('../../models/user.model');
var post_tageddb=require('../../models/post_taged.model');
var dateFormat = require('dateformat');
var router=express.Router();

router.get('/subscriber',(req,res,next)=>{
    var roleID = 2; // 2 là quyền subscriber
    var userAll=userdb.getUserByRole(roleID);
    var tagAll=tagdb.getAllTag();
    var postTagAll=post_tageddb.getAllPostTag();
    Promise.all([
        userAll,
        tagAll,
        postTagAll])
        .then( values =>{
            var listUser=values[0];
            // Lấy ra ngày chuẩn
            for (const item of listUser) {
                console.log(`username: ${item.username}`);
                var shortCreateDate = dateFormat(item.created_at, "fullDate");
                var shortExpiryDate = dateFormat(item.expiry_date, "fullDate");
                item['shortCreateDate'] = shortCreateDate;
                item['shortExpiryDate'] = shortExpiryDate;
            }     
            // Lấy tên phiên đăng nhập hiện tại để hiển thị ở mini-icon                       
            var userName="subscriber";
            if(req.session.user)
            userName=req.session.user.name;
        res.render('subscriber/subscribers', {
        layout: 'subscriber.hbs',
        listUser: listUser,
        userName: userName
        })
    }).catch(next)
})
router.get('/writer',(req,res,next)=>{
    var roleID = 3; // 3 là quyền writer
    var userAll=userdb.getUserByRole(roleID);
    var tagAll=tagdb.getAllTag();
    var postTagAll=post_tageddb.getAllPostTag();
    Promise.all([
        userAll,
        tagAll,
        postTagAll])
        .then( values =>{
            var listUser=values[0];
            // Lấy ra ngày chuẩn
            for (const item of listUser) {
                console.log(`username: ${item.username}`);
                var shortCreateDate = dateFormat(item.created_at, "fullDate");
                var shortExpiryDate = dateFormat(item.expiry_date, "fullDate");
                item['shortCreateDate'] = shortCreateDate;
                item['shortExpiryDate'] = shortExpiryDate;
            }     
            // Lấy tên phiên đăng nhập hiện tại để hiển thị ở mini-icon                       
            var userName="subscriber";
            if(req.session.user)
            userName=req.session.user.name;
        res.render('subscriber/writers', {
        layout: 'subscriber.hbs',
        listUser: listUser,
        userName: userName
        })
    }).catch(next)
})
router.get('/editor',(req,res,next)=>{
    var roleID = 4; // 4 là quyền editor
    var userAll=userdb.getUserByRole(roleID);
    var tagAll=tagdb.getAllTag();
    var postTagAll=post_tageddb.getAllPostTag();
    Promise.all([
        userAll,
        tagAll,
        postTagAll])
        .then( values =>{
            var listUser=values[0];
            // Lấy ra ngày chuẩn
            for (const item of listUser) {
                console.log(`username: ${item.username}`);
                var shortCreateDate = dateFormat(item.created_at, "fullDate");
                var shortExpiryDate = dateFormat(item.expiry_date, "fullDate");
                item['shortCreateDate'] = shortCreateDate;
                item['shortExpiryDate'] = shortExpiryDate;
            }     
            // Lấy tên phiên đăng nhập hiện tại để hiển thị ở mini-icon                       
            var userName="subscriber";
            if(req.session.user)
            userName=req.session.user.name;
        res.render('subscriber/editors', {
        layout: 'subscriber.hbs',
        listUser: listUser,
        userName: userName
        })
    }).catch(next)
})
module.exports=router;