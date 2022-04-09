import '../provider/home_page_provider.dart';
import '../provider/theme_provider.dart';
import '../widgets/logo.dart';
import '../widgets/user_account.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Logo(),
          Column(
            key: columnKey,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              SizedBox(
                height: _responsive.responsiveHeight(forUnInitialDevices: 2),
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
                    left: _responsive.responsiveWidth(
                            forUnInitialDevices: 0.5) +
                        _responsive.responsiveWidth(forUnInitialDevices: 5) *
                            Provider.of<HomePageProvider>(context)
                                .paddingValue),
                duration: const Duration(milliseconds: 300),
                child: Container(
                  width: _responsive.responsiveWidth(forUnInitialDevices: 4),
                  height:
                      _responsive.responsiveHeight(forUnInitialDevices: 0.3),
                  color: Provider.of<ThemeProvider>(context).theme.optionColor,
                ),
              )
            ],
          ),
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
      child: SizedBox(
        width: _responsive.responsiveWidth(forUnInitialDevices: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: Text(
                tapName,
                // style: TextStyle(
                //     fontSize: _responsive.responsiveValue(
                //         forUnInitialDevices: 1.5,
                //         forLandscapeTabletScreen: 0.99,
                //         forPortraitTabletScreen: 0.89)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
