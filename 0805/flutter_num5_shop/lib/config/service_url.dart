//后端和服务器接口文件

const serviceUrl = 'http://test.baixingliangfan.cn/baixing/';
const ServicePath = {
  //商店首页信息
  'homePageContent': serviceUrl + 'wxmini/homePageContent',
  //商城首页 热卖商品
  'homePageBelowConten': serviceUrl + 'wxmini/homePageBelowConten',
  'getCategory': serviceUrl + 'wxmini/getCategory', //商品分类信息
  'wxmini/getMallGoods': serviceUrl + 'wxmini/wxmini/getMallGoods', //商品分类的商品列表
};
