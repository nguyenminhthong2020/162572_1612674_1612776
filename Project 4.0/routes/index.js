var express= require('express');
var postdb=require('../models/post.model');
var catedb=require('../models/category.model');
var auth = require('../middlewares/auth.mdw');
var dateFormat = require('dateformat');
var router=express.Router();

// mapping trang danh mục, bài viết
router.use('/categories',require(__dirname+'/categories'));
router.use('/posts',require(__dirname+'/posts'));

// mapping trang admin, editor, writter
router.use("/login", auth.all, require(__dirname + "/login"));
router.use('/admin',auth.admin,require(__dirname+'/admin/index'));
router.use('/editor',auth.editor,require(__dirname+'/editor/index'));
router.use('/writter',auth.writter,require(__dirname+'/writter/index'));

router.get('/',(req,res,next)=>{
    var topPost=postdb.getTopPost();
    var topView=postdb.getTopView();
    var newPost=postdb.getNewPost();    
    var topCate=catedb.getTopCategory();
    // set up main.hbs
    var cateAll=catedb.getAllCategory();
    var postAll=postdb.getAllPost();
    Promise.all([
        topPost,
        topView,
        newPost,
        topCate,
        cateAll,
        postAll,])
        .then( values =>{
            // Lấy ra tên đăng nhập hiện tại


            var listTopPost=values[0];
            // Lấy ra (tên) chuyên mục từ category_id, định dạng ngày chuẩn
            for (const item of listTopPost) {
                var itsCate = values[4].filter(x => x.id == item.category_id);
                item['itsCate'] = itsCate;
                var shortDate = dateFormat(item.post_date, "fullDate");
                item['shortDate'] = shortDate;
            }
            var listTopView=values[1];
            // Lấy ra (tên) chuyên mục từ category_id, định dạng ngày chuẩn
            for (const item of listTopView) {
                var itsCate1 = values[4].filter(x => x.id == item.category_id);
                item['itsCate'] = itsCate;                
                var shortDate = dateFormat(item.post_date, "fullDate");
                item['shortDate'] = shortDate;
            }
            var listNewPost=values[2];
             // Lấy ra (tên) chuyên mục từ category_id, định dạng ngày chuẩn
             for (const item of listNewPost) {
                var itsCate1 = values[4].filter(x => x.id == item.category_id);
                item['itsCate'] = itsCate;
                var shortDate = dateFormat(item.post_date, "fullDate");
                item['shortDate'] = shortDate;
            }
            var listTopCate=values[3];
            for(const item of listTopCate){
                var itsBestPost=values[5].filter(x=>x.category_id== item.id);
                item['itsBestPost']=itsBestPost[0];
            }
            var parentMenu = [];
            if (values[4].length > 0) {
                parentMenu = values[4].filter(x => x.parent_id == 0);
                // Lấy ra các chuyên mục con
                for (const item of parentMenu) {
                    var childrenMenu = values[4].filter(x => x.parent_id == item.id);
                    item['childs'] = childrenMenu;
                }
            }
        var userName="Đăng nhập";
        if(req.session.user)
            userName=req.session.user.name;
        //console.log(res.session.userName);
        res.render('home', {
        listTopPost: listTopPost,
        listTopView: listTopView,
        listNewPost: listNewPost,
        listTopCate: listTopCate,
        parentMenu: parentMenu,
        userName: userName
        })
    }).catch(next)
})

router.get('/log-out', (req, res) => {
    req.logOut();    
    req.session.user=null; // giải phóng phiên đăng nhập lưu cục bộ
    res.redirect('/');
})

module.exports=router;