class CategoryModel {
  final String mallCategoryId; // 类别编号
  final String mallCategoryName; // 类别名称
  final List<dynamic> bxMallSubDto;
  final Null comments;
  final String image;

  CategoryModel({
    required this.mallCategoryId,
    required this.mallCategoryName,
    required this.bxMallSubDto,
    this.comments,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      mallCategoryId: json['mallCategoryId'],
      mallCategoryName: json['mallCategoryName'],
      bxMallSubDto: json['bxMallSubDto'],
      comments: json['comments'],
      image: json['image'],
    );
  }
}

class CategoryBigListModel {
  final List<CategoryModel> data;

  CategoryBigListModel(this.data);

  factory CategoryBigListModel.fromJson(List<dynamic> json) {
    return CategoryBigListModel(
      json
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
