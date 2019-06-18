var express= require('express');
var router=express.Router();
router.get('/',(req,res,next)=>{
    res.end("This is editor");
    
})
module.exports=router;