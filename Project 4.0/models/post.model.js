var db = require('../utills/db');
var getAllPost = () =>{
    return db.getAll("posts");
}
var getTopPost = () => {
    return new Promise((resolve, reject) => {
        var sql = `SELECT * FROM  POSTS WHERE PREMIUM_STATUS =0 AND VIEWS >5000 LIMIT 4`;
        var conn = db.getConn();
        conn.connect();
        conn.query(sql, (err, value) => {
            if (err ) reject(err);
            else resolve(value);
            conn.end();
        });
    })
}
var getTopView = () => {
    return new Promise((resolve, reject) => {
        var sql = `SELECT * FROM  POSTS WHERE PREMIUM_STATUS =0 AND VIEWS >3000 LIMIT 10`;
        var conn = db.getConn();
        conn.connect();
        conn.query(sql, (err, value) => {
            if (err ) reject(err);
            else resolve(value);
            conn.end();
        });
    })
}
var getNewPost = () => {
    return new Promise((resolve, reject) => {
        var sql = `SELECT * FROM POSTS WHERE PREMIUM_STATUS =0 AND POST_DATE + interval 10 day > curdate() + 30`;
        var conn = db.getConn();
        conn.connect();
        conn.query(sql, (err, value) => {
            if (err ) reject(err);
            else resolve(value);
            conn.end();
        });
    })
}
var findById = (id) => {
    return db.findById('posts', id);
}
var updatePost = (idF, entity) => {
    //var sql=`UPDATE posts SET category_id=5 WHERE id=${id}`;
    var sql=`UPDATE posts SET title = "${entity.title}", category_id="${entity.category_id}", avatar="${entity.avatar}", content="${entity.content}", views=${entity.views}, status=${entity.status}, premium_status=${entity.premium_status}, summary_content="${entity.summary_content}", thumb_img="${entity.thumb_img}" WHERE id=${idF}`;
    console.log('IM DOING update');
    return db.load(sql);
}
var addPost = (entity) => {
    //var sql=`UPDATE posts SET category_id=5 WHERE id=${id}`;
    var sql=`INSERT INTO posts (id,title,category_id,avatar,views,status,premium_status,summary_content,content,thumb_img, created_by) VALUES (${entity.id},"${entity.title}","${entity.category_id}", "${entity.avatar}", ${entity.views}, ${entity.status}, ${entity.premium_status}, "${entity.summary_content}", "${entity.content}", "${entity.thumb_img}", ${entity.created_by})`;
    //var sql=`INSERT INTO `posts` (`id`, `avatar`, `content`, `views`, `status`, `premium_status`, `category_id`, `created_by`, `author_name`, `post_date`, `title`, `thumb_img`, `summary_content`, `fail_reason`, `created_at`, `updated_at`) VALUES`
    console.log('IM DOING add');
    return db.load(sql);
}
var setStatus = (idF,entity)=>{
    var sql=`UPDATE posts SET status=${entity.status} WHERE id=${idF}`;
    console.log('IM DOING update');
    return db.load(sql);
}

module.exports = {
    getAllPost: getAllPost,
    getTopPost: getTopPost,
    getTopView: getTopView,
    getNewPost: getNewPost,
    findById:findById,
    updatePost:updatePost,
    addPost:addPost,
    setStatus: setStatus
};