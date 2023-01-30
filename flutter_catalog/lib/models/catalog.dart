class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);
}

final products = [
  Item(
    "Hackerrank", 
    "iphone 13", 
    "Apple iphone 12th generation", 
     999, 
    "#33505a",
    "https://m.media-amazon.com/images/I/71E5zB1qbIL._SL1500_.jpg");
];
