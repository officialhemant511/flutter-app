class CatalogModel {
  static List<Item>? items;
  //  = [

  //   lets blank the list and show a error
  //   Item(
  //       id: 1,
  //       name: "iphone 12",
  //       desc: "Apple iphone 12th generation",
  //       price: 999,
  //       color: "#33505a",
  //       image: "https://m.media-amazon.com/images/I/71E5zB1qbIL._SL1500_.jpg")
  // ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

// help in choice a right one of same name constructor we only choose a constructor which consist keyword factory
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}
