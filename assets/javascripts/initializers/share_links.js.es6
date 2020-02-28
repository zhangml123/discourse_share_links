import Sharing from 'discourse/lib/sharing';

export default {
  name: 'share_links',

  initialize: function() {

    Sharing.addSource({
      id: 'wechat',
      icon: "fab-weixin",
      generateUrl: function(link) {
        return ("http://s.jiathis.com/qrcode.php?url=" + encodeURIComponent(link));
      },
      shouldOpenInPopup: true,
      popupHeight: 200
    });

  }
};