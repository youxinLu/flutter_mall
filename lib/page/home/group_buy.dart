import 'package:flutter/material.dart';
import 'package:mall/entity/group_buy_entity.dart';

class GroupBuyView extends StatelessWidget {
  List<GroupBuyEntity> groupEntitys;

  GroupBuyView(this.groupEntitys);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: groupEntitys.length,
        itemBuilder: (BuildContext context, int index) {
          return _getGroupBuyItem(groupEntitys[index]);
        });
  }

  Widget _getGroupBuyItem(GroupBuyEntity groupBuyEntity) {
    return Container(
      height: 100.0,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
              groupBuyEntity.picUrl,
              width: 60.0,
              height: 60.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  groupBuyEntity.name,
                  style: TextStyle(fontSize: 16.0, color: Colors.black87),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                ),
                Text(
                  groupBuyEntity.brief,
                  style: TextStyle(fontSize: 14.0, color: Colors.black54),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "原价${groupBuyEntity.retailPrice}",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[850],
                          decoration: TextDecoration.lineThrough,
                          decorationStyle: TextDecorationStyle.dashed),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                    ),
                    Text(
                      "现价${groupBuyEntity.retailPrice}",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(4.0),
                  height: 24.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: new Border.all(
                          color: Colors.deepOrangeAccent, width: 0.5),
                      // 边色与边宽度
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white),
                  child: Text(
                    "${groupBuyEntity.grouponMember}成团",
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 10.0)),
                Container(
                  padding: EdgeInsets.all(4.0),
                  height: 24.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: new Border.all(color: Colors.red, width: 0.5),
                      // 边色与边宽度
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white),
                  child: Text(
                    "立减${groupBuyEntity.grouponMember}",
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 10.0))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
