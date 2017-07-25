/**
 * Created by wangzhen on 17/7/25.
 */


module.exports = function(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }
  else{
    return res.redirect('/login');
  }
};
