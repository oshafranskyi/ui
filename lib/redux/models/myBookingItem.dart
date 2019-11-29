import 'package:flutter/material.dart';

import 'package:ui/setting/sizeConfig.dart';
import 'package:ui/setting/styling.dart';

class MyBookingItem extends StatefulWidget {
  final String imagePath, name, lastTime, lastMessage, location;

  MyBookingItem({Key key,
    @required this.lastTime,
    @required this.imagePath,
    @required this.lastMessage,
    @required this.location,
    @required this.name,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      MyBookingItemState(lastTime, imagePath, location, lastMessage, name);

  MyBookingItem copyWith(
      {String lastTime, String imagePath, String location, String lastMessage}) {
    return MyBookingItem(
      lastTime: lastTime ?? this.lastTime,
      imagePath: imagePath ?? this.imagePath,
      location: location ?? this.location,
      lastMessage: lastMessage ?? this.lastMessage,
      name: name ?? this.name,
    );
  }

  MyBookingItem.fromJson(Map json)
      : lastTime = json['lastTime'],
        imagePath = json['imagePath'],
        location = json['location'],
        lastMessage = json['lastMessage'],
        name = json['name'];

  Map toJson() => {
    'lastTime' : lastTime,
    'imagePath' : imagePath,
    'location' : location,
    'lastMessage' : lastMessage,
    'name' : name,
  };
}

class MyBookingItemState extends State<MyBookingItem> {
  final String imagePath, name, lastTime, lastMessage, location;

  MyBookingItemState(this.lastTime, this.imagePath, this.location, this.lastMessage, this.name,);

  @override
  Widget build(BuildContext context) {

    final leftSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Expanded(
            flex: 8,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 12 * SizeConfig.heightMultiplier, right: 3 * SizeConfig.widthMultiplier, top: 3.3 * SizeConfig.heightMultiplier, left: 3.5 * SizeConfig.widthMultiplier),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(3 * SizeConfig.heightMultiplier),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );

    final middleSection =  Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 1 * SizeConfig.widthMultiplier, top: 3.5 * SizeConfig.heightMultiplier),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 8 * SizeConfig.heightMultiplier,
              width: 50 * SizeConfig.widthMultiplier,
              child: Text(
                name,
                style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                overflow: TextOverflow.clip,
              ),
            ),
            Container(
              height: 7 * SizeConfig.heightMultiplier,
              width: 50 * SizeConfig.widthMultiplier,
              child: Text(
                  location,
                  style: TextStyle(color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal)
              ),
            ),
            Container(
                height: 7 * SizeConfig.heightMultiplier,
                width: 71 * SizeConfig.widthMultiplier,
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 35 * SizeConfig.widthMultiplier,
                        height: 7 * SizeConfig.heightMultiplier,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Check-in:',
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '22 September, Sat',
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                    Container(
                      width: 35 * SizeConfig.widthMultiplier,
                      height: 7 * SizeConfig.heightMultiplier,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Check-out:',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '16 September, Mon',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );

    double widthItem = 100 * SizeConfig.widthMultiplier;

    if(MediaQuery.of(context).orientation == Orientation.landscape)
      widthItem = 100 * SizeConfig.heightMultiplier;

    return Container(
      height: 28 * SizeConfig.heightMultiplier,
      width: widthItem,
      color: AppTheme.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          leftSection,
          middleSection
        ],
      ),
    );
  }
}























