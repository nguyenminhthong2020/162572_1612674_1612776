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

function updateTag(entity) {
    return db.update('tags', entity);
}
module.exports = {
    getAllTag: getAllTag,
    deleteTagById: deleteTagById, 
    addNewTag: addNewTag,
    findTagById: findTagById,
    updateTag: updateTag,
}