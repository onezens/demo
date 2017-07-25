/**
 * Created by wangzhen on 17/7/25.
 */
define(['./PassportPanel.js'], function (PassportPanel) {
  return {
    run: function () {
      var regPanel = new PassportPanel('reg');
    }
  }
});
