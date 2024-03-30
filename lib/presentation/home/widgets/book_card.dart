import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qataloog/core/utils/route_manager.dart';
import 'package:qataloog/core/utils/style_manager.dart';
import 'package:qataloog/presentation/home/screens/view_pdf.dart';

import '../../../domain/models/book_model.dart';

class BookCard extends StatefulWidget {
  final BookModel bookModel;
  const BookCard({Key? key, required this.bookModel}) : super(key: key);

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeRoutePush(
            context, PDFViewerPage(pdfUrl: widget.bookModel.downloadLink!));
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: 160.h,
                // clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.bookModel.cover ?? "",
                ),
              ),
              Positioned(
                bottom: 8.h,
                right: 8.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Icon(Icons.play_arrow_sharp),
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  widget.bookModel.title ?? "title",
                  overflow: TextOverflow.ellipsis,
                  style:
                      getMediumTextStyle(color: Colors.black, fontSize: 12.sp),
                ),
              ),
              Spacer(),
              Icon(Icons.bookmark_outline)
            ],
          ),
        ],
      ),
    );
  }
}
