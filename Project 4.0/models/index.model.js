// Không dùng model tổng hợp này, sẽ thay thế bằng cách gọi tất cả các model riêng lẻ theo thể loại: categories.model, post.model, ...

var db = require('../utills/db');

function bainoibat() {
    return db.load('select * from posts where views > 8500 LIMIT 4');
}
function baixemnhieu() {
    return db.load('select * from posts where views >2000 LIMIT 10');
}
function listuser() {
    return db.load('select * from users LIMIT 3');
}
module.exports = {
    baixemnhieu: baixemnhieu,
    bainoibat: bainoibat,
    listuser: listuser
};