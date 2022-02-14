import 'package:fire_idea_project/provider/theme_provider.dart';
import 'package:fire_idea_project/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  late Responsive _responsive;

  @override
  Widget build(BuildContext context) {
    _responsive = Responsive(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical:
                    _responsive.responsiveHeight(forUnInitialDevices: 10)),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: _responsive.responsiveWidth(
                              forUnInitialDevices: 5)),
                      child: Image.asset(
                        'assets/image/who_we_are.png',
                        width: _responsive.responsiveWidth(
                            forUnInitialDevices: 45),
                        height: _responsive.responsiveWidth(
                            forUnInitialDevices: 30),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            right: _responsive.responsiveWidth(
                                forUnInitialDevices: 10)),
                        width: _responsive.responsiveWidth(
                            forUnInitialDevices: 40),
                        height: _responsive.responsiveWidth(
                            forUnInitialDevices: 15),
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(
                            scrollbars: false,
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              '''It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters. 
as opposed to using ‘Content here, content here’, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ‘lorem ipsum’ will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).as opposed to using ‘Content here, content here’, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ‘lorem ipsum’ will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).''',
                              style: TextStyle(
                                  fontSize: _responsive.responsiveValue(
                                      forUnInitialDevices: 2)),
                            ),
                          ),
                        ))
                  ],
                ),
                Positioned(
                  bottom: _responsive.responsiveHeight(forUnInitialDevices: 2),
                  right: _responsive.responsiveWidth(forUnInitialDevices: 25),
                  child: Row(
                    children: [
                      Text(
                        'Trusted by   ',
                        style: TextStyle(
                            fontSize: _responsive.responsiveValue(
                                forUnInitialDevices: 2.3),
                            color: Provider.of<ThemeProvider>(context)
                                .theme
                                .optionColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        'assets/Icons/logo_word.png',
                        width:
                            _responsive.responsiveWidth(forUnInitialDevices: 9),
                        height: _responsive.responsiveHeight(
                            forUnInitialDevices: 4.5),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: _responsive.responsiveWidth(forUnInitialDevices: 50),
                  padding: EdgeInsets.only(
                    left: _responsive.responsiveWidth(forUnInitialDevices: 10),
                  ),
                  child: Text(
                    '''Solutions by Text is a division of Marketing Response Solutions, a full-service consulting firm that has been serving the business community since 1995. In 2008, Solutions by Text was created to streamline client communication and leverage the power of SMS to create advanced business solutions in the mobile space.

Our approach is proven and effective and it’s the same for every client, whether big or small. We remove the guesswork by providing sound advice and strategies for success based on hard data and years of experience.

We’re here to answer your questions. Let us show you how you can leverage real-time SMS responses to reduce your costs and increase your earnings.''',
                    style: TextStyle(
                        fontSize: _responsive.responsiveValue(
                            forUnInitialDevices: 2.3)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left:
                          _responsive.responsiveWidth(forUnInitialDevices: 15),
                      right:
                          _responsive.responsiveWidth(forUnInitialDevices: 5),
                      top: _responsive.responsiveWidth(forUnInitialDevices: 15),
                      bottom:
                          _responsive.responsiveWidth(forUnInitialDevices: 5)),
                  child: Image.asset(
                    'assets/image/whyFire.png',
                    fit: BoxFit.fill,
                    width: _responsive.responsiveWidth(forUnInitialDevices: 30),
                    height:
                        _responsive.responsiveWidth(forUnInitialDevices: 20),
                  ),
                )
              ],
            ),
            width: _responsive.responsiveWidth(forUnInitialDevices: 100),
            height: _responsive.responsiveHeight(forUnInitialDevices: 90),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/image/white background.png',
                    ))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical:
                    _responsive.responsiveHeight(forUnInitialDevices: 10)),
            child: Container(
              height: _responsive.responsiveHeight(forUnInitialDevices: 40),
              width:_responsive.responsiveWidth(forUnInitialDevices: 100),
              child: Column(
                mainAxisSize: MainAxisSize.max  ,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('''Everything you need,\n our team is ready for your service. ''',style: TextStyle(
                    fontSize: _responsive.responsiveValue(forUnInitialDevices: 3),
                    color: Provider.of<ThemeProvider>(context).theme.optionColor
                  ),textAlign: TextAlign.center,),
                  Text('Experience effective, widespread and continuous support',style: TextStyle(
                    fontSize: _responsive.responsiveValue(forUnInitialDevices: 2),
                    color: Colors.white,
                  ),),
                   CustomElevatedButton(text: 'Join Us',buttonSize:  Size(
                        _responsive.responsiveHeight(
                            forUnInitialDevices: 13),
                        _responsive.responsiveHeight(
                            forUnInitialDevices: 5),),dark: false,),
                ],
              ),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/image/joinusImage.png'))),
            ),
          )
        ],
      ),
    );
  }
}
