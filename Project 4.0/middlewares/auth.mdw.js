var createError = require('http-errors');

module.exports = {
  all: (req, res, next) => {
    if (!req.user) {
      next(); // nếu chưa đăng nhập -> thực hiện đăng nhập
    }
    else{
      //dẫn tới phiên đăng nhập hiện tại
      res.redirect(saveDirect);
    }
  },
  admin: (req, res, next) => {
    if (!req.user) {
      req.session.redirectTo = "/admin";
      res.redirect('/login');
    }
    else {
      var user = req.user;
      if (user.role_id == 5)
        next();
      else
        //(createError(403));
        res.end('You have no permission to access admin-page');
    }
  },
  editor: (req, res, next) => {
    if (!req.user) {
      req.session.redirectTo = "/editor";
      res.redirect('/login');
    }
    else {
      var user = req.user;
      if (user.role_id == 4)
        next();
      else
        //(createError(403));
        res.end('You have no permission to access editor-page');
    }
  },
  writter: (req, res, next) => {
    if (!req.user) {
      req.session.redirectTo = "/writter";
      res.redirect('/login');
    }
    else {
      var user = req.user;
      if (user.role_id == 3)
        next();
      else
        //(createError(403));
        res.end('You have no permission to access writter-page');
    }
  }
} 
