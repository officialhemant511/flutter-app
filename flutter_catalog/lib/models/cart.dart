import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  // here we use all this in single class due to no change->
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  // catalog field
  CatalogModel? _catalog;

// collections of ids = store ids of each items
//  by using underscore we can make our variables private
  final List<int> _itemids = [];

// get catalog use to acces private _catalog;
  CatalogModel? get catalog => _catalog;

  set catalog(CatalogModel? newCatalog) {
    _catalog = newCatalog;
  }

  // get items in the cart
  List<Item> get items => _itemids.map((id) => _catalog!.getById(id)).toList();

  // get total price
  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  // add items
  void add(Item item) {
    _itemids.add(item.id);
  }

  // remove items
  void remove(Item item) {
    _itemids.remove(item.id);
  }
}