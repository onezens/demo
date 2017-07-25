/**
 * Created by wangzhen on 17/7/25.
 */
/**
 * 指定 Compass 配置文件，完成 sass 编译
 */
module.exports = function(grunt){
  grunt.config.set('compass',{
    dist: {
      options: {
        config: 'assets/config.rb',
        // 重要，如果不声明 assets，compass 无法找到待编译的 scss 文件
        basePath : 'assets'
      }
    }
  });
  grunt.loadNpmTasks('grunt-contrib-compass');
}
