import 'package:fire_idea_project/provider/home_page_provider.dart';
import 'package:fire_idea_project/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  late Responsive _responsive;
  String _pressedButton = 'ctr';

  @override
  void initState() {
    super.initState();
    Provider.of<HomePageProvider>(context, listen: false)
        .loadSocialMediaImage();
  }

  @override
  Widget build(BuildContext context) {
    _responsive = Responsive(context);
    return Container(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //logo column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/Icons/logo.png',
                width: _responsive.responsiveWidth(
                    forUnInitialDevices: 15),
                height: _responsive.responsiveWidth(
                    forUnInitialDevices: 13),
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: _responsive.responsiveWidth(
                    forUnInitialDevices: 20),
                child: Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. ',
                  style: TextStyle(
                      fontSize:
                          _responsive.responsiveValue(forUnInitialDevices: 2)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _buildSocialMediaIcon(imagePath: 'assets/Icons/facebook.png'),
                  _buildSocialMediaIcon(
                      imagePath: 'assets/Icons/twitter.png', size: 2),
                  _buildSocialMediaIcon(imagePath: 'assets/Icons/telegram.png'),
                  _buildSocialMediaIcon(
                      imagePath: 'assets/Icons/instagram.png'),
                ],
              )
            ],
          ),//20 from width
         SizedBox(
           width: _responsive.responsiveWidth(forUnInitialDevices: 50,forDesktopScreen: 30),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.max,
             children: [
               SingleChildScrollView(
                 padding: EdgeInsets.zero,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: _extractList(
                       Provider.of<HomePageProvider>(context).solutionsButton,
                       'Solutions'),
                 ),
               ),
               SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: _extractList(
                       Provider.of<HomePageProvider>(context).projectButton,
                       'Projects'),
                 ),
               ),
               SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: _extractList(
                       Provider.of<HomePageProvider>(context).followUsButton,
                       'FOLLOW US'),
                 ),
               ),
               //for about us column
               SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: _extractList(
                       Provider.of<HomePageProvider>(context).aboutAs, 'About us'),
                 ),
               ),
             ],
           ),
         ),//50 from width
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'social media',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:
                        _responsive.responsiveValue(forUnInitialDevices: 2)),
              ),
              const SizedBox(
                height: 7,
              ),
              SizedBox(
                width: _responsive.responsiveWidth(forUnInitialDevices: 13),
                height: _responsive.responsiveHeight(forUnInitialDevices: 20),
                child: GridView.builder(
                    itemCount:
                        Provider.of<HomePageProvider>(context).imageURL.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: _responsive.responsiveWidth(
                            forUnInitialDevices: 0.5),
                        mainAxisSpacing: _responsive.responsiveWidth(
                            forUnInitialDevices: 0.5),
                        crossAxisCount: 3),
                    itemBuilder: (context, index) => Image.network(
                          Provider.of<HomePageProvider>(context)
                              .imageURL[index],
                          fit: BoxFit.fill,
                          width: _responsive.responsiveWidth(
                              forUnInitialDevices: 4),
                          height: _responsive.responsiveWidth(
                              forUnInitialDevices: 4),
                        )),
              )//13 from width
            ],
          ),//13 from width
        ],
      ),
      padding: EdgeInsets.only(
          left: _responsive.responsiveHeight(
              forUnInitialDevices: 12,forDesktopScreen: 25),
          top: _responsive.responsiveHeight(forUnInitialDevices: 8),
          // right: _responsive.responsiveHeight(
          //     forUnInitialDevices: 18, forPortraitTabletScreen: 8,forPortraitMobileScreen: 1,forLandscapeTabletScreen:1,forLandscapeMobileScreen: 1)
        ),
      width: _responsive.responsiveWidth(forUnInitialDevices: 100),
      height: _responsive.responsiveHeight(forUnInitialDevices: 60),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/image/white background.png',
              ),
              fit: BoxFit.fill)),
    );
  }

  Widget _buildSocialMediaIcon({required String imagePath, double size = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: InkWell(
        splashColor: null,
        onTap: () {
          print('i am in $imagePath');
        },
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
          width: _responsive.responsiveWidth(
              forUnInitialDevices:
                  imagePath == 'assets/Icons/facebook.png' ? 0.9 : size),
          height: _responsive.responsiveWidth(
              forUnInitialDevices:
                  imagePath == 'assets/Icons/facebook.png' ? 1.2 : size),
        ),
      ),
    );
  }

  Widget _buildTextWithPadding(double topPadding, String text,
      [bool bold = false]) {
    return Padding(
      padding: EdgeInsets.only(
          top: _responsive.responsiveHeight(forUnInitialDevices: topPadding)),
      child: TextButton(
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.zero,
            primary: Provider.of<ThemeProvider>(context).theme.optionColor,
            splashFactory: NoSplash.splashFactory,
            shadowColor: null,
            onSurface: null,
            backgroundColor: null,
          ),
          onPressed: () {
            setState(() {
              _pressedButton = text;
            });
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: _responsive.responsiveValue(forUnInitialDevices: 1.6),
              color: text == _pressedButton
                  ? Provider.of<ThemeProvider>(context).theme.optionColor
                  : Colors.black,
            ),
          )),
    );
  }

  List<Widget> _extractList(List extractedList, String title) {
    return extractedList
        .map((text) => _buildTextWithPadding(0.1, text, text == title))
        .toList()
      ..insert(
          0,
          Text(
            title,
            style: TextStyle(
              fontSize: _responsive.responsiveValue(forUnInitialDevices: 2),
              fontWeight: FontWeight.bold,
            ),
          ));
  }
}
