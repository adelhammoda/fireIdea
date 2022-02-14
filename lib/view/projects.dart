import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fire_idea_project/models/project_model.dart';
import 'package:fire_idea_project/provider/home_page_provider.dart';
import 'package:fire_idea_project/provider/theme_provider.dart';
import 'package:fire_idea_project/service/home_page_service.dart';
import 'package:fire_idea_project/utils/convert_int_to_string.dart';
import 'package:fire_idea_project/widgets/arrow_button.dart';
import 'package:fire_idea_project/widgets/elevated_button.dart';
import 'package:fire_idea_project/widgets/left_side_image.dart';
import 'package:fire_idea_project/widgets/project_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  String _text = '';
  int firstGroupScroll = 0;
  final ItemScrollController _listViewController = ItemScrollController();
  List<Project> _project = [];
  late Responsive _responsive;
  bool _loading = false;
  final HomePageService _service = HomePageService();

  void _loadProjectsData() async {
    setState(() {
      _loading = true;
    });
    await _service.getProjectsData().then((data) {
      if (data != null) {
        if (data['projects'] is List) {
          int index = 0;
          for (var projectData in (data['projects'] as List)) {
            _project.add(Project.formJSON(projectData, index.toString()));
            index++;
          }
          Provider.of<HomePageProvider>(context, listen: false)
              .setLastProjectId(_project[_project.length - 1].id);
        }
        setState(() {
          _text = data['info']['text'];
          _loading = false;
        });
      }
    });
  }

  void _scrollToNextGroup(bool forward) {
    Provider.of<HomePageProvider>(context, listen: false)
        .changeSelectedProject('');
    int index = forward ? firstGroupScroll + 3 : firstGroupScroll - 3;
    if (index < 0) {
      index = 0;
    }
    _listViewController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInSine);
  }

  void _scrollToProject(int index) {
    _listViewController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInSine,
    );
  }

  @override
  void initState() {
    super.initState();
    _loadProjectsData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _responsive = Responsive(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: _responsive.responsiveHeight(forUnInitialDevices: 5)),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LeftSideImage(
                    text: _text,
                    onPressed: () {},
                    buttonText: 'More',
                    imageURl: 'assets/image/projects.png'),
                Container(
                  padding: EdgeInsets.only(
                      top: _responsive.responsiveHeight(
                          forUnInitialDevices: 10)),
                  alignment: Alignment.centerLeft,
                  width: _responsive.responsiveWidth(forUnInitialDevices: 50),
                  child: _loading
                      ? CircularProgressIndicator(
                          color: Provider.of<ThemeProvider>(context)
                              .theme
                              .optionColor,
                        )
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: _responsive.responsiveWidth(
                                  forUnInitialDevices: 50),
                              height: _responsive.responsiveWidth(
                                  forUnInitialDevices: 15),
                              child: ScrollablePositionedList.builder(
                                  initialAlignment: 1,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _project.length % 3 == 0
                                      ? _project.length
                                      : _project.length + 1,
                                  itemScrollController: _listViewController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => _project
                                                      .length %
                                                  3 !=
                                              0 &&
                                          index != _project.length
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              left: _responsive.responsiveWidth(
                                                  forUnInitialDevices: 1.25),
                                              right: index ==
                                                      _project.length - 1
                                                  ? _responsive.responsiveWidth(
                                                      forUnInitialDevices: 1.25)
                                                  : 0),
                                          child: ProjectWidget(
                                            index: index,
                                            project: _project[index],
                                            callBack: ({int lastIndex = -1}) {
                                              if (lastIndex < 0) {
                                                _scrollToProject(index);
                                              } else {
                                                _scrollToProject(lastIndex);
                                              }
                                            },
                                          ),
                                        )
                                      : SizedBox(
                                          width: _responsive.responsiveWidth(
                                              forUnInitialDevices: 16.25),
                                        )),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ArrowButton(
                                  onPressed: () {
                                    _scrollToNextGroup(false);
                                  },
                                  angle: pi / 2,
                                  iconSize: _responsive.responsiveWidth(
                                      forUnInitialDevices: 2)),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ArrowButton(
                                  onPressed: () {
                                    _scrollToNextGroup(true);
                                  },
                                  angle: -pi / 2,
                                  iconSize: _responsive.responsiveWidth(
                                      forUnInitialDevices: 2)),
                            ),
                          ],
                        ),
                )
              ],
            ),
            SizedBox(
              height: _responsive.responsiveHeight(forUnInitialDevices: 10),
            ),
            SubImage(
              project: _project[0],
            )
          ],
        ),
      ),
    );
  }
}

class SubImage extends StatefulWidget {
  final Project project;

