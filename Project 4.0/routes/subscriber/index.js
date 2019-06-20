// index.js sẽ quản lý bài viết
var express = require('express');
var postdb = require('../../models/post.model');
var catedb = require('../../models/category.model');
var tagdb = require('../../models/tag.model');
var post_tageddb = require('../../models/post_taged.model');
var cmtdb = require('../../models/comment.model');

var dateFormat = require('dateformat');
var router = express.Router();

router.use('/manage-category', require(__dirname + '/manageCategory'));
router.use('/manage-tag', require(__dirname + '/manageTag'));
router.use('/manage-user', require(__dirname + '/manageUser'));
router.use('/profile', require(__dirname + '/manageProfile'));

router.get('/', function (req, res) {
    res.redirect('/subscriber/profile/index');
});
router.get('/manage-post/waitPublish', (req, res, next) => {
    var postAll = postdb.getAllPost();
    // set up main.hbs
    var cateAll = catedb.getAllCategory();
    Promise.all([
        postAll,
        cateAll])
        .then(values => {
            var listWaitPublish = values[0].filter(x => x.status == 2);// status=1: đã xuất bản, 2:chờ xuất bản, 3: chờ duyệt
            // Lấy ra (tên) chuyên mục từ category_id, định dạng ngày chuẩn
            for (const item of listWaitPublish) {
                var itsCate = values[1].filter(x => x.id == item.category_id);
                item['itsCate'] = itsCate;
                var shortDate = dateFormat(item.post_date, "fullDate");
                item['shortDate'] = shortDate;
                item['shortStatus'] = 'Đã duyệt';
            }
            var fullStatus = 'CHỜ XUẤT BẢN';
            var userName = "subscriber";
            if (req.session.user)
                userName = req.session.user.name;
            //console.log(rows);
            res.render('subscriber/waitPublishPost', {
                layout: 'subscriber.hbs',
                listPost: listWaitPublish,
                fullStatus: fullStatus,
                userName: userName
            })
        }).catch(next)
})
router.get('/manage-post/waitApprove', (req, res, next) => {
    var postAll = postdb.getAllPost();
    var cateAll = catedb.getAllCategory();
    Promise.all([
        postAll,
        cateAll])
        .then(values => {
            var listWaitApprove = values[0].filter(x => x.status == 3);// status=1: đã xuất bản, 2:chờ xuất bản, 3: chờ duyệt
            // Lấy ra (tên) chuyên mục từ category_id, định dạng ngày chuẩn
            for (const item of listWaitApprove) {
                var itsCate = values[1].filter(x => x.id == item.category_id);
                item['itsCate'] = itsCate;
                var shortDate = dateFormat(item.post_date, "fullDate");
                item['shortDate'] = shortDate;
                item['shortStatus'] = 'Chờ duyệt';
            }
            var fullStatus = 'CHỜ DUYỆT';
            var userName = "subscriber";
            if (req.session.user)
                userName = req.session.user.name;
            //console.log(rows);
            res.render('subscriber/waitApprovePost', {
                layout: 'subscriber.hbs',
                listPost: listWaitApprove,
                fullStatus: fullStatus,
                userName: userName
            })
        }).catch(next)
})
router.get('/manage-post/Published', (req, res, next) => {
    var postAll = postdb.getAllPost();
    // set up main.hbs
    var cateAll = catedb.getAllCategory();
    Promise.all([
        postAll,
        cateAll])
        .then(values => {
            var listPublished = values[0].filter(x => x.status == 1);// status=1: đã xuất bản, 2:chờ xuất bản, 3: chờ duyệt
            // Lấy ra (tên) chuyên mục từ category_id, định dạng ngày chuẩn
            for (const item of listPublished) {
                var itsCate = values[1].filter(x => x.id == item.category_id);
                item['itsCate'] = itsCate;
                var shortDate = dateFormat(item.post_date, "fullDate");
                item['shortDate'] = shortDate;
                item['shortStatus'] = 'Đã xuất bản';
            }
            var fullStatus = 'ĐÃ XUẤT BẢN';
            var userName = "subscriber";
            if (req.session.user)
                userName = req.session.user.name;
            //console.log(rows);
            res.render('subscriber/publishedPost', {
                layout: 'subscriber.hbs',
                listPost: listPublished,
                fullStatus: fullStatus,
                userName: userName
            })
        }).catch(next)
})
router.get('/manage-post/add', (req, res) => {
    var cateAll = catedb.getAllCategory();
    var tagAll = tagdb.getAllTag();
    Promise.all([cateAll, tagAll]).then(values => {
        res.render("subscriber/addPost", { title: "add-post", layout: "subscriber.hbs", categories: values[0], tags: values[1] });
    })
        .catch(err => console.log(err));
});
router.post('/manage-post/add', (req, res) => {
    var idCopy = 1;
    var postAll = postdb.getAllPost();
    var postCopy = postdb.findById(idCopy);
    Promise.all([
        postCopy,
        postAll])
        .then(values => {
            var listPost = values[1];
            // tìm ID lớn nhất
            var maxID = 1;
            for (const item of listPost) {
                if (maxID < item.id)
                    maxID = item.id;
            }
            // set giá trị entity
            var entity = values[0];
            entity.title = req.body.p_title;
            entity.avatar = req.body.p_avatar;
            entity.content = req.body.p_content;
            entity.thumb_img = req.body.p_img;
            entity.summary_content = req.body.p_short;
            entity.category_id = req.body.p_category;
            entity.created_by = 6; // là ID của subscriber
            entity.id = maxID + 1;
            var rs = postdb.addPost(entity);
            console.log(entity);
            rs.then(rs => {
                console.log('Add success');
                res.redirect('/subscriber');
                res.json(200);
            }).catch(err => {
                console.log(err);
                res.redirect('/subscriber');
            });
        })
        .catch(err => {
            console.log(err);
            res.redirect('/subscriber');
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
        var itsCate = values[0].filter(x => x.id == values[2].category_id);
        res.render("subscriber/editPost", { title: "edit-post", layout: "subscriber.hbs", categories: values[0], itsCateName: itsCate[0].name, tags: values[1], post: values[2], id: id });
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
        var rs = postdb.updatePost(id, entity);
        console.log(entity);
        rs.then(rs => {
            console.log('Update success');
            res.redirect('/subscriber');
            res.json(200);
        }).catch(err => {
            console.log(err);
            res.redirect('/subscriber');
        });
    })
        .catch(err => {
            console.log(err);
            res.redirect('/subscriber');
        })
});
router.get('/edit-category/:id', (req, res) => {
    var id = req.params.id;
    var cateAll = catedb.getAllCategory();

    Promise.all([cateAll]).then(values => {
        var thisCate = values[0].filter(x => x.id == id);
        var parent_id = 0;
        var parent_name = "Không có";
        if (thisCate[0].parent_id) {
            var itsParent = values[0].filter(x => x.id == thisCate[0].parent_id);
            parent_id = itsParent[0].id;
            parent_name = itsParent[0].name;
        }
        var listParentCate = values[0].filter(x => x.parent_id == 0);
        res.render("subscriber/editCategory", { title: "edit-category", layout: "subscriber.hbs", listParentCate: listParentCate, thisCate: thisCate[0], parent_id: parent_id, parent_name: parent_name, id: id });
    })
        .catch(err => console.log(err));
});
router.post('/edit-category/:id', (req, res) => {
    var id = req.params.id;
    var entity = catedb.findById(id);
    entity.then(entity => {
        entity.name = req.body.p_title;
        entity.parent_id = req.body.p_parent;
        var rs = catedb.updateCate(id, entity);
        console.log(entity);
        rs.then(rs => {
            console.log('Update success');
            res.redirect('/subscriber/manage-category/all');
            res.json(200);
        }).catch(err => {
            console.log(err);
            res.redirect('/subscriber/manage-category/all');
        });
    })
        .catch(err => {
            console.log(err);
            res.redirect('/subscriber/manage-category/all');
        })
});
router.get('/manage-category/add', (req, res) => {
    var cateAll = catedb.getAllCategory();
    Promise.all([cateAll]).then(values => {
        var listParentCate = values[0].filter(x => x.parent_id == 0);
        res.render("subscriber/addCategory", { title: "add-category", layout: "subscriber.hbs", listParentCate: listParentCate });
    })
        .catch(err => console.log(err));
});
router.post('/manage-category/add', (req, res) => {
    var idCopy = 1;
    var cateCopy = catedb.findById(idCopy);
    var cateAll = catedb.getAllCategory();
    Promise.all([
        cateCopy,
        cateAll])
        .then(values => {
            var listCate = values[1];
            // tìm ID lớn nhất
            var maxID = 1;
            for (const item of listCate) {
                if (maxID < item.id)
                    maxID = item.id;
            }
            var entity = values[0];
            entity.name = req.body.p_title;
            entity.parent_id = req.body.p_parent;
            entity.id = maxID + 1;
            var rs = catedb.addCate(entity);
            console.log(entity);
            rs.then(rs => {
                console.log('ADD success');
                res.redirect('/subscriber/manage-category/all');
                res.json(200);
            }).catch(err => {
                console.log(err);
                res.redirect('/subscriber/manage-category/all');
            });
        })
        .catch(err => {
            console.log(err);
            res.redirect('/subscriber/manage-category/all');
        })
});
// xuất bản bài viết: set thuộc tính status=1
router.get('/action-publish-post/:id', function (req, res) {
    var cateAll = catedb.getAllCategory();
    var postAll = postdb.getAllPost();
    var id = req.params.id;
    Promise.all([cateAll, postAll]).then(values => {
        var entity = values[1].filter(x => x.id == id);
        entity.status = 1; // set status = 1 <=> đã xuất bản
        var rs = postdb.setStatus(id, entity);
        console.log(entity);
        rs.then(rs => {
            console.log('Publish success');
            res.redirect('/subscriber');
            res.json(200);
        }).catch(err => {
            console.log(err);
            res.redirect('/subscriber');
        });
    })
        .catch(err => {
            console.log(err);
            res.redirect('/subscriber');
        })
});
// Duyệt bài viết: set thuộc tính status=2
router.get('/action-approve-post/:id', function (req, res) {
    var cateAll = catedb.getAllCategory();
    var postAll = postdb.getAllPost();
    var id = req.params.id;
    Promise.all([cateAll, postAll]).then(values => {
        var entity = values[1].filter(x => x.id == id);
        entity.status = 2; // set status = 2 <=> đã duyệt, chờ xuất bản
        var rs = postdb.setStatus(id, entity);
        console.log(entity);
        rs.then(rs => {
            console.log('Publish success');
            res.redirect('/subscriber/manage-post/waitApprove');
            res.json(200);
        }).catch(err => {
            console.log(err);
            res.redirect('/subscriber/manage-post/waitApprove');
        });
    })
        .catch(err => {
            console.log(err);
            res.redirect('/subscriber/manage-post/waitApprove');
        })
});
// Từ chối bài viết nhưng không xóa khỏi database, set status = 4
router.get('/action-deny-post/:id', function (req, res) {
    var cateAll = catedb.getAllCategory();
    var postAll = postdb.getAllPost();
    var id = req.params.id;
    Promise.all([cateAll, postAll]).then(values => {
        var entity = values[1].filter(x => x.id == id);
        entity.status = 4; // set status = 4 <=> nằm ngoài phạm vi hiển thị bài viết (1-3)
        var rs = postdb.setStatus(id, entity);
        console.log(entity);
        rs.then(rs => {
            console.log('Publish success');
            res.redirect('/subscriber/manage-post/waitApprove');
            res.json(200);
        }).catch(err => {
            console.log(err);
            res.redirect('/subscriber/manage-post/waitApprove');
        });
    })
        .catch(err => {
            console.log(err);
            res.redirect('/subscriber/manage-post/waitApprove');
        })
});
// Xóa bài viết
router.get('/action-delete-post/:id', function (req, res) {
    var cateAll = catedb.getAllCategory();
    var postAll = postdb.getAllPost();
    var id = req.params.id;
    Promise.all([cateAll, postAll]).then(values => {
        //thực hiện xóa dòng các bảng tham chiếu tới post: post_taged và comment
        post_tageddb.deleteTagbyPostID(id);
        cmtdb.deletebyPostID(id);
        // đã xóa các dữ liệu tham chiếu, thực hiện xóa post
        var rs = postdb.deletePost(id);
        rs.then(rs => {
            console.log('Delete success');
            res.redirect('/subscriber/manage-post/Published');
            res.json(200);
        }).catch(err => {
            console.log(err);
            res.redirect('/subscriber/manage-post/Published');
        });
    })
        .catch(err => {
            console.log(err);
            res.redirect('/subscriber/manage-post/Published');
        })
});
router.get('/edit-tag/:id', (req, res) => {
    var id = req.params.id;
    var tagAll = tagdb.getAllTag();
    Promise.all([tagAll]).then(values => {
        var thisTag = values[0].filter(x => x.id == id);
        res.render("subscriber/editTag", { title: "edit-tag", layout: "subscriber.hbs", thisTag: thisTag[0], id: id });
    })
        .catch(err => console.log(err));
});
router.post('/edit-tag/:id', (req, res) => {
    var id = req.params.id;
    var entity = tagdb.findTagById(id);
    entity.then(entity => {
        entity.name = req.body.p_title;
        var rs = tagdb.updateTag(id, entity);
        console.log(entity);
        rs.then(rs => {
            console.log('Update success');
            res.redirect('/subscriber/manage-tag/all');
            res.json(200);
        }).catch(err => {
            console.log(err);
            res.redirect('/subscriber/manage-tag/all');
        });
    })
        .catch(err => {
            console.log(err);
            res.redirect('/subscriber/manage-tag/all');
        })
});
router.get('/manage-tag/add', (req, res) => {
    var tagAll = tagdb.getAllTag();
    Promise.all([tagAll]).then(values => {
        res.render("subscriber/addTag", { title: "add-tag", layout: "subscriber.hbs"});
    })
        .catch(err => console.log(err));
});
router.post('/manage-tag/add', (req, res) => {
    var idCopy = 1;
    var tagCopy = tagdb.findTagById(idCopy);
    var tagAll = tagdb.getAllTag();
    Promise.all([
        tagCopy,
        tagAll])
        .then(values => {
            var listTag = values[1];
            // tìm ID lớn nhất
            var maxID = 1;
            for (const item of listTag) {
                if (maxID < item.id)
                    maxID = item.id;
            }
            var entity = values[0];
            entity.name = req.body.p_title;
            entity.id = maxID + 1;
            var rs = tagdb.addTag(entity);
            console.log(entity);
            rs.then(rs => {
                console.log('ADD success');
                res.redirect('/subscriber/manage-tag/all');
                res.json(200);
            }).catch(err => {
                console.log(err);
                res.redirect('/subscriber/manage-tag/all');
            });
        })
        .catch(err => {
            console.log(err);
            res.redirect('/subscriber/manage-tag/all');
        })
});
module.exports = router;