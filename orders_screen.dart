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
                    Image.asset(kcardImage),
                    Padding(
                      padding: EdgeInsets.fromLTRB(32.w, 25.h, 32.w, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                   
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
                    Padding(
                      padding:
                          EdgeInsets.only(top: 130.h, left: 25.w, right: 20.w),
                      child: Column(
                        children: [
               
                        ],
                      ),
                    ),
                  ],
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
            
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
   
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
