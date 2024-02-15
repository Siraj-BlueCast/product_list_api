class ProductModel {
  num? id;
  String? title;
  String? description;
  num? price;
  num? discountPercentage;
  num? rating;
  num? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<dynamic>? images;

  ProductModel(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  ProductModel.withError(String errorMessage);

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? '';
    description = json['description'] ?? "";
    price = json['price'] ?? 0;
    discountPercentage = json['discountPercentage'] ?? 0;
    rating = json['rating'] ?? 0;
    stock = json['stock'] ?? "";
    brand = json['brand'] ?? "";
    category = json['category'] ?? "";
    thumbnail = json['thumbnail'] ?? "";
    images = json['images'] ?? [];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['description'] = this.description;
  //   data['price'] = this.price;
  //   data['discountPercentage'] = this.discountPercentage;
  //   data['rating'] = this.rating;
  //   data['stock'] = this.stock;
  //   data['brand'] = this.brand;
  //   data['category'] = this.category;
  //   data['thumbnail'] = this.thumbnail;
  //   data['images'] = this.images;
  //   return data;
  // }
}
