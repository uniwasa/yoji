import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const CupertinoSliverNavigationBar(
          largeTitle: Text('目録'),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: 4,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.all(10.0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "四字\n熟語",
                  ),
                ),
              );
            },
            childCount: 20,
          ),
        )
      ],
    ));
  }
}
