/**
 * Article.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

var map = function () {
  this.tags.forEach(function (tag) {
    emit(tag, 1);
  });
};

var reduce = function (key, values) {
  var total = 0;
  for (var i=0,length=values.length; i<length; i++){
    total += values[i];
  }
  return total;
}


module.exports = {

  attributes: {
    title: {
      type: 'string',
      required: true,
      minLength:1,
      maxLength: 10
    },
    content: {
      type: 'string',
      required: true,
      minLength: 1
    },
    tags : {
      type: 'array'
    },
    category: {
      model: 'category',
      required: true
    }

  },

  afterCreate: function (article, cb) {
    this.updateTags(article);
    cb();
  },
  updateTags: function (article, cb) {
    Article.native(function (err, collection) {
      if(err) res.serverError(err);
      collection.mapReduce(map, reduce, {out: 'tags'});
    })
  },
  // 文章验证前，重构标签
  beforeValidate: function(article,cb){
    if(article.tags.length) {
      var rowTags = article.tags[0].split("");
      article.tags = [];
      // 去除空标签及重复标签
      for(var i=0;i<rowTags.length;i++){
        var tag = rowTags[i].replace(" ","");
        if(tag.length>0 && (article.tags.indexOf(tag)<0)){
          article.tags.push(tag);
        }
      }
    }
    cb();
  },
};

