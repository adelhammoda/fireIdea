import 'dart:async';

import 'package:fire_idea_project/models/project_model.dart';
import 'package:fire_idea_project/provider/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_s/responsive_s.dart';

class ProjectWidget extends StatefulWidget {
  final Project project;
  final int index;
  final void Function({int lastIndex}) callBack;
  const ProjectWidget(
      {Key? key,
        required this.index,
      required this.project,
      required this.callBack,})
      : super(key: key);

  @override
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget>
    with SingleTickerProviderStateMixin {
  late Responsive _responsive;
  bool _visibility = false;
  late double _width=_responsive.responsiveWidth(forUnInitialDevices: 15);
  late final Animation<Offset> _animation;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
        upperBound: 1,
        lowerBound: 0);
    _animation = Tween(begin: const Offset(0, 0), end: const Offset(1, 0))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeIn));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _responsive = Responsive(context);

    if (Provider.of<HomePageProvider>(context, listen: false)
        .selectedProjectId !=
        widget.project.id){
      _toggleWidth();
      _animationController.reverse();
    }
  }

  void _onPressed() {
    if (Provider.of<HomePageProvider>(context, listen: false)
            .selectedProjectId ==
        widget.project.id) {

      Provider.of<HomePageProvider>(context, listen: false)
          .changeSelectedProject('');
      _animationController.reverse();
      _toggleWidth();
      widget.callBack.call(lastIndex:(widget.index~/3)*3);
    } else {
      if(Provider.of<HomePageProvider>(context, listen: false)
          .selectedProjectId!=''){
        widget.callBack.call();
        Provider.of<HomePageProvider>(context, listen: false)
            .changeSelectedProject(widget.project.id);
          Timer(const Duration(milliseconds: 600),(){
            _toggleWidth();
            _animationController.forward();
          });
      } else {
        Provider.of<HomePageProvider>(context, listen: false)
            .changeSelectedProject(widget.project.id);
        widget.callBack.call();
        _toggleWidth();
        _animationController.forward();
      }
    }
  }

  void _toggleWidth(){
   setState(() {
     _width= Provider.of<HomePageProvider>(context,listen: false).selectedProjectId ==
          widget.project.id
          ? _responsive.responsiveWidth(forUnInitialDevices: 30)
          : _responsive.responsiveWidth(forUnInitialDevices: 15);
   });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _onPressed,
        child: AnimatedContainer(
          onEnd: () {
            setState(() {
              _visibility = !_visibility;
            });
          },
          width:_width,
          duration: const Duration(milliseconds: 500),
          child: Stack(
            children: [
              Visibility(
                visible: Provider.of<HomePageProvider>(context).selectedProjectId ==
                    widget.project.id ,
                child: SlideTransition(
                  position: _animation,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            _responsive.responsiveWidth(forUnInitialDevices: 2),
                        vertical:
                            _responsive.responsiveWidth(forUnInitialDevices: 2)),
                    width: _responsive.responsiveWidth(forUnInitialDevices: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Text(
                          widget.project.name,
                          style: TextStyle(
                              fontSize: _responsive.responsiveValue(
                                  forUnInitialDevices: 2),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Teko'),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          widget.project.description,
                          style: TextStyle(
                              fontSize: _responsive.responsiveValue(
                                  forUnInitialDevices: 1.5),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Helvetica Neue'),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    width: _responsive.responsiveWidth(forUnInitialDevices: 15),
                    height:
                        _responsive.responsiveWidth(forUnInitialDevices: 15),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.mode(
                                Colors.black,
                                Provider.of<HomePageProvider>(context)
                                            .selectedProjectId ==
                                        widget.project.id
                                    ? BlendMode.screen
                                    : BlendMode.hue),
                            image: NetworkImage(
                              widget.project.imageURL,
                            ))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left:
                            _responsive.responsiveWidth(forUnInitialDevices: 2),
                        bottom: _responsive.responsiveWidth(
                            forUnInitialDevices: 0.5)),
                    child: SizedBox(
                      width:
                          _responsive.responsiveWidth(forUnInitialDevices: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.project.type,
                            style: TextStyle(
                                fontFamily: "Teko",
                                fontWeight: FontWeight.w300,
                                color: const Color(0xffEDF0F2),
                                fontSize: _responsive.responsiveValue(
                                    forUnInitialDevices: 1.5)),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.project.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffEDF0F2),
                                fontFamily: "Teko",
                                fontSize: _responsive.responsiveValue(
                                    forUnInitialDevices: 3.3)),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
