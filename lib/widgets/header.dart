import '../provider/home_page_provider.dart';
import '../provider/theme_provider.dart';
import '../widgets/logo.dart';
import '../widgets/user_account.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';

import 'drawer_button.dart';

class Header extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Header({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late Responsive _responsive;
  final GlobalKey columnKey = GlobalKey();
  double paddingValue = 10;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      print(columnKey.currentContext?.size);
      paddingValue = columnKey.currentContext?.size?.width ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    _responsive = Responsive(context);
    return Container(
      height: _responsive.responsiveHeight(forUnInitialDevices: 8),
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _responsive.responsiveWidget(
              forUnInitialDevices: Logo(),
              forLandscapeTabletScreen: DrawerButton(scaffoldKey: widget.scaffoldKey),
              forLandscapeMobileScreen: DrawerButton(
                scaffoldKey: widget.scaffoldKey,
              ),
              forPortraitTabletScreen:
                  DrawerButton(scaffoldKey: widget.scaffoldKey),
              forPortraitMobileScreen:
                  DrawerButton(scaffoldKey: widget.scaffoldKey)),
          _responsive.responsiveWidget(
            forUnInitialDevices: Spacer(),
            forLandscapeTabletScreen: Container(),
            forLandscapeMobileScreen: Container(),
            forPortraitTabletScreen: Container(),
            forPortraitMobileScreen: Container(),
          ),
          _responsive.responsiveWidget(
              forUnInitialDevices: Column(
                key: columnKey,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    height:
                        _responsive.responsiveHeight(forUnInitialDevices: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _buildTaps(tapName: 'Projects'),
                        _buildTaps(tapName: 'Solutions'),
                        _buildTaps(tapName: 'About us'),
                        _buildTaps(tapName: 'Contact us '),
                      ],
                    ),
                  ),
                  const Spacer(),
                  AnimatedPadding(
                    padding: EdgeInsets.only(
                        left: (16 *
                                Provider.of<HomePageProvider>(context)
                                    .paddingValue) +
                            _responsive.responsiveWidth(
                                    forUnInitialDevices: 3) *
                                Provider.of<HomePageProvider>(context)
                                    .paddingValue),
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      width:
                          _responsive.responsiveWidth(forUnInitialDevices: 3) +
                              16,
                      height: _responsive.responsiveHeight(
                          forUnInitialDevices: 0.3),
                      color:
                          Provider.of<ThemeProvider>(context).theme.optionColor,
                    ),
                  )
                ],
              ),
              forPortraitMobileScreen: Logo(),
              forLandscapeTabletScreen: Logo(),
              forLandscapeMobileScreen: Logo(),
              forPortraitTabletScreen: Logo()),
          const Spacer(),
          Container(
            alignment: Alignment.center,
            width: _responsive.responsiveWidth(forUnInitialDevices: 23),
            child: UserAccount(
              responsive: _responsive,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTaps({required String tapName}) {
    return GestureDetector(
      onTap: () {
        Provider.of<HomePageProvider>(context, listen: false)
            .navigateToAnotherPage(tapName);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: SizedBox(
          width: _responsive.responsiveWidth(
            forUnInitialDevices: 3,
          ),
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.contain,
            child: Text(
              tapName,
              // style: TextStyle(
              //     fontSize: _responsive.responsiveValue(
              //         forUnInitialDevices: 1.5,
              //         forLandscapeTabletScreen: 0.99,
              //         forPortraitTabletScreen: 0.89)),
            ),
          ),
        ),
      ),
    );
  }
}
