import 'package:fire_idea_project/provider/theme_provider.dart';
import 'package:fire_idea_project/service/home_page_service.dart';
import 'package:fire_idea_project/widgets/elevated_button.dart';
import 'package:fire_idea_project/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  late Responsive _responsive;
  final HomePageService _service=HomePageService();
  String _email='',_locationInfo='',_phoneNumber='';


  void _loadInfo()async{
   Map<String,dynamic>? info=await _service.getContactUsInfo();
   if(info==null){

   }else{
     setState(() {
       _email=info['email'];
       _locationInfo=info['locationInfo'];
       _phoneNumber=info['phoneNumber'];
     });
   }
  }

  @override
  void initState() {
    _loadInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _responsive = Responsive(context);
    return Container(
      width: _responsive.responsiveWidth(forUnInitialDevices: 100),
      height: _responsive.responsiveHeight(forUnInitialDevices: 100),
      color: const Color(0xff131415),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/image/contactUsImage.png',
              height: _responsive.responsiveHeight(forUnInitialDevices: 100),
              width: _responsive.responsiveHeight(forUnInitialDevices: 50),
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical:
                      _responsive.responsiveHeight(forUnInitialDevices: 8),
                  horizontal:
                      _responsive.responsiveHeight(forUnInitialDevices: 5)),
              width: _responsive.responsiveHeight(forUnInitialDevices: 80),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const CustomTextField(
                      hint: 'Name',
                      textMessage: 'Name',
                    ),
                     SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 4),),
                    const CustomTextField(
                      hint: 'Email',
                      textMessage: 'Your Email',
                    ),
                    SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 4),),
                    const CustomTextField(
                      hint: 'Phone',
                      textMessage: 'Your  Phone',
                    ),
                    SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 4),),
                    const CustomTextField(
                      hint: 'Message',
                      textMessage: 'Your Message',
                      maxLines: 7,
                      minLines: 7,
                    ),
                    SizedBox(height: _responsive.responsiveHeight(forUnInitialDevices: 5),),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomElevatedButton(
                        dark: false,
                        buttonSize:  Size(
                            _responsive.responsiveHeight(
                                forUnInitialDevices: 10),
                            _responsive.responsiveHeight(
                                forUnInitialDevices: 4)),
                        text:'Submit'
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/image/Group 9776.png',
                  width: _responsive.responsiveHeight(forUnInitialDevices: 70),
                  height: _responsive.responsiveHeight(forUnInitialDevices: 30),
                  fit: BoxFit.fill,
                ),
                Container(
                  width: _responsive.responsiveHeight(forUnInitialDevices: 45),
                  height: 1,
                  margin: EdgeInsets.only(
                      left: _responsive.responsiveHeight(
                          forUnInitialDevices: 25)),
                  color: const Color(0xffF7F7F7),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _responsive.responsiveHeight(
                          forUnInitialDevices: 10)),
                  child: SizedBox(
                    width:
                        _responsive.responsiveHeight(forUnInitialDevices: 50),
                    child: Text(
                      '''If you would like to find out more about how we can help you, please give us a call or drop us an email. \n We welcome your comments and suggestions about this website and/or any other issues that you wish to raise.''',
                      style: TextStyle(
                          color: const Color(0xffF7F7F7),
                          fontSize: _responsive.responsiveValue(
                              forUnInitialDevices: 2)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          _responsive.responsiveHeight(forUnInitialDevices: 4)),
                  child: Text(
                    'CONTACT US',
                    style: TextStyle(
                        color: const Color(0xff707070),
                        fontSize: _responsive.responsiveValue(
                            forUnInitialDevices: 2.8)),
                  ),
                ),
                _buildIconWithText(
                    imageName: 'assets/Icons/Icon awesome-map-marker-alt.png',
                    text:
                        _locationInfo),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          _responsive.responsiveHeight(forUnInitialDevices: 1),
                      horizontal:
                          _responsive.responsiveHeight(forUnInitialDevices: 3)),
                  child: Image.asset('assets/Icons/Group 9836.png'),
                ),
                _buildIconWithText(
                    imageName: 'assets/Icons/Icon awesome-phone-alt.png',
                    text: _phoneNumber),
                _buildIconWithText(
                    imageName: 'assets/Icons/Icon ionic-md-mail.png',
                    text: _email)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithText({
    required String imageName,
    required String text,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: _responsive.responsiveHeight(forUnInitialDevices: 1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageName),
          SizedBox(
            width: _responsive.responsiveHeight(forUnInitialDevices: 2),
          ),
          SizedBox(
            width: _responsive.responsiveHeight(forUnInitialDevices: 30),
            child: Text(
              text,
              style: TextStyle(
                color: const Color(0xfff7f7f7),
                fontSize: _responsive.responsiveValue(forUnInitialDevices: 1.7),
              ),
            ),
          )
        ],
      ),
    );
  }
}
