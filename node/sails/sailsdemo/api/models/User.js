/**
 * User.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */
const bcrypt = require('bcrypt');

module.exports = {

  attributes: {
    siteName: {
      type: 'string',
      require: true,
      minLength: 1,
      maxLength: 10
    },
    email: {
      type: 'email',
      unique: true,
      require:true
    },
    password: {
      type: 'string',
      require: true,
      minLength: 6
    },
    siteDesc: {
      type: 'string',
      defaultsTo: 'no description',
      maxLength: 40
    },
    isAdmin: {
      type: 'boolean',
      defaultsTo: false
    }
  },

  //创建前对用户名和密码加密
  beforeCreate: function (values, cb) {
    bcrypt.genSalt(10, function(err, salt) {
      bcrypt.hash(values.password, salt, function(err, hash) {
        if(err) return cb(err);
        values.password = hash;
        // 执行用户定义回调
        cb();
      });
    });
  },
  afterCreate: function (createdUser, cb) {
    this.updateSite(user);
    cb();
  },
// 用户信息更新时，更新站点信息
  afterUpdate: function (user,cb) {
    this.updateSite(user);
    cb();
  },
// 更新站点信息
  updateSite: function(user){
    sails.config.site.name = user.siteName;
    sails.config.site.desc = user.siteDesc;
  }
};

