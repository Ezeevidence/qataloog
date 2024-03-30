import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qataloog/core/utils/route_manager.dart';
import 'package:qataloog/core/utils/style_manager.dart';
import 'package:qataloog/domain/models/user_model.dart';
import 'package:qataloog/presentation/auth/controller.dart';
import 'package:qataloog/presentation/auth/screens/login_screen.dart';
import 'package:qataloog/presentation/home/widgets/book_list_page.dart';

import '../../../core/shared_widgets/avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Tab> myTabs = const [
    Tab(text: 'All'),
    Tab(text: 'My Interests'),
    Tab(text: 'Books'),
    Tab(text: 'Videos'),
    Tab(text: 'Audiobooks'),
    Tab(text: 'Journals'),
    // Add more tabs as needed
  ];

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    final UserModel? user = authProvider.userModel;
    if (user == null) {
      changeRouteRemove(context, LoginScreen());
    }
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              children: [
                Row(
                  children: [
                    MAvatar(
                      imageURL: user!.profilePic!,
                      name: user.name!,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      "Hi, ${user.name}",
                      style: getMediumTextStyle(
                          color: Colors.black, fontSize: 20.sp),
                    ),
                    Spacer(),
                    Icon(CupertinoIcons.search),
                    SizedBox(
                      width: 8.w,
                    ),
                    Icon(CupertinoIcons.bookmark)
                  ],
                ),
                TabBar(
                  isScrollable: true,
                  tabs: myTabs,
                ),
                Expanded(
                    child: TabBarView(children: [
                  BooksGridView(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