  const SubImage({Key? key, required this.project}) : super(key: key);

  @override
  State<SubImage> createState() => _SubImageState();
}

class _SubImageState extends State<SubImage> {
  late Responsive _responsive;

  int _imageIndex = 0;

  double _calculateIndicatorsWidth() {
    double totalWidth = _responsive.responsiveWidth(forUnInitialDevices: 30);
    if (widget.project.subImage.length < 10) {
      return _responsive.responsiveWidth(forUnInitialDevices: 5);
    } else {
      return totalWidth / widget.project.subImage.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    _responsive = Responsive(context);
    return SizedBox(
      width: _responsive.responsiveWidth(forUnInitialDevices: 78),
      height: _responsive.responsiveWidth(forUnInitialDevices: 35),
      child: Stack(
        fit: StackFit.loose,
        children: [
          //carousel
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              child: CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (currentImage, nextImage) {
                    setState(() {
                      _imageIndex = currentImage;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  height: _responsive.responsiveWidth(forUnInitialDevices: 35),
                  enableInfiniteScroll: true,
                  pageSnapping: true,
                  viewportFraction: 1,
                  initialPage: 0,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                ),
                items: List.generate(
                    widget.project.subImage.length,
                    (index) => Image.network(
                          widget.project.subImage[index] as String,
                          width: _responsive.responsiveWidth(
                              forUnInitialDevices: 75),
                          fit: BoxFit.fill,
                        )),
              ),
              width: _responsive.responsiveWidth(forUnInitialDevices: 75),
              height: _responsive.responsiveWidth(forUnInitialDevices: 35),
            ),
          ),
          // black box in right corner
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical:  _responsive.responsiveWidth(forUnInitialDevices: 2),
                  horizontal:
                      _responsive.responsiveWidth(forUnInitialDevices: 1)),
              width: _responsive.responsiveWidth(forUnInitialDevices: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    toStringWithFixedNumber(_imageIndex + 1, 2),
                    style: TextStyle(
                        fontSize:
                            _responsive.responsiveValue(forUnInitialDevices: 6),
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.bold,
                        color: Provider.of<ThemeProvider>(context)
                            .theme
                            .backgroundColor),
                  ),
                  Divider(
                    color: const Color(0xffFEC303),
                    height: 2,
                    endIndent:
                        _responsive.responsiveWidth(forUnInitialDevices: 1),
                    indent: _responsive.responsiveWidth(forUnInitialDevices: 2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                        toStringWithFixedNumber(
                            widget.project.subImage.length, 2),
                        style: TextStyle(
                            fontSize: _responsive.responsiveValue(
                                forUnInitialDevices: 2),
                            fontFamily: 'Helvetica Neue',
                            fontWeight: FontWeight.bold,
                            color: Provider.of<ThemeProvider>(context)
                                .theme
                                .backgroundColor)),
                  )
                ],
              ),
              decoration: const BoxDecoration(color: Colors.black),
            ),
          ),
          //Indicator
          Positioned(
              bottom: _responsive.responsiveHeight(forUnInitialDevices: 1),
              right: _responsive.responsiveWidth(forUnInitialDevices: 10),
              child: SizedBox(
                height: _responsive.responsiveHeight(forUnInitialDevices: 10),
                width: _responsive.responsiveWidth(
                  forUnInitialDevices: 30,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      widget.project.subImage.length,
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
              )),
          //black box in the left corner
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(
                  left: _responsive.responsiveWidth(forUnInitialDevices: 3.1),
                  top: _responsive.responsiveWidth(forUnInitialDevices: 2),
                  bottom: _responsive.responsiveWidth(forUnInitialDevices: 1)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.project.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica Neue',
                      fontSize:
                          _responsive.responsiveValue(forUnInitialDevices: 6),
                      color: Provider.of<ThemeProvider>(context)
                          .theme
                          .backgroundColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.project.type,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica Neue',
                      fontSize:
                          _responsive.responsiveValue(forUnInitialDevices: 2.2),
                      color: Provider.of<ThemeProvider>(context)
                          .theme
                          .backgroundColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.project.description,
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Helvetica Neue',
                      fontSize:
                          _responsive.responsiveValue(forUnInitialDevices: 2),
                      color: Provider.of<ThemeProvider>(context)
                          .theme
                          .backgroundColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomElevatedButton(
                    text: 'join us',
                    dark: false,
                    buttonSize: Size(
                        _responsive.responsiveWidth(forUnInitialDevices: 7),
                        _responsive.responsiveWidth(forUnInitialDevices: 2.5)),
                  )
                ],
              ),
              width: _responsive.responsiveWidth(forUnInitialDevices: 30),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
            ),
          )
        ],
      ),
    );
  }
}
