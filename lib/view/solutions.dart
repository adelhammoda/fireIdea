import 'dart:math';

import '../provider/home_page_provider.dart';
import '../provider/theme_provider.dart';
import '../service/home_page_service.dart';
import '../widgets/elevated_button.dart';
import '../widgets/left_side_image.dart';
import '../widgets/solutions_count_widget.dart';
import '../widgets/solutions_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';

class Solutions extends StatefulWidget {
  const Solutions({Key? key}) : super(key: key);

  @override
  _SolutionsState createState() => _SolutionsState();
}

class _SolutionsState extends State<Solutions> {
  late Responsive _responsive;
  final HomePageService _service = HomePageService();
  bool _loading = false;
  List<String> _solurionsName = [];
  String _text = '';
  Map<String, dynamic> _solutionData = {};

  void _loadSolutions() async {
    _loading = true;
    _solurionsName = await _service.getAllSolutionsIcons() ?? <String>[];
    _solutionData = await _service.getSolutionsData() ?? {};
    _text = _solutionData['textInfo'] ?? '';
    Provider.of<HomePageProvider>(context, listen: false)
        .changeMaximumCountINSolution(_solurionsName.length);
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loadSolutions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _responsive = Responsive(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: _responsive.responsiveHeight(forUnInitialDevices: 5)),
      child: SizedBox(
        width: _responsive.responsiveWidth(forUnInitialDevices: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LeftSideImage(
                text: _text,
                imageURl: 'assets/image/exploreFire.png',
                buttonText: 'more', onPressed: () {  },),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:
                          _responsive.responsiveWidth(forUnInitialDevices: 40),
                      child: _loading
                          ? Center(
                              child: CircularProgressIndicator(
                              color: Provider.of<ThemeProvider>(context)
                                  .theme
                                  .optionColor,
                            ))
                          : Wrap(
                              runAlignment: WrapAlignment.start,
                              children: _solutionsIconBuilder(),
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: _responsive.responsiveHeight(
                              forUnInitialDevices: 5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomElevatedButton(
                            text: 'Backward',
                            buttonSize: Size(
                                _responsive.responsiveWidth(
                                    forUnInitialDevices: 4),
                                _responsive.responsiveHeight(
                                    forUnInitialDevices: 4)),
                            onPressed: () {
                              Provider.of<HomePageProvider>(context,
                                      listen: false)
                                  .backwardForward(true);
                            },
                            fontSize: _responsive.responsiveValue(
                                forUnInitialDevices: 1.3),
                          ),
                          SizedBox(
                            width: _responsive.responsiveWidth(
                                forUnInitialDevices: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Visibility(
                                  visible:
                                      Provider.of<HomePageProvider>(context)
                                              .minimumCountINSolution >
                                          5,
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        Provider.of<HomePageProvider>(context,
                                                listen: false)
                                            .changeMinimumCountINSolution(
                                                false);
                                      },
                                      child: Transform.rotate(
                                        angle: pi,
                                        child: Image.asset(
                                          'assets/Icons/next.png',
                                          width: _responsive.responsiveWidth(
                                            forUnInitialDevices: 1,
                                          ),
                                          height: _responsive.responsiveWidth(
                                            forUnInitialDevices: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SolutionsCountWidget(
                                    number:
                                        Provider.of<HomePageProvider>(context)
                                            .minimumCountINSolution),
                                Visibility(
                                    visible: Provider.of<HomePageProvider>(
                                                    context)
                                                .minimumCountINSolution +
                                            1 <=
                                        Provider.of<HomePageProvider>(context)
                                            .maximumCountINSolution,
                                    child: SolutionsCountWidget(
                                        number: Provider.of<HomePageProvider>(
                                                    context)
                                                .minimumCountINSolution +
                                            1)),
                                Visibility(
                                  visible:
                                      Provider.of<HomePageProvider>(context)
                                                  .minimumCountINSolution +
                                              2 <=
                                          Provider.of<HomePageProvider>(context)
                                              .maximumCountINSolution,
                                  child: SolutionsCountWidget(
                                      number:
                                          Provider.of<HomePageProvider>(context)
                                                  .minimumCountINSolution +
                                              2),
                                ),
                                Visibility(
                                  visible:
                                      Provider.of<HomePageProvider>(context)
                                                  .minimumCountINSolution +
                                              3 <=
                                          Provider.of<HomePageProvider>(context)
                                              .maximumCountINSolution,
                                  child: SolutionsCountWidget(
                                      number:
                                          Provider.of<HomePageProvider>(context)
                                                  .minimumCountINSolution +
                                              3),
                                ),
                                Visibility(
                                  visible:
                                      Provider.of<HomePageProvider>(context)
                                                  .minimumCountINSolution +
                                              4 <=
                                          Provider.of<HomePageProvider>(context)
                                              .maximumCountINSolution,
                                  child: SolutionsCountWidget(
                                      number:
                                          Provider.of<HomePageProvider>(context)
                                                  .minimumCountINSolution +
                                              4),
                                ),
                                Visibility(
                                  visible:
                                      Provider.of<HomePageProvider>(context)
                                                  .minimumCountINSolution +
                                              5 <=
                                          Provider.of<HomePageProvider>(context)
                                              .maximumCountINSolution,
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        Provider.of<HomePageProvider>(context,
                                                listen: false)
                                            .changeMinimumCountINSolution(true);
                                      },
                                      child: Image.asset(
                                        'assets/Icons/next.png',
                                        width: _responsive.responsiveWidth(
                                          forUnInitialDevices: 1,
                                        ),
                                        height: _responsive.responsiveWidth(
                                          forUnInitialDevices: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Provider.of<ThemeProvider>(context)
                                      .theme
                                      .optionColor,
                                  padding: EdgeInsets.zero,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  side: BorderSide(
                                      color: Provider.of<ThemeProvider>(context)
                                          .theme
                                          .optionColor),
                                  minimumSize: Size(
                                      _responsive.responsiveWidth(
                                          forUnInitialDevices: 4),
                                      _responsive.responsiveHeight(
                                          forUnInitialDevices: 4))),
                              onPressed: () {
                                Provider.of<HomePageProvider>(context,
                                        listen: false)
                                    .backwardForward(false);
                              },
                              child: Text(
                                'Forward',
                                style: TextStyle(
                                    fontSize: _responsive.responsiveValue(
                                        forUnInitialDevices: 1.3)),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                Transform.rotate(
                  alignment: Alignment.center,
                  angle: -pi / 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical:
                            _responsive.responsiveWidth(forUnInitialDevices: 7),
                        horizontal: _responsive.responsiveValue(
                            forUnInitialDevices: 5)),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/Icons/arrow.png',
                          width: _responsive.responsiveWidth(
                              forUnInitialDevices: 1.1),
                          height: _responsive.responsiveWidth(
                              forUnInitialDevices: 2),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _solutionsIconBuilder() {
    List<Widget> temp = [];

    int s = Provider.of<HomePageProvider>(context).selectedCountINSolution;
    int _counter =
        (Provider.of<HomePageProvider>(context).selectedCountINSolution - 1) *
            10;
    for (_counter;
        _counter < 10 * s && _counter < _solurionsName.length;
        _counter++) {
      temp.add(SolutionsWidget(
        name: _solurionsName[_counter],
        iconURL: _solutionData['solutions'][_solurionsName[_counter]]
            ['iconURL'],
      ));
    }
    return temp;
  }
}
