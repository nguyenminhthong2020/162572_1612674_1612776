var express = require('express');
var postdb=require('../models/post.model');
var catedb=require('../models/category.model');
var dateFormat = require('dateformat');
var router=express.Router();

router.get("/:postID", function(req, res) {

    var postID = parseInt(req.params.postID);
    var postAll = postdb.getAllPost();
    var cateAll=catedb.getAllCategory();         
    Promise.all([postAll, cateAll]).then( values => {
        // Lấy ra bài viết từ ID
        var thisPost=values[0].filter(x=>x.id==postID);
        for (const item of thisPost) {      
            var shortDate = dateFormat(item.post_date, "fullDate");
            item['shortDate'] = shortDate;
            var itsCate=values[1].filter(x=>x.id=item.category_id);
            item['cateName']=itsCate[0].name;
        }
        // Lấy ra bài viết cùng chuyên mục
        var listPost=values[0].filter(x=>x.category_id=thisPost[0].category_id);
        for (const item of listPost) {      
            var shortDate = dateFormat(item.post_date, "fullDate");
            item['shortDate'] = shortDate;
        }
        var parentMenu = [];
            if (values[1].length > 0) {
                parentMenu = values[1].filter(x => x.parent_id == 0);
                // Lấy ra các chuyên mục con
                for (const item of parentMenu) {
                    var childrenMenu = values[1].filter(x => x.parent_id == item.id);
                    item['childs'] = childrenMenu;
                }
            }               
        res.render("posts", {
            title:"post",
            layout: "main.hbs",
            thisPost: thisPost,
            listPost: listPost,
            parentMenu: parentMenu
        });
    })
    .catch(err => {
        console.log(err);
    })
});

module.exports = router;