var express= require('express');
var router=express.Router();
router.get('/',(req,res,next)=>{
    res.end("This is writter");
    
})
module.exports=router;