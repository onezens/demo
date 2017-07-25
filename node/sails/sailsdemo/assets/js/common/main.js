/**
 * Created by wangzhen on 17/7/25.
 */
// 第三方模块声明
require.config({
  baseUrl: '/bower_components/',
  paths: {
    jquery: 'jquery/dist/jquery',
    requirejs: 'requirejs/require',
    'semantic-ui': 'semantic/dist/semantic',
    underscore: 'underscore/underscore',
    backbone: 'backbone/backbone',
    'semantic-form': 'semantic/dist/components/form'
  },
  packages: [
  ]
});
// 加载 app，并运行
require(['/js/common/app.js'],function(app){
  app.init();
});
