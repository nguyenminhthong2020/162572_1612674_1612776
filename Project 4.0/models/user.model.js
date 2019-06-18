var db = require('../utills/db');

function getAllUser() {
    return db.getAll("users");
}


module.exports = {
    findById: id => {
        return db.findById('users', id);
    },
    findByUsername: userName => {
        return db.findOne('users', 'username', userName);
    },
    getAllUser: getAllUser
}