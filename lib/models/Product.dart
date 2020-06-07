class Product {
  String name;
  double price;
  String category;
  //Category catergory;
  Product.initial()
      : name = '',
        price = 0,
        category = '';

  Product({ this.name, this.price, this.category });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      category: json['category'],
    );
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