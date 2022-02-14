import 'package:fire_idea_project/provider/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';

class SolutionsCountWidget extends StatefulWidget {
  final int number;

  const SolutionsCountWidget({Key? key, required this.number})
      : super(key: key);

  @override
  _SolutionsCountWidgetState createState() => _SolutionsCountWidgetState();
}

class _SolutionsCountWidgetState extends State<SolutionsCountWidget> {
  late Responsive _responsive;

  void _onTap() {
    Provider.of<HomePageProvider>(context, listen: false)
        .changeSolutionPage(widget.number);
  }

  @override
  Widget build(BuildContext context) {
    _responsive = Responsive(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: _onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal:
                    _responsive.responsiveWidth(forUnInitialDevices: 0.6),
                vertical:
                    _responsive.responsiveWidth(forUnInitialDevices: 0.4)),
            child: Text(
              '${widget.number}',
              style: TextStyle(
                  fontSize: _responsive.responsiveValue(
                      forUnInitialDevices: 1,
                      forDesktopScreen: 1.5,
                      forLandscapeTabletScreen: 1.2,
                      forPortraitTabletScreen: 1.3)),
            ),
            decoration: Provider.of<HomePageProvider>(context)
                        .selectedCountINSolution ==
                    widget.number
                ? BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffD3D3D3),
                    ))
                : null,
          ),
        ),
        SizedBox(
          height: _responsive.responsiveHeight(forUnInitialDevices: 3),
          child: Visibility(
            visible:
                Provider.of<HomePageProvider>(context).selectedCountINSolution ==
                    widget.number,
            child: Text(
              'of ' +
                  Provider.of<HomePageProvider>(context)
                      .maximumCountINSolution
                      .toString(),
              style: TextStyle(
                fontSize: _responsive.responsiveValue(
                    forUnInitialDevices: 1.5, forPortraitMobileScreen: 0.5),
                color: const Color(0xffCACBCD),
              ),
            ),
          ),
        )
      ],
    );
  }
}
