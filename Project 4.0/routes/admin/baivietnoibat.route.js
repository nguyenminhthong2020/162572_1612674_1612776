var express= require('express');
var bvnoibatModel = require('../../models/baivietnoibat.model');
var router=express.Router();
router.get('/',(req,res,next)=>{
    //res.end("This is categories");
    Promise.all([
        bvnoibatModel.bainoibat(),
        bvnoibatModel.xemnhieu()])
        .then(([noibat,xemnhieu]) =>{
        //console.log(rows);
        res.render('home', {
        bvnoibat: noibat,
        bvxemnhieu: xemnhieu
        })
    }).catch(next)
})
module.exports=router;