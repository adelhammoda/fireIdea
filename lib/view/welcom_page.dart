import 'package:carousel_slider/carousel_slider.dart';
import 'package:fire_idea_project/classes/theme.dart';
import 'package:fire_idea_project/provider/theme_provider.dart';
import 'package:fire_idea_project/provider/welcome_page_provider.dart';
import 'package:fire_idea_project/view/home_page.dart';
import 'package:fire_idea_project/widgets/user_account.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late Responsive _responsive;
  late MyTheme _theme;
  int _imageIndex = 0;
  late Widget _imageLogo;

  late Widget _textUnderLogo;
  late Widget _text;

  late Widget _joinUsButton;

  late Widget _navigateButton;

  double _calculateIndicatorsWidth() {
    double totalWidth = _responsive.responsiveWidth(forUnInitialDevices: 50);
    if (Provider.of<WelcomePageProvider>(context).imagesURL.length < 10) {
      return _responsive.responsiveWidth(forUnInitialDevices: 5);
    } else {
      return totalWidth /
          Provider.of<WelcomePageProvider>(context).imagesURL.length;
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<WelcomePageProvider>(context, listen: false).loadImage();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = Provider.of<ThemeProvider>(context).theme;
  }

  @override
  Widget build(BuildContext context) {
    _responsive = Responsive(context);
    _imageLogo = Image.asset(
      'assets/Icons/logo.png',
      fit: BoxFit.fill,
      width: _responsive.responsiveWidth(
          forUnInitialDevices: 16,
          forPortraitMobileScreen: 20,
          forPortraitTabletScreen: 20),
      height: _responsive.responsiveWidth(
          forUnInitialDevices: 14,
          forPortraitMobileScreen: 18,
          forPortraitTabletScreen: 18),
    );
    _textUnderLogo = SizedBox(
        width: _responsive.responsiveWidth(
            forUnInitialDevices: 20,
            forPortraitMobileScreen: 30,
            forPortraitTabletScreen: 30),
        child: Text(
          'A Creative Web Development Agency',
          style: TextStyle(
            fontSize: _responsive.responsiveValue(
                forUnInitialDevices: 5.4,
                forPortraitMobileScreen: 4,
                forLandscapeTabletScreen: 3.6,
                forLandscapeMobileScreen: 4,
                forPortraitTabletScreen: 4),
            //TODO:change font weight to Helvetica Neue
            fontWeight: FontWeight.w900,
          ),
        ));
    _text = SizedBox(
        width: _responsive.responsiveWidth(
            forUnInitialDevices: 35,
            forPortraitMobileScreen: 50,
            forPortraitTabletScreen: 50),
        child: Text(
          'We ARE A STRATEGY FOCUSED, INVESTOR LEAD GENERATION MARKETING TEAM OBSESSED WITH DELIVERING GROWTH',
          style: TextStyle(
            fontSize: _responsive.responsiveValue(
                forUnInitialDevices: 3,
                forLandscapeTabletScreen: 3,
                forPortraitTabletScreen: 4,
                forPortraitMobileScreen: 4,
                forLandscapeMobileScreen: 3),
          ),
        ));
    _navigateButton = Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _responsive.responsiveWidth(forUnInitialDevices: 5)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          IconButton(
              iconSize: _responsive.responsiveValue(forUnInitialDevices: 10),
              onPressed: () {
                Provider.of<WelcomePageProvider>(context, listen: false)
                    .stopLoading();
                Navigator.of(context)
                    .pushReplacementNamed('/${HomePage.route}');
              },
              icon: Image.asset(
                'assets/Icons/arrow.png',
                fit: BoxFit.fill,
              )),
          Positioned(
            top: _responsive.responsiveHeight(forUnInitialDevices: 2),
            right: -_responsive.responsiveWidth(
                forUnInitialDevices: 8,
                forLandscapeTabletScreen: 6.3,
                forDesktopScreen: 5),
            child: Text(
              'EXPLORE',
              style: TextStyle(
                  fontSize:
                      _responsive.responsiveValue(forUnInitialDevices: 3)),
            ),
          )
        ],
      ),
    );
    _joinUsButton = ElevatedButton(
      onPressed: () {
        print('Join us button ');
      },
      child: const Text(
        'JOIN US',
        style: TextStyle(color: Color(0xffF7F7F7), fontWeight: FontWeight.w100),
      ),
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(),
          primary: const Color(0xff131415),
          elevation: 10,
          onSurface: Colors.red,
          minimumSize: Size(_responsive.responsiveWidth(forUnInitialDevices: 7),
              _responsive.responsiveHeight(forUnInitialDevices: 5))),
    );
    List<Widget> children = [buildLeftImage(), buildRightImage()];
    return Scaffold(
        body: _responsive.responsiveWidget(
            forUnInitialDevices: Row(
              children: children,
            ),
            forPortraitTabletScreen: Column(
              children: children.reversed.toList(),
            ),
            forPortraitMobileScreen: Column(
              children: children.reversed.toList(),
            )));
  }

  Widget buildRightImage() {
    return Stack(
      children: [
        SizedBox(
          width: _responsive.responsiveWidth(
              forUnInitialDevices: 50,
              forPortraitMobileScreen: 100,
              forPortraitTabletScreen: 100),
          height: _responsive.responsiveHeight(
              forUnInitialDevices: 100,
              forPortraitMobileScreen: 50,
              forPortraitTabletScreen: 50),
          child: CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                initialPage: 1,
                enableInfiniteScroll: true,
                pageSnapping: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                height: _responsive.responsiveHeight(forUnInitialDevices: 100),
                viewportFraction: 1,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                onPageChanged: (index, reason) {
                  setState(() {
                    _imageIndex = index;
                  });
                }),
            items: Provider.of<WelcomePageProvider>(context).imagesURL.isEmpty
                ? [
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/fire-idea.appspot.com/o/welcomPagePhoto%2Fbackground.png?alt=media&token=4059ba66-d1a1-4a6a-9265-8e2a1b77ff30',
                      width: _responsive.responsiveWidth(
                          forUnInitialDevices: 50,
                          forPortraitMobileScreen: 100,
                          forPortraitTabletScreen: 100),
                      height: _responsive.responsiveHeight(
                          forUnInitialDevices: 100),
                      color: Colors.grey,
                      colorBlendMode: BlendMode.hue,
                      fit: BoxFit.fill,
                    )
                  ]
                : Provider.of<WelcomePageProvider>(context)
                    .imagesURL
                    .map(
                      (imageURL) => Image.network(
                        imageURL,
                        width: _responsive.responsiveWidth(
                            forUnInitialDevices: 50,
                            forPortraitMobileScreen: 100,
                            forPortraitTabletScreen: 100),
                        height: _responsive.responsiveHeight(
                            forUnInitialDevices: 100),
                        color: Colors.grey,
                        colorBlendMode: BlendMode.hue,
                        fit: BoxFit.fill,
                      ),
                    )
                    .toList(),
          ),
        ),
        //for user account
        Positioned(
            top: _responsive.responsiveHeight(forUnInitialDevices: 4),
            right: _responsive.responsiveWidth(forUnInitialDevices: 7),
            child: UserAccount(responsive: _responsive)),
        //for the text
        Positioned(
            bottom: _responsive.responsiveHeight(
                forUnInitialDevices: 25,
                forPortraitTabletScreen: 15,
                forPortraitMobileScreen: 15),
            right: _responsive.responsiveWidth(
                forUnInitialDevices: 13.5,
                forPortraitTabletScreen: 25,
                forPortraitMobileScreen: 25),
            child: SizedBox(
              width: _responsive.responsiveWidth(
                  forUnInitialDevices: 23,
                  forPortraitTabletScreen: 50,
                  forPortraitMobileScreen: 50),
              child: Text(
                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labor.',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize:
                        _responsive.responsiveValue(forUnInitialDevices: 1.8),
                    color: _theme.backgroundColor),
              ),
            )),
        // for indicators
        Positioned(
            bottom: _responsive.responsiveHeight(forUnInitialDevices: 5),
            child: SizedBox(
              height: _responsive.responsiveHeight(forUnInitialDevices: 10),
              width: _responsive.responsiveWidth(
                  forUnInitialDevices: 50,
                  forPortraitMobileScreen: 100,
                  forPortraitTabletScreen: 100),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    Provider.of<WelcomePageProvider>(context)
                            .imagesURL
                            .isNotEmpty
                        ? Provider.of<WelcomePageProvider>(context)
                            .imagesURL
                            .length
                        : 1,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _calculateIndicatorsWidth() * 0.1),
                          child: Container(
                              width: _calculateIndicatorsWidth() * 0.8,
                              height: 2,
                              color: index == _imageIndex
                                  ? const Color(0xffFEC303)
                                  : const Color(0xffFFFFFF)),
                        )),
              ),
            ))
      ],
    );
  }

  Widget buildLeftImage() {
    return Stack(
      children: [
        Image.asset(
          'assets/image/white background.png',
          width: _responsive.responsiveWidth(
              forUnInitialDevices: 50,
              forPortraitMobileScreen: 100,
              forPortraitTabletScreen: 100),
          height: _responsive.responsiveHeight(
              forUnInitialDevices: 100,
              forPortraitMobileScreen: 50,
              forPortraitTabletScreen: 50),
          colorBlendMode: BlendMode.color,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical:
                      _responsive.responsiveHeight(forUnInitialDevices: 6),
                  horizontal:
                      _responsive.responsiveWidth(forUnInitialDevices: 8)),
              child: _responsive.responsiveWidget(
                  forUnInitialDevices: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _imageLogo,
                        SizedBox(
                          height: _responsive.responsiveHeight(
                              forUnInitialDevices: 5),
                        ),
                        _textUnderLogo,
                        SizedBox(
                          height: _responsive.responsiveHeight(
                              forUnInitialDevices: 3),
                        ),
                        _text,
                        SizedBox(
                          height: _responsive.responsiveHeight(
                              forUnInitialDevices: 3),
                        ),
                        _joinUsButton,
                        SizedBox(
                          height: _responsive.responsiveHeight(
                              forUnInitialDevices: 8),
                        ),
                        _navigateButton
                      ]),
                  forPortraitTabletScreen: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _imageLogo,
                            SizedBox(
                              height: _responsive.responsiveHeight(
                                  forUnInitialDevices: 5),
                            ),
                            _textUnderLogo,
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: _responsive.responsiveHeight(
                                  forUnInitialDevices: 3),
                            ),
                            _text,
                            SizedBox(
                              height: _responsive.responsiveHeight(
                                  forUnInitialDevices: 3),
                            ),
                            _joinUsButton,
                            SizedBox(
                              height: _responsive.responsiveHeight(
                                  forUnInitialDevices: 2),
                            ),
                            _navigateButton
                          ],
                        )
                      ]),
                  forPortraitMobileScreen: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _imageLogo,
                            SizedBox(
                              height: _responsive.responsiveHeight(
                                  forUnInitialDevices: 5),
                            ),
                            _textUnderLogo,
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: _responsive.responsiveHeight(
                                  forUnInitialDevices: 3),
                            ),
                            _text,
                            SizedBox(
                              height: _responsive.responsiveHeight(
                                  forUnInitialDevices: 3),
                            ),
                            _joinUsButton,
                            SizedBox(
                              height: _responsive.responsiveHeight(
                                  forUnInitialDevices: 2),
                            ),
                            _navigateButton
                          ],
                        )
                      ]))),
        )
      ],
    );
  }
}
