var express = require('express');
var postdb=require('../../models/post.model');
var catedb=require('../../models/category.model');
var dateFormat = require('dateformat');
var router=express.Router();

router.get('/all',(req,res,next)=>{
    var postAll=postdb.getAllPost();
    var cateAll=catedb.getAllCategory();
    Promise.all([
        postAll,
        cateAll])
        .then( values =>{
            var listCate=values[1];
            for (const item of listCate) {
                // tìm chuyên mục
                if(item.parent_id!=0)
                {
                    var itsParent = values[1].filter(x => x.id == item.parent_id);
                    item['itsParent'] = itsParent[0].name;
                }
                else
                {
                    item['itsParent']=' ';
                }
                // định dạng ngày
                var shortDate = dateFormat(item.post_date, "fullDate");
                item['shortDate'] = shortDate;
                // tìm số bài viết
                var itsPosts=values[0].filter(x=>x.category_id==item.id);
                var amount=0;
                for(const item of itsPosts)
                {
                    amount=amount+1;
                }
                item['amount']=amount;
            }            
            var userName="subscriber";
            if(req.session.user)
            userName=req.session.user.name;
        res.render('subscriber/categories', {
        layout: 'subscriber.hbs',
        listCate:listCate,
        userName: userName
        })
    }).catch(next)
})
module.exports=router;