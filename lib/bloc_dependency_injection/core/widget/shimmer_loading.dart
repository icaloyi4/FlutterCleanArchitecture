import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final Axis type;

  ShimmerLoading({@required this.type});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int item = (size.height / 156).round();
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.only(top: 12, left: 12, right: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        enabled: true,
        child: ListView.builder(
            scrollDirection: type,
            itemCount: item,
            itemBuilder: (c, i) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      width: size.width,
                      height: 100,
                    ),
                    SizedBox(height: 12),
                    Container(
                      color: Colors.white,
                      width: size.width,
                      height: 20,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
