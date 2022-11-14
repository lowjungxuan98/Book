import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imt_test/controller/BookController.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({
    Key? key,
    required this.categoryName,
  }) : super(key: key);
  final String categoryName;

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  void initState() {
    Get.find<BookController>().getBook(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(builder: (bookController) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.categoryName)),
        body: ListView.builder(
          itemCount: bookController.bookList.length,
          itemBuilder: (ctx, index) {
            final item = bookController.bookList;
            return ListTile(
              leading: Image.network(item[index].bookCoverUrl ?? ""),
              title: Text(item[index].title ?? ""),
              subtitle: Text("by ${item[index].authorName}"),
            );
          },
        ),
      );
    });
  }
}
