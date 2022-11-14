class Book {
  List<Result>? result;

  Book({this.result});

  Book.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? title;
  int? authorId;
  String? authorName;
  String? bookCoverUrl;
  String? categoryName;
  int? categoryId;

  Result(
      {this.title,
        this.authorId,
        this.authorName,
        this.bookCoverUrl,
        this.categoryName,
        this.categoryId});

  Result.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    authorId = json['authorId'];
    authorName = json['authorName'];
    bookCoverUrl = json['bookCoverUrl'];
    categoryName = json['categoryName'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['authorId'] = authorId;
    data['authorName'] = authorName;
    data['bookCoverUrl'] = bookCoverUrl;
    data['categoryName'] = categoryName;
    data['categoryId'] = categoryId;
    return data;
  }
}
