import 'package:flutter/material.dart';
import 'package:trogon/constants/color.dart';
import 'package:trogon/models/categories.dart';
import 'package:trogon/services/apis.dart';

class Categorylistview extends StatefulWidget {
  const Categorylistview({Key key, this.callBack}) : super(key: key);
  final Function callBack;

  @override
  _CategorylistviewState createState() => _CategorylistviewState();
}

class _CategorylistviewState extends State<Categorylistview>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Categories>>(
      future: Apis().categoriesApi(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 9,
                  crossAxisSpacing: 7,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 2),
                ),
              scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                            onTap: () async {},
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 80.0,
                                  width: 150.0,
                                  child: Image.network(
                                    snapshot.data[index].thumbnail,
                                  ),
                                ),
                                Text(
                                  snapshot.data[index].name,
                                  style: TextStyle(
                                      fontFamily: 'MontserratRegular'),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ))),
                  );
                }),
          );
        }
      },
    );
  }
}
