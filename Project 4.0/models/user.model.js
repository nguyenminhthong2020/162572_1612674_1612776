var db = require('../utills/db');

var getAllUser = () => {
    //var sql=`UPDATE posts SET category_id=5 WHERE id=${id}`;
    var sql=`SELECT * FROM USERS`;
    return db.load(sql);
}
var getUserByRole = (role) => {
    //var sql=`UPDATE posts SET category_id=5 WHERE id=${id}`;
    var sql=`SELECT * FROM USERS WHERE ROLE_ID=${role}`;
    return db.load(sql);
}
var updateUser = (idF, entity) => {
    //var sql=`UPDATE posts SET category_id=5 WHERE id=${id}`;
    var sql=`UPDATE user SET name = "${entity.name}", birthday = "${entity.birthday}", email = "${entity.email}", created_at = "${entity.created__at}" WHERE id=${idF}`;
    return db.load(sql);
}


module.exports = {
    findById: id => {
        return db.findById('users', id);
    },
    findByUsername: userName => {
        return db.findOne('users', 'username', userName);
    },
    getAllUser: getAllUser,
    getUserByRole: getUserByRole,
    updateUser: updateUser
}