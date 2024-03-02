class ProductData {
  String? id;
  String? title;
  String? description;
  String? author;
  String? category;
  String? coverUrl;
  String? price;
  String? usedFor;
  String? phoneNumber;


  ProductData(
      {this.id,
      this.title,
      this.description,
      this.author,
      this.category,
      this.price,
      this.coverUrl,
      this.phoneNumber,
      this.usedFor,
      });

  ProductData.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }

    if (json["author"] is String) {
      author = json["author"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["coverUrl"] is String) {
      coverUrl = json["coverUrl"];
    }
    if (json["price"] is String) {
      price = json["price"];
    }
    if (json["phoneNumber"] is String) {
      phoneNumber = json["phoneNumber"];
    }
    if (json["usedFor"] is String) {
      usedFor = json["usedFor"];
    }
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["description"] = description;
    _data["author"] = author;
    _data["category"] = category;
    _data["coverUrl"] = coverUrl;
    _data["price"] = price;
    _data["usedFor"] = usedFor;
    _data["phoneNumber"] = phoneNumber;


    return _data;
  }
}