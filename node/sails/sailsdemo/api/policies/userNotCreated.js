/**
 * Created by wangzhen on 17/7/25.
 */


module.exports = function (req, res, next) {
  // 检查数据库中是否已经有用户
  User.find().exec(function(err,users){
    console.log(users);
    if(users.length){
      next();
    }else {
      next();
    }
  });
};
