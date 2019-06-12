var express= require('express');
var index = require('../models/index.model'); // không dùng =>thay thế bằng các model cụ thể
var postdb=require('../models/post.model');
var catedb=require('../models/category.model');
var router=express.Router();

// mapping trang danh mục, bài viết
//router.use('/categories',require(__dirname+'/categories'));
//router.use('/posts',require(__dirname+'/posts'));

// mapping trang admin, editor, writter


router.get('/',(req,res,next)=>{
    var topPost=postdb.getTopPost();
    var topView=postdb.getTopView();
    var newPost=postdb.getNewPost();    
    var topCate=catedb.getTopCategory();
    // set up main.hbs
    var cateAll=catedb.getAllCategory();
    Promise.all([
        topPost,
        topView,
        newPost,
        topCate,
        cateAll])
        .then( values =>{
            var listTopPost=values[0];
            // Lấy ra (tên) chuyên mục từ category_id
            for (const item of listTopPost) {
                var itsCate = values[4].filter(x => x.id == item.category_id);
                item['itsCate'] = itsCate;
            }
            var listTopView=values[1];
            // Lấy ra (tên) chuyên mục từ category_id
            for (const item of listTopView) {
                var itsCate1 = values[4].filter(x => x.id == item.category_id);
                item['itsCate'] = itsCate;
            }
            var listNewPost=values[2];
             // Lấy ra (tên) chuyên mục từ category_id
             for (const item of listNewPost) {
                var itsCate1 = values[4].filter(x => x.id == item.category_id);
                item['itsCate'] = itsCate;
            }
            var listTopCate=values[3];
            var parentMenu = [];
            if (values[4].length > 0) {
                parentMenu = values[4].filter(x => x.parent_id == 0);
                // Lấy ra các chuyên mục con
                for (const item of parentMenu) {
                    var childrenMenu = values[4].filter(x => x.parent_id == item.id);
                    item['childs'] = childrenMenu;
                }
            }                
        //console.log(rows);
        res.render('home', {
        listTopPost: listTopPost,
        listTopView: listTopView,
        listNewPost: listNewPost,
        parentMenu: parentMenu
        })
    }).catch(next)
})

// Nháp: localhost:3003/bonus =>> hiển thị tiêu đề của một bài viết
router.get('/bonus',(req,res,next)=>{
    Promise.all([
        catedb.getAllCategory(),
        postdb.getAllPost()])
        .then(([cate,post]) =>{
        console.log("______loading post + cate ______ and print console the category table");
        console.log(res.locals.lcCategories)
        var str=`${cate[2].id} +++  ${post[1].views}`;
        res.end(str)
        //res.end(user.)
        //res.end("bonus")
    }).catch(next)
})

module.exports=router;