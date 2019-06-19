var db = require('../utills/db');
function getAllTag(){
    return db.getAll("tags");
}

function deleteTagById(id){
    return db.deleteById("tags", id);
}

function addNewTag(entity) {
    return db.add("tags", entity);
}

function findTagById(id) {
    return db.findById('tags', id);
}

//function updateTag(entity) {
//    return db.update('tags', entity);
//}
var updateTag = (idF, entity) => {
    //var sql=`UPDATE posts SET category_id=5 WHERE id=${id}`;
    var sql=`UPDATE tags SET name = "${entity.name}" WHERE id=${idF}`;
    return db.load(sql);
}
var addTag = (entity) => {
    //var sql=`UPDATE posts SET category_id=5 WHERE id=${id}`;
    var sql=`INSERT INTO tags (id,name,created_at, updated_at) VALUES (${entity.id},"${entity.name}","${entity.created_at}", "${entity.updated_at}")`;
    return db.load(sql);
}

module.exports = {
    getAllTag: getAllTag,
    deleteTagById: deleteTagById, 
    addNewTag: addNewTag,
    findTagById: findTagById,
    updateTag: updateTag,
    addTag:addTag
}