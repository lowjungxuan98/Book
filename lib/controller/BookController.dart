import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:imt_test/model/Book.dart';

class BookController extends GetxController {
  final List<Result> _allBookList = [];

  List<Result> get allBookList => _allBookList;

  final List<Result> _allCategory = [];

  List<Result> get allCategory => _allCategory;
  final List<Result> _bookList = [];

  List<Result> get bookList => _bookList;

  Future<void> getAllBook() async {
    _allBookList.clear();
    Map<String, dynamic> response = await jsonDecode(await rootBundle.loadString('assets/book.json'));
    _allBookList.addAll(Book.fromJson(response).result!.toList());
    _allCategory.addAll(_allBookList.distinctBy((e) => e.categoryName!));
    print(_allCategory.toString());
  }



  Future<void> getBook(String categoryName) async {
    _bookList.clear();
    _bookList.addAll(_allBookList.where((element) => element.categoryName == categoryName).toList());
    print(_bookList.toString());
  }
}
extension IterableExtension<T> on Iterable<T> {
  Iterable<T> distinctBy(Object Function(T e) getCompareValue) {
    var result = <T>[];
    forEach((element) {
      if (!result.any((x) => getCompareValue(x) == getCompareValue(element))) {
        result.add(element);
      }
    });

    return result;
  }
}