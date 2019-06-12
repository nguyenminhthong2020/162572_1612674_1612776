var express = require('express');
var postdb=require('../models/post.model');
var catedb=require('../models/category.model');
var dateFormat = require('dateformat');
var router=express.Router();

router.get("/:cateID", function(req, res) {

    var cateID = parseInt(req.params.cateID);
    var postAll = postdb.getAllPost();
    var cateAll=catedb.getAllCategory();         
    Promise.all([postAll, cateAll]).then( values => {
        var thisCate=values[1].filter(x=>x.id==cateID);
        // Định dạng ngày chuẩn
        var listPost = values[0].filter(x => x.category_id==cateID);
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
        res.render("categories", {
            title:"archieve-post",
            layout: "main.hbs",
            thisCate: thisCate,
            listPost: listPost,
            parentMenu: parentMenu
        });
    })
    .catch(err => {
        console.log(err);
    })
});

module.exports = router;