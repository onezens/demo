/**
 * `prod`
 *
 * ---------------------------------------------------------------
 *
 * This Grunt tasklist will be executed instead of `default` when
 * your Sails app is lifted in a production environment (e.g. using
 * `NODE_ENV=production node app`).
 *
 * For more information see:
 *   http://sailsjs.org/documentation/anatomy/my-app/tasks/register/prod-js
 *
 */
module.exports = function (grunt) {
  grunt.registerTask('prod', [
    'compileAssets',
    'concat',
    'uglify:dist',
    'uglify:modules', // 压缩自定义模块
    'cssmin:dist',
    'cssmin:modules', // 压缩自定义 css
    'sails-linker:prodJs',
    'sails-linker:prodStyles',
    'sails-linker:devTpl',
    'sails-linker:prodJsJade',
    'sails-linker:prodStylesJade',
    'sails-linker:devTplJade'
  ]);
};


// module.exports = function(grunt) {
//   grunt.registerTask('prod', [
//     'compileAssets',
//     'concat',
//     'uglify',
//     'cssmin',
//     'sails-linker:prodJs',
//     'sails-linker:prodStyles',
//     'sails-linker:devTpl',
//     'sails-linker:prodJsJade',
//     'sails-linker:prodStylesJade',
//     'sails-linker:devTplJade'
//   ]);
// };
