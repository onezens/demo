/**
 * AuthController
 *
 * @description :: Server-side logic for managing auths
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

const passport = require('passport');

module.exports = {

  toRegister: function (req, res) {
    return res.view('passport/register');
  },
  processLogin: function (req, res) {
    passport.authenticate('local', function (err, user, info) {
      if (err || !user){
        return res.send({
          message: info.message,
          user: user
        });
      }
      req.logIn(user, function (err) {
        if(err) res.send(err);
        else res.send({
          message: info.message,
          user: user
        });
      })
    })(req, res);
  },
  processRegister: function (req, res) {
    var user = req.allParams();
    console.log(user);
    User.create(user).exec(function (err, created) {
      if (err){
        console.log(err);
        res.view('passport/register', {err:err});
      }else{
        req.login(created, function (err, next) {
          console.log(err);
          if(err) return next(err);
          else res.redirect('/');
        })
      }
    });
  },
  logout: function (req, res) {
    req.logout();
    res.redirect('/');
  }
};

