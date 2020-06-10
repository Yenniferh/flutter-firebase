// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'Product.dart';

class CartModel extends ChangeNotifier {
  ProductModel _catalog;

  //bool _state= true; //true= se puede editar, false= listo y publico
  final List<int> _itemIds = [];

  ProductModel get catalog => _catalog;

  set catalog(ProductModel newCatalog) {
    //_state=true;
    assert(newCatalog != null);
    assert(_itemIds.every((id) => newCatalog.getItem(id) != null),
    'The catalog $newCatalog does not have one of $_itemIds in it.');
    _catalog = newCatalog;

    notifyListeners();
  }

  void closeCatalog(ProductModel newCatalog) {
    //TODO Limpiar la vista
  }

  /// List of items in the cart.
  List<Product> get items =>
      _itemIds.map((id) => _catalog.getItem(id)).toList();

  /// The current total price of all items.


  void add(Product item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void del(Product product) {
    _itemIds.remove(product.id);
  }
}
