import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imt_test/controller/BookController.dart';

import 'BookDetail.dart';

class BookCategory extends StatefulWidget {
  const BookCategory({Key? key}) : super(key: key);

  @override
  State<BookCategory> createState() => _BookCategoryState();
}

class _BookCategoryState extends State<BookCategory> {
  @override
  void initState() {
    Get.find<BookController>().getAllBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(builder: (bookController) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Book Categories"),
        ),
        body: ListView.builder(
            itemCount: bookController.allCategory.length,
            itemBuilder: (ctx, index) {
              final item = bookController.allCategory;
              return ListTile(
                title: Text(item[index].categoryName ?? ""),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BookDetail(categoryName: item[index].categoryName ?? ""),
                    ),
                  );
                },
              );
            }),
      );
    });
  }
}
