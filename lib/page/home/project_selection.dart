import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/entity/home_entity.dart';
import 'package:mall/constant/string.dart';

class ProjectSelectionView extends StatefulWidget {
  List<ProjectSelection> projectSelections;

  ProjectSelectionView(this.projectSelections);

  @override
  _ProjectSelectionViewState createState() => _ProjectSelectionViewState();
}

class _ProjectSelectionViewState extends State<ProjectSelectionView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.instance.setHeight(400.0),
      child: ListView.builder(
          itemCount: widget.projectSelections.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _itemView(widget.projectSelections[index]);
          }),
    );
  }

  Widget _itemView(ProjectSelection projectSelections) {
    return Container(
      width: ScreenUtil.instance.setWidth(600.0),
      child: Card(
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Image.network(
                  projectSelections.picUrl,
                  fit: BoxFit.cover,
                  width: ScreenUtil.instance.setWidth(600.0),
                  height: ScreenUtil.instance.setHeight(260.0),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil.instance.setHeight(10.0))),
              Container(
                  padding:
                      EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
                  child: Text(
                    projectSelections.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(top: ScreenUtil.instance.setHeight(6.0))),
              Container(
                  padding:
                      EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
                  child: Text(
                    projectSelections.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(top: ScreenUtil.instance.setHeight(6.0))),
              Container(
                  padding:
                      EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
                  child: Text(
                    Strings.DOLLAR + "${projectSelections.price}",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
