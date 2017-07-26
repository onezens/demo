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
    'semantic-form': 'semantic/dist/components/form',
    'semantic-dropdown': 'semantic/dist/components/dropdown.min',
    'semantic-transition': 'semantic/dist/components/transition.min',
    'semantic-modal': 'semantic/dist/components/modal.min',
    'semantic-dimmer': 'semantic/dist/components/dimmer.min',
    'semantic-popup': 'semantic/dist/components/popup.min',
    marked: 'marked/lib/marked',
    highlightjs: 'highlightjs/highlight.pack',
    'load-image': 'blueimp-load-image/js/load-image',
    'load-image-ios': 'blueimp-load-image/js/load-image-ios',
    'load-image-orientation': 'blueimp-load-image/js/load-image-orientation',
    'load-image-meta': 'blueimp-load-image/js/load-image-meta',
    'load-image-exif': 'blueimp-load-image/js/load-image-exif',
    'load-image-exif-map': 'blueimp-load-image/js/load-image-exif-map'
  },
  packages: [
  ],
  shim: {
    highlightjs: {
      exports: 'hljs'
    },
    prism: {
      exports: 'Prism'
    }
  }
});
// 加载 app，并运行
require(['/js/common/app.js'],function(app){
  app.init();
});
