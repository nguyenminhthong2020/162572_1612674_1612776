var mysql = require('mysql');

var createConn = () => {
    return mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'qlbao'
    });
}

var getConn = () => {
    var connection = createConn();
    if (connection != null) {
        return connection;
    }
    console.log('Failed connect to db');
    return null;
}

module.exports = {
    load: sql => {
        return new Promise((resolve, reject) => {
            //kết nối.
            var conn = createConn();
            conn.connect(function (err) {
                //nếu có nỗi thì in ra
                if (err) throw err.stack;
                //nếu thành công
                //console.log('ket noi thanh cong');
            });
            conn.query(sql, function (error, results, fields) {
                if (error)
                    reject(error);
                else {
                    resolve(results)
                }
                conn.end(function (err) {
                    if (err) throw err;
                    //console.log('dong ket noi thanh cong');
                });
            });
        });
    },
    update: (tableName, idField, entity) => {
        return new Promise((resolve, reject) => {
            var id = entity[idField];
            delete entity[idField];

            var sql = `update ${tableName} set ? where ${idField} = ?`;
            var conn = createConn();
            conn.connect();
            conn.query(sql, [entity, id], (error, value) => {
                if (error) {
                    reject(error);
                } else {
                    resolve(value.changedRows);
                }
                conne.end();
            });
        });
    },
    delete: (tableName, idField, id) => {
        return new Promise((resolve, reject) => {
            var sql = `delete from ${tableName} where ${idField} = ?`;
            var conn = createConn();
            conn.connect();
            conn.query(sql, id, (error, value) => {
                if (error) {
                    reject(error);
                } else {
                    resolve(value.affectedRows);
                }
                conn.end();
            });
        });
    },
    // lấy toàn bộ dữ liệu từ table
    getAll: (tableName)=>{
        return new Promise((resolve, reject) => {
            var sql = `SELECT * from ${tableName}`;
            var conn = createConn();
            conn.connect();
            conn.query(sql, (err, value) => {
                if (err) reject(err);
                else resolve(value);
                conn.end();
            });
        })
    },
    getConn: getConn
};
