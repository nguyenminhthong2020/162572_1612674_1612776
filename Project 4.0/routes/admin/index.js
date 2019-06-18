// index.js sẽ quản lý bài viết
var express= require('express');
var postdb=require('../../models/post.model');
var catedb=require('../../models/category.model');
var tagdb=require('../../models/tag.model');
var post_tageddb=require('../../models/post_taged.model');

var dateFormat = require('dateformat');
var router=express.Router();

router.use('/manage-category/all',require(__dirname+'/manageCategory'));


router.get('/', function (req, res) {
    res.redirect('manage-post/waitPublish');
});
router.get('/manage-post/waitPublish',(req,res,next)=>{
    var postAll=postdb.getAllPost();
    // set up main.hbs
    var cateAll=catedb.getAllCategory();
    Promise.all([
        postAll,
        cateAll])
        .then( values =>{
            var listWaitPublish=values[0].filter(x=>x.status==2);// status=1: đã xuất bản, 2:chờ xuất bản, 3: chờ duyệt
            // Lấy ra (tên) chuyên mục từ category_id, định dạng ngày chuẩn
            for (const item of listWaitPublish) {
                var itsCate = values[1].filter(x => x.id == item.category_id);
                item['itsCate'] = itsCate;
                var shortDate = dateFormat(item.post_date, "fullDate");
                item['shortDate'] = shortDate;
                item['shortStatus']='Đã duyệt';
            }
            var fullStatus='CHỜ XUẤT BẢN';
            var userName="Admin";
            if(req.session.user)
            userName=req.session.user.name;
        //console.log(rows);
        res.render('admin/waitPublishPost', {
        layout: 'admin.hbs',
        listPost:listWaitPublish,
        fullStatus:fullStatus,
        userName:userName
        })
    }).catch(next)
})
router.get('/manage-post/waitApprove',(req,res,next)=>{
    var postAll=postdb.getAllPost();
    var cateAll=catedb.getAllCategory();
    Promise.all([
        postAll,
        cateAll])
        .then( values =>{
            var listWaitApprove=values[0].filter(x=>x.status==3);// status=1: đã xuất bản, 2:chờ xuất bản, 3: chờ duyệt
            // Lấy ra (tên) chuyên mục từ category_id, định dạng ngày chuẩn
            for (const item of listWaitApprove) {
                var itsCate = values[1].filter(x => x.id == item.category_id);
                item['itsCate'] = itsCate;
                var shortDate = dateFormat(item.post_date, "fullDate");
                item['shortDate'] = shortDate;
                item['shortStatus']='Chờ duyệt';
            }
            var fullStatus='CHỜ DUYỆT';
            var userName="Admin";
            if(req.session.user)
            userName=req.session.user.name;
        //console.log(rows);
        res.render('admin/waitApprovePost', {
        layout: 'admin.hbs',
        listPost:listWaitApprove,
        fullStatus:fullStatus,
        userName:userName
        })
    }).catch(next)
})
router.get('/manage-post/Published',(req,res,next)=>{
    var postAll=postdb.getAllPost();
    // set up main.hbs
    var cateAll=catedb.getAllCategory();
    Promise.all([
        postAll,
        cateAll])
        .then( values =>{
            var listPublished=values[0].filter(x=>x.status==1);// status=1: đã xuất bản, 2:chờ xuất bản, 3: chờ duyệt
            // Lấy ra (tên) chuyên mục từ category_id, định dạng ngày chuẩn
            for (const item of listPublished) {
                var itsCate = values[1].filter(x => x.id == item.category_id);
                item['itsCate'] = itsCate;
                var shortDate = dateFormat(item.post_date, "fullDate");
                item['shortDate'] = shortDate;
                item['shortStatus']='Đã xuất bản';
            }
            var fullStatus='ĐÃ XUẤT BẢN';
            var userName="Admin";
            if(req.session.user)
            userName=req.session.user.name;
        //console.log(rows);
        res.render('admin/publishedPost', {
        layout: 'admin.hbs',
        listPost:listPublished,
        fullStatus:fullStatus,
        userName:userName
        })
    }).catch(next)
})
router.get('/manage-post/add', (req, res) => {
    var cateAll = catedb.getAllCategory();
    var tagAll = tagdb.getAllTag();
    Promise.all([cateAll, tagAll]).then(values => {        
        res.render("admin/addPost", { title: "add-post", layout: "admin.hbs", categories: values[0], tags: values[1]});
    })
        .catch(err => console.log(err));
});
router.post('/manage-post/add', (req, res) => {
    var idCopy = 1;
    var postAll=postdb.getAllPost();
    var postCopy = postdb.findById(idCopy);
    Promise.all([
        postCopy,
        postAll])
        .then(values => {
        var listPost=values[1];
        // tìm ID lớn nhất
        var maxID=1;
        for(const item of listPost)
        {
            if(maxID<item.id)
            maxID=item.id;
        }
        // set giá trị entity
        var entity=values[0];    
        entity.title = req.body.p_title;
        entity.avatar = req.body.p_avatar;
        entity.content = req.body.p_content;
        entity.thumb_img = req.body.p_img;
        entity.summary_content = req.body.p_short;
        entity.category_id = req.body.p_category;
        entity.created_by=6; // là ID của admin
        entity.id=maxID+1;
        var rs = postdb.addPost(entity);
        console.log(entity);
        rs.then(rs => { 
            console.log('Add success');
            res.redirect('/admin');
            res.json(200);
        }).catch(err => {
            console.log(err);
            res.redirect('/admin');
        });
    })
    .catch(err => {
        console.log(err);
        res.redirect('/admin');
    })
});

router.get('/edit-post/:id', (req, res) => {
    var id = req.params.id;
    var cateAll = catedb.getAllCategory();
    var tagAll = tagdb.getAllTag();
    var post = postdb.findById(id);
    var itsTag = post_tageddb.findTagByPostId(id);
    Promise.all([cateAll, tagAll, post, itsTag]).then(values => {
        //console.log(values[2]);
        if (values[2] != null) {
            for (const item of values[0]) {
                if (item.id == values[2].category_id) {
                    item['isActive'] = true;
                    break;
                }
            }
        }
        if (values[1] != null && values[3] != null) {
            for (const item of values[1]) {
                var rs = values[3].filter(x => x.tag_id == item.id);
                if (rs.length > 0) {
                    item['active'] = true;
                }
            }
        }
        var itsCate=values[0].filter(x=>x.id==values[2].category_id);
        res.render("admin/editPost", { title: "edit-post", layout: "admin.hbs", categories: values[0], itsCateName: itsCate[0].name, tags: values[1], post: values[2], id: id });
    })
        .catch(err => console.log(err));
}); 
router.post('/edit-post/:id', (req, res) => {
    var id = req.params.id;
    var entity = postdb.findById(id);
    entity.then(entity => { 
        entity.title = req.body.p_title;
        entity.avatar = req.body.p_avatar;
        entity.content = req.body.p_content;
        entity.thumb_img = req.body.p_img;
        entity.summary_content = req.body.p_short;
        entity.category_id = req.body.p_category;
        var rs = postdb.updatePost(id,entity);
        console.log(entity);
        rs.then(rs => { 
            console.log('Update success');
            res.redirect('/admin');
            res.json(200);
        }).catch(err => {
            console.log(err);
            res.redirect('/admin');
        });
    })
    .catch(err => {
        console.log(err);
        res.redirect('/admin');
    })
});
module.exports=router;