import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qataloog/presentation/home/widgets/book_card.dart';

import '../../../core/utils/color_manager.dart';
import '../controller.dart';

class BooksGridView extends StatefulWidget {
  const BooksGridView({super.key});

  @override
  State<BooksGridView> createState() => _BooksGridViewState();
}

class _BooksGridViewState extends State<BooksGridView> {
  late Future fetchBooks;

  @override
  void initState() {
    // TODO: implement initState
    fetchBooks = BooksProvider().fetchBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context, listen: false);

    return FutureBuilder(
            future: fetchBooks,
            builder: (context, snapshot) {
              print(snapshot.data);
              // Checking if future is resolved
              if (snapshot.connectionState == ConnectionState.done) {
                print(snapshot.toString());
                // If we got an error
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      '${snapshot.error} ',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  );

                  // if we got our data
                } else if (snapshot.hasData) {
                  // Extracting data from snapshot object
                  final data = snapshot.data;
                  print("this is  $data");
                  if (data!.isNotEmpty) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return BookCard(bookModel: data[index]);
                      },
                    );
                  } else {
                    return Align(
                        alignment: Alignment.center,
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'You have Books Yet',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ));
                  }
                }
              }

              return SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  color: ColorManager.primaryOrange,
                ),
              );
            })

        //   FutureBuilder<List<BookModel>>(
        //   future: bookProvider,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasError) {
        //       return Center(child: Text('Error: ${snapshot.error}'));
        //     } else {
        //       final List<BookModel> books = snapshot.data!;
        //       print(books);
        //       setState(() {});
        //       return GridView.builder(
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 3,
        //           crossAxisSpacing: 10.0,
        //           mainAxisSpacing: 10.0,
        //           childAspectRatio: 0.7,
        //         ),
        //         itemCount: books.length,
        //         itemBuilder: (context, index) {
        //           return BookCard(bookModel: books[index]);
        //         },
        //       );
        //     }
        //   },
        // )
        ;
  }
}
