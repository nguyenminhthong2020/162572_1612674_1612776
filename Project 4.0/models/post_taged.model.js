var db = require('../utills/db');

function getAllPostTag(){
    return db.getAll("post_tageds");
}

function addPostTag(entity){
 return db.add('post_tageds', entity);
}

//find all posts by tag
function findPostsByTag(id) {
    return new Promise((resolve, reject) => {
        var sql = `SELECT p.*, t.tag_name, t.tag_id FROM post_tageds t JOIN posts p ON p.id = t.post_id WHERE t.tag_id = ?`;
        var conn = db.getConn();
        conn.connect();
        conn.query(sql, id, (err, values) => {
            if (err) reject(err);
            else resolve(values);
            conn.end();
        })
    })
}

function findTagByPostId(id) {
    return new Promise((resolve, reject) => {
        var sql = `SELECT * from post_tageds WHERE post_id = ?`;
        var conn = db.getConn(); 
        conn.connect();
        conn.query(sql, id, (err, value) => {
            if (err) reject (err);
            else resolve(value);
            conn.end();
        });
    })
;}

function deleteTagedPostById(id) {
    return db.deleteById('post_tageds', id);
}

function getPage(limit, offset, id) {
    return new Promise((resolve, reject) => {
        var sql = `SELECT p.*, t.tag_name, t.tag_id FROM post_tageds t JOIN posts p ON p.id = t.post_id WHERE t.tag_id = ? LIMIT ${limit} OFFSET ${offset}`;
        var conn = db.getConn();
        conn.connect();
        conn.query(sql, id, (err, values) => {
            if (err) reject(err);
            else resolve(values);
            conn.end();
        })
    })
}

function countPage(id) {
    return new Promise((resolve, reject) => {
        var sql = `SELECT COUNT(*) as total FROM post_tageds t JOIN posts p ON p.id = t.post_id WHERE t.tag_id = ?`;
        var conn = db.getCon();
        conn.connect();
        conn.query(sql, id, (err, values) => {
            if (err) reject(err);
            else resolve(values);
            conn.end();
        })
    })
}

module.exports = {
    getAllPostTag: getAllPostTag,
    addPostTag: addPostTag,
    findTagByPostId: findTagByPostId,
    deleteTagedPostById: deleteTagedPostById,
    findPostsByTag: findPostsByTag,
    countPage,
    getPage
}