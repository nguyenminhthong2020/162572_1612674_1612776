var express = require('express');
var postdb=require('../models/post.model');
var catedb=require('../models/category.model');
var tagdb=require('../models/tag.model');
var postTageddb=require('../models/post_taged.model');
var dateFormat = require('dateformat');
var router=express.Router();

router.get("/:tagID", function(req, res) {

    var tagID = parseInt(req.params.tagID);
    var postAll = postdb.getAllPost();
    var tagAll=tagdb.getAllTag();
    var postTagedAll=postTageddb.getAllPostTag();
    var cateAll=catedb.getAllCategory();
    Promise.all([postAll, tagAll, postTagedAll,cateAll]).then( values => {
        var thisTag=values[1].filter(x=>x.id==tagID);
        // Định dạng ngày chuẩn
        var listPost = [];
        var listPostTag=values[2].filter(x=>x.tag_id==tagID);
        for(const item of listPostTag)
        {
            var p_Post=values[0].filter(x=>x.id==item.post_id);
            listPost.push(p_Post[0]);
        }
        for(const item of listPost)
        {
            var itsCate=values[3].filter(x=>x.id==item.category_id);
            var categoryName=itsCate[0].name;
            item['cateName']=categoryName;
        }
        res.render("tags", {
            title:"tags",
            layout: "main.hbs",
            thisTag: thisTag,
            listPost: listPost
        });
    })
    .catch(err => {
        console.log(err);
    })
});

module.exports = router;