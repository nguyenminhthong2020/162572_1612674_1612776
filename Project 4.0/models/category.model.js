var db = require('../utills/db');
var getAllCategory = () =>{
    return db.getAll("categories")
}
var getTopCategory = () => {
    return new Promise((resolve, reject) => {
        var sql = `SELECT categories.id , categories.name ,COUNT(*) as SL 
        FROM categories JOIN posts ON posts.category_id = categories.id 
        GROUP BY categories.id,categories.name
        ORDER BY COUNT(*) DESC
        LIMIT 10 OFFSET 0`;
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
    return db.findById('categories', id);
}
var updateCate = (idF, entity) => {
    //var sql=`UPDATE posts SET category_id=5 WHERE id=${id}`;
    var sql=`UPDATE categories SET name = "${entity.name}", parent_id=${entity.parent_id} WHERE id=${idF}`;
    console.log('updating categories');
    return db.load(sql);
}
var addCate = (entity) => {
    //var sql=`UPDATE posts SET category_id=5 WHERE id=${id}`;
    var sql=`INSERT INTO categories (id,name,parent_id,created_at, updated_at) VALUES (${entity.id},"${entity.name}",${entity.parent_id},"${entity.created_at}", "${entity.updated_at}")`;
    console.log('adding categories');
    return db.load(sql);
}
module.exports = {
    getAllCategory: getAllCategory,
    getTopCategory: getTopCategory,
    findById: findById,
    updateCate: updateCate,
    addCate: addCate
};