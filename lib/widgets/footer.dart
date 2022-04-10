import '../models/project_model.dart';
import '../provider/home_page_provider.dart';
import '../provider/theme_provider.dart';
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
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //logo column
          Padding(
            padding:  EdgeInsets.only(
          left: _responsive.responsiveWidth(forUnInitialDevices: 11)
      ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/Icons/logo.png',
                  width: _responsive.responsiveWidth(
                      forUnInitialDevices: 15),
                  height: _responsive.responsiveWidth(
                      forUnInitialDevices: 10,
                  forLandscapeTabletScreen: 10),
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: _responsive.responsiveHeight(forUnInitialDevices: 20),
                  width: _responsive.responsiveWidth(
                      forUnInitialDevices: 20),
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.fitHeight,
                    child: SizedBox(
                      width: _responsive.responsiveWidth(
                          forUnInitialDevices: 20,
                      forPortraitMobileScreen: 40,
                      forPortraitTabletScreen: 35,
                      forLandscapeMobileScreen: 35,
                      forLandscapeTabletScreen: 20),
                      child:const Text(
                        'We are providing best-of-practice solutions on time and on budget .Fireideas was Founded in 2019, our team of software programmers specializes in software and business applications to satisfy business needs. We provide a wide range of development services and software application products for multiple technology platforms that meet the ever-changing needs and demands of the marketplace.',
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildSocialMediaIcon(
                        imagePath: 'assets/Icons/instagram.png'),
                    _buildSocialMediaIcon(
                        imagePath: 'assets/Icons/twitter.png', size: 2),
                    _buildSocialMediaIcon(imagePath: 'assets/Icons/facebook.png'),
                    _buildSocialMediaIcon(imagePath: 'assets/Icons/telegram.png'),

                  ],
                )
              ],
            ),
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
          const Spacer(),
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
          ),//
          const Spacer()// 13 from width
        ],
      ),
      padding: EdgeInsets.only(
          // left: _responsive.responsiveHeight(
          //     forUnInitialDevices: 12,forDesktopScreen: 25),
          top: _responsive.responsiveHeight(forUnInitialDevices: 6),
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
      padding:  EdgeInsets.only(right: _responsive.responsiveWidth(forUnInitialDevices: 2,
      forPortraitTabletScreen: 1)),
      child: SizedBox(
        width: _responsive.responsiveWidth(forUnInitialDevices: 3,
        forPortraitTabletScreen: 3,
        forPortraitMobileScreen: 4,
        forLandscapeTabletScreen: 3,
        forLandscapeMobileScreen: 5,
        forDesktopScreen: 3),
        height: _responsive.responsiveHeight(forUnInitialDevices: 4,forPortraitTabletScreen: 2,forDesktopScreen: 3,
        forLandscapeTabletScreen: 2),
        child: InkWell(
          splashColor: null,
          onTap: () {
            print('i am in $imagePath');
          },
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  Widget _buildTextWithPadding(double topPadding, String text,
      [bool bold = false,void Function()? callback]) {
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
            callback?.call();
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
        .map((text) => _buildTextWithPadding(0.1, text, text == title,_chooseFunction(text,title)))
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
 void Function()? _chooseFunction(String text,String title){
    if(title  == "Solutions"){
      return (){
        Provider.of<HomePageProvider>(context,listen: false).changeSolutionOption(text);
        Provider.of<HomePageProvider>(context,listen: false).navigateToAnotherPage("Solutions");
        Provider.of<HomePageProvider>(context,listen: false).scrollController.jumpTo(0);
      };
    }else if(title== "Projects"){
      return (){
        String projectId= Provider.of<HomePageProvider>(context,listen: false).projectButton.firstWhere((element) => text==element,orElse: ()=>'');
        Provider.of<HomePageProvider>(context,listen: false).changeSelectedProject(projectId);
        Provider.of<HomePageProvider>(context,listen: false).navigateToAnotherPage("Projects");
        Provider.of<HomePageProvider>(context,listen: false).scrollController.jumpTo(0);
      };
    }else{
      return null;
    }
  }

}
