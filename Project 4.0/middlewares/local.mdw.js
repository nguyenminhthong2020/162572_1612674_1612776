// thiết lập các dữ liệu để xử lý: all, topview, topcate, tags, ...

// Ví dụ: lấy ra danh sách category (trong category.model) lưu vào res.locals.lcCategories để sử dụng trong cái hàm khác 
var categoryModel = require('../models/category.model');
module.exports=(req,res,next)=>{
    categoryModel.getAllCategory().then(rows =>{
        res.locals.lcCategories = rows;
        next();
    })
}