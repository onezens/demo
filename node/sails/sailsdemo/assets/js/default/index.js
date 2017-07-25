/**
 * Created by wangzhen on 17/7/25.
 */
// 每个模块暴露一个 run()方法执行
define(function(){
  return {
    run: function() {
      $('body').css('background-color','cyan');
    }
  }
});
