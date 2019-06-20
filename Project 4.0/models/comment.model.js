var db = require('../utills/db');

var getAllComment = () =>{
    return db.getAll("comments");
}
var deletebyPostID = (postID)=>{
    var sql=`DELETE FROM comments WHERE post_id=${postID}`;
    return db.load(sql);
}
module.exports = {
    getAllComment: getAllComment,
    deletebyPostID: deletebyPostID
};