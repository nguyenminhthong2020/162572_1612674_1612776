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
module.exports = {
    getAllCategory: getAllCategory,
    getTopCategory: getTopCategory
};