import 'package:fire_idea_project/provider/home_page_provider.dart';
import 'package:fire_idea_project/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';

class SolutionsWidget extends StatefulWidget {
  final String iconURL;
  final String name;

  const SolutionsWidget({Key? key, required this.name, required this.iconURL})
      : super(key: key);

  @override
  _SolutionsWidgetState createState() => _SolutionsWidgetState();
}

class _SolutionsWidgetState extends State<SolutionsWidget> {
  late Responsive _responsive;

  void _onTap() {
    Provider.of<HomePageProvider>(context, listen: false)
        .changeSolutionOption(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    _responsive = Responsive(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _responsive.responsiveWidth(forUnInitialDevices: 0.5),
      vertical:_responsive.responsiveWidth(forUnInitialDevices: 0.5)),
      child: GestureDetector(
        onTap: _onTap,
        child: Container(
          width: _responsive.responsiveWidth(forUnInitialDevices: 7),
          height: _responsive.responsiveWidth(forUnInitialDevices: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_responsive.responsiveValue(
                forUnInitialDevices: 2,
                forPortraitMobileScreen: 1,
                forPortraitTabletScreen: 1.5,
                forLandscapeMobileScreen: 1)),
            color: Provider.of<HomePageProvider>(context).selectedSolution ==
                    widget.name
                ? Provider.of<ThemeProvider>(context).theme.bodyTextColor
                : Provider.of<ThemeProvider>(context)
                    .theme
                    .unSelectedSolutionIconColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                widget.iconURL,
                width: _responsive.responsiveWidth(forUnInitialDevices: 3),
                height: _responsive.responsiveWidth(forUnInitialDevices: 4),
                fit: BoxFit.contain,
                color: Provider.of<HomePageProvider>(context)
                            .selectedSolution ==
                        widget.name
                    ? Provider.of<ThemeProvider>(context).theme.optionColor
                    : Provider.of<ThemeProvider>(context).theme.bodyTextColor,
              ),
              SizedBox(
                height: _responsive.responsiveWidth(forUnInitialDevices: 2),
                width: _responsive.responsiveWidth(forUnInitialDevices: 6),
                child: Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Provider.of<HomePageProvider>(context)
                                  .selectedSolution ==
                              widget.name
                          ? Provider.of<ThemeProvider>(context)
                              .theme
                              .backgroundColor
                          : Provider.of<ThemeProvider>(context)
                              .theme
                              .bodyTextColor,
                      fontSize: _responsive.responsiveValue(
                          forUnInitialDevices: 1.2,
                          forDesktopScreen: 2,
                          forPortraitTabletScreen: 1.3,
                          forLandscapeTabletScreen: 1.9)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
