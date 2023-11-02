import 'package:beauty_queen/const/colors.dart';
import 'package:beauty_queen/const/images.dart';
import 'package:beauty_queen/const/styles.dart';
import 'package:beauty_queen/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/CustomEndDrawer.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  double searchBarWidth = 1.0;
  double searchBarHeight = 0.0;
  double searchBarTranslationX = 0.0;
  double searchBarTranslationY = 0.0;
  double containerheight = 1.0;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset > 0 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
        searchBarWidth = 0.75;
        searchBarTranslationX = 50.0;
        searchBarTranslationY = -52.0;
      });
    } else if (_scrollController.offset <= 0 && _isScrolled) {
      setState(() {
        _isScrolled = false;
        searchBarWidth = 1.0;

        searchBarTranslationX = 0.0;
        searchBarTranslationY = 0.0;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160.h),
        child: CustomAppBar(
          showBagIcon2: true,
          showarrowIcon: true,
          showMenuIcon: true,
          onPressed: () {
            // Handle the button click here, e.g., open the end drawer.
            _scaffoldKey.currentState?.openEndDrawer();
          },
          isScrolled: _isScrolled,

          // Replace with your variable for scroll state
          searchBarWidth: searchBarWidth, // Replace with your desired width
          searchBarTranslationY: searchBarTranslationY,
          searchBarTranslationX: searchBarTranslationX,
          // Replace with your desired translation value
        ),
      ),
      endDrawer: const MyEndDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              SizedBox(
                height: 39.68.h,
              ),
              ////////////////////firstcontainer////////////
              Container(
                height: 163.93.h,
                width: 398.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    color: kWhiteColor,
                    boxShadow: [BoxShadow(blurRadius: 0.5.r)]),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 47.h,
                        width: 358.w,
                        decoration: BoxDecoration(
                            color: kCDGColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(11.r),
                                topRight: Radius.circular(11.r))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "رقم الطلب: #749",
                              style: TextStyle(
                                  fontFamily: kTheArabicSansLight,
                                  color: kBlackColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "تم التسليم",
                              style: TextStyle(
                                  fontFamily: kTheArabicSansLight,
                                  color: const Color(0xff169D00),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ///////////////second row/////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: 'عدد العناصر:',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: kTextGrayColor),
                          ),
                          TextSpan(
                            text: '5 قطع',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                          )
                        ])),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: 'تاريخ الطلب:',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: kTextGrayColor),
                          ),
                          TextSpan(
                            text: '20/09/2022',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: kBlackColor),
                          )
                        ])),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 41.22.h,
                          width: 110.07.w,
                          color: klPinkColor,
                          child: Center(
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'مجموع الفاتورة\n',
                                style: TextStyle(
                                    fontFamily: kTheArabicSansLight,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kBlackColor),
                              ),
                              TextSpan(
                                text: '1000 LD',
                                style: TextStyle(
                                    fontFamily: kTheArabicSansLight,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor),
                              )
                            ])),
                          ),
                        ),
                        /////////////second container///////////
                        GestureDetector(
                          onTap: () {
                            _showModalSheet(context);
                          },
                          child: Container(
                              height: 41.22.h,
                              width: 142.38.w,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '     تفاصيل الطلب',
                                    style: TextStyle(
                                        fontFamily: kTheArabicSansLight,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kWhiteColor),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        color: kWhiteColor,
                                        size: 15.r,
                                      ))
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              /////////////////////////////////////////////
              Container(
                height: 163.93.h,
                width: 398.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    color: kWhiteColor,
                    boxShadow: [BoxShadow(blurRadius: 0.5.r)]),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 47.h,
                        width: 358.w,
                        decoration: BoxDecoration(
                            color: kCDGColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(11.r),
                                topRight: Radius.circular(11.r))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "رقم الطلب: #749",
                              style: TextStyle(
                                  fontFamily: kTheArabicSansLight,
                                  color: kBlackColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "تم التسليم",
                              style: TextStyle(
                                  fontFamily: kTheArabicSansLight,
                                  color: const Color(0xff169D00),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ///////////////second row/////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: 'عدد العناصر:',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: kTextGrayColor),
                          ),
                          TextSpan(
                            text: '5 قطع',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                          )
                        ])),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: 'تاريخ الطلب:',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: kTextGrayColor),
                          ),
                          TextSpan(
                            text: '20/09/2022',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: kBlackColor),
                          )
                        ])),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 41.22.h,
                          width: 110.07.w,
                          color: klPinkColor,
                          child: Center(
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'مجموع الفاتورة\n',
                                style: TextStyle(
                                    fontFamily: kTheArabicSansLight,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kBlackColor),
                              ),
                              TextSpan(
                                text: '1000 LD',
                                style: TextStyle(
                                    fontFamily: kTheArabicSansLight,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor),
                              )
                            ])),
                          ),
                        ),
                        /////////////second container///////////
                        GestureDetector(
                          onTap: () {
                            _showModalSheet(context);
                          },
                          child: Container(
                              height: 41.22.h,
                              width: 142.38.w,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '     تفاصيل الطلب',
                                    style: TextStyle(
                                        fontFamily: kTheArabicSansLight,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kWhiteColor),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        color: kWhiteColor,
                                        size: 15.r,
                                      ))
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              ////////////////second contianer//////////////
              Container(
                height: 163.93.h,
                width: 398.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    color: kWhiteColor,
                    boxShadow: [BoxShadow(blurRadius: 0.5.r)]),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 47.h,
                        width: 358.w,
                        decoration: BoxDecoration(
                            color: kCDGColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(11.r),
                                topRight: Radius.circular(11.r))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "رقم الطلب: #749",
                              style: TextStyle(
                                  fontFamily: kTheArabicSansLight,
                                  color: kBlackColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'إلغيت',
                              style: TextStyle(
                                  fontFamily: kTheArabicSansLight,
                                  color: kOrangeColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ///////////////second row/////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: 'عدد العناصر:',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: kTextGrayColor),
                          ),
                          TextSpan(
                            text: '5 قطع',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                          )
                        ])),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: 'تاريخ الطلب:',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: kTextGrayColor),
                          ),
                          TextSpan(
                            text: '20/09/2022',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: kBlackColor),
                          )
                        ])),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 41.22.h,
                          width: 110.07.w,
                          color: klPinkColor,
                          child: Center(
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'مجموع الفاتورة\n',
                                style: TextStyle(
                                    fontFamily: kTheArabicSansLight,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kBlackColor),
                              ),
                              TextSpan(
                                text: '1000 LD',
                                style: TextStyle(
                                    fontFamily: kTheArabicSansLight,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor),
                              )
                            ])),
                          ),
                        ),
                        /////////////second container///////////
                        GestureDetector(
                          onTap: () {
                            _showModalSheet(context);
                          },
                          child: Container(
                              height: 41.22.h,
                              width: 142.38.w,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '     تفاصيل الطلب',
                                    style: TextStyle(
                                        fontFamily: kTheArabicSansLight,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kWhiteColor),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        color: kWhiteColor,
                                        size: 15.r,
                                      ))
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              //////////////////////////////third container/////////////////////
              Container(
                height: 163.93.h,
                width: 398.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    color: kWhiteColor,
                    boxShadow: [BoxShadow(blurRadius: 0.5.r)]),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 47.h,
                        width: 358.w,
                        decoration: BoxDecoration(
                            color: kCDGColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(11.r),
                                topRight: Radius.circular(11.r))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "رقم الطلب: #749",
                              style: TextStyle(
                                  fontFamily: kTheArabicSansLight,
                                  color: kBlackColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "تم التسليم",
                              style: TextStyle(
                                  fontFamily: kTheArabicSansLight,
                                  color: const Color(0xff169D00),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ///////////////second row/////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: 'عدد العناصر:',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: kTextGrayColor),
                          ),
                          TextSpan(
                            text: '5 قطع',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                          )
                        ])),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: 'تاريخ الطلب:',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: kTextGrayColor),
                          ),
                          TextSpan(
                            text: '20/09/2022',
                            style: TextStyle(
                                fontFamily: kTheArabicSansLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: kBlackColor),
                          )
                        ])),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 41.22.h,
                          width: 110.07.w,
                          color: klPinkColor,
                          child: Center(
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'مجموع الفاتورة\n',
                                style: TextStyle(
                                    fontFamily: kTheArabicSansLight,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kBlackColor),
                              ),
                              TextSpan(
                                text: '1000 LD',
                                style: TextStyle(
                                    fontFamily: kTheArabicSansLight,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor),
                              )
                            ])),
                          ),
                        ),

                        /////////////second container///////////
                        GestureDetector(
                          onTap: () {
                            _showModalSheet(context);
                          },
                          child: Container(
                              height: 41.22.h,
                              width: 142.38.w,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '     تفاصيل الطلب',
                                    style: TextStyle(
                                        fontFamily: kTheArabicSansLight,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kWhiteColor),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: kWhiteColor,
                                    size: 15.r,
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _showModalSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: kWhiteColor,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                size: 30.r,
                color: kPrimaryColor,
              ),
            ),
          ],
          title: Text(
            "This is a Demo",
            style: TextStyle(
              fontFamily: kTheArabicSansLight,
              color: kBlackColor,
              fontSize: 23.74.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(kcardImage), // Background image
                    Padding(
                      padding: EdgeInsets.fromLTRB(32.w, 25.h, 32.w, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Order information
                        ],
                      ),
                    ),
                    Positioned(
                      top: 110.h,
                      right: 40.w,
                      child: Text(
                        'Test Products',
                        style: TextStyle(
                          fontFamily: kTheArabicSansLight,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: kBlackColor,
                        ),
                      ),
                    ),
                    // Product information columns
                    Padding(
                      padding:
                          EdgeInsets.only(top: 130.h, left: 25.w, right: 20.w),
                      child: Column(
                        children: [
                          // Product details
                        ],
                      ),
                    ),
                  ],
                ),
                // Divider
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        endIndent: 10.w,
                        color: kTextGrayColor,
                        thickness: 1.w,
                        indent: 10.w,
                      ),
                    ),
                    Text(
                      'Product"s number',
                      style: TextStyle(
                        fontFamily: kTheArabicSansLight,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        color: kTextGrayColor,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      '100 pieces',
                      style: TextStyle(
                        fontFamily: kTheArabicSansLight,
                        fontSize: 19.53.sp,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        endIndent: 10.w,
                        color: kTextGrayColor,
                        thickness: 1.w,
                        indent: 10.w,
                      ),
                    ),
                  ],
                ),
                // Container for delivery information
                Container(
                  height: 137.9.h,
                  width: 398.51.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: kWhiteColor,
                    boxShadow: [BoxShadow(blurRadius: 0.5.r)],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Column(
                      children: [
                        // Delivery information
                      ],
                    ),
                  ),
                ),
                // Rows displaying details
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Discount information
                  ],
                ),
                // Total price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Total price
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
