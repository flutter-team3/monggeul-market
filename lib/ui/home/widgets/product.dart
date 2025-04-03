import 'dart:ffi';

import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.amber,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
              height: 100,
              color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('강아지 사료')
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('강아지 사료')
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text('10000원')
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}