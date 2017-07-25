/**
 * Created by wangzhen on 17/7/25.
 */
define(['jquery','underscore','backbone','/js/'+app.action+'.js'],function($,_,Backbone,module){
  return {
    init: function(){
      module.run();
    }
  }
});
