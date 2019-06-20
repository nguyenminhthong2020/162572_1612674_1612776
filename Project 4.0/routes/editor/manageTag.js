var express = require('express');
var postdb=require('../../models/post.model');
var tagdb=require('../../models/tag.model');
var post_tageddb=require('../../models/post_taged.model');
var dateFormat = require('dateformat');
var router=express.Router();

router.get('/all',(req,res,next)=>{
    var postAll=postdb.getAllPost();
    var tagAll=tagdb.getAllTag();
    var postTagAll=post_tageddb.getAllPostTag();
    Promise.all([
        postAll,
        tagAll,
        postTagAll])
        .then( values =>{
            var listTag=values[1];
            for (const item of listTag) {
                var itsPost=values[2].filter(x=>x.tag_id==item.id);
                var amount=0;
                for(const item of itsPost)
                {
                    amount=amount+1;
                }
                item['amount']=amount;
            }
            // Lấy tên để hiển thị ở mini-icon                       
            var userName="editor";
            if(req.session.user)
            userName=req.session.user.name;
        res.render('editor/tags', {
        layout: 'editor.hbs',
        listTag:listTag,
        userName: userName
        })
    }).catch(next)
})
module.exports=router;