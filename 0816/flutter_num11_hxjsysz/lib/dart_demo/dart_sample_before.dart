//定义商品Item类
class Item {
  final double price;
  final String name;

  Item({required this.name, required this.price});
}

//定义购物车类
class ShoppingCart {
  final String name;
  final DateTime date;
  final String code;
  List<Item> bookings = [];  // 初始化为空的商品列表

  double get price {
    return bookings.fold(0.0, (sum, current) => sum + current.price);
  }

  // 使用初始化语法糖简化构造函数
  ShoppingCart(this.name, this.code) : date = DateTime.now();

  getInfo() {
    return '购物车信息:' +
        '\n-----------------------------' +
        '\n用户名: $name' +
        '\n优惠码: $code' +
        '\n总价: ${price.toString()}' +
        '\n日期: $date' +
        '\n-----------------------------';
  }
}

void main() {
  ShoppingCart sc = ShoppingCart('张三', '123456');
  sc.bookings = [Item(price: 10.0, name: '苹果'), Item(name: '鸭梨', price: 20.0)];
  print(sc.getInfo());
}
