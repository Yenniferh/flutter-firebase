class Product {
  String name;
  double price;
  String category;
  int quantity;
  //Category catergory;
  Product.initial()
      : name = 'probando',
        price = 0,
        category = '',
        quantity=0;

  Product({ this.name, this.price, this.category });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      category: json['category'],
    );
  }

  toJson() {

    return {
      'name':this.name,
      'price':this.price,
      'category':this.category,
      'quantity':this.quantity
    };
  }
}
enum Category {
  VERDURA,
  LACTEO,
  CARNE,
  LIMPIEZA,
  DESPENSA,
  FRUTA,
  SALUD
}