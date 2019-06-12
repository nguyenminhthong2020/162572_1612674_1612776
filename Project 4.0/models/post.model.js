var db = require('../utills/db');
var getAllPost = () =>{
    return db.getAll("posts")
}
var getTopPost = () => {
    return new Promise((resolve, reject) => {
        var sql = `SELECT * FROM  POSTS LIMIT 4`;
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
        var sql = `SELECT * FROM  POSTS WHERE VIEWS > 2000 LIMIT 10`;
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
        var sql = `SELECT * FROM posts WHERE posts.post_date + interval 10 day > curdate() + 30`;
        var conn = db.getConn();
        conn.connect();
        conn.query(sql, (err, value) => {
            if (err ) reject(err);
            else resolve(value);
            conn.end();
        });
    })
}

module.exports = {
    getAllPost: getAllPost,
    getTopPost: getTopPost,
    getTopView: getTopView,
    getNewPost: getNewPost
};