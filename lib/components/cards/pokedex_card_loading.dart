import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PokedexCardLoading extends StatelessWidget {
  const PokedexCardLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return Card(
      elevation: 0,
      child: SizedBox(
        height: size.height * 0.6,
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.black45,
              highlightColor: Colors.black12,
              child: Container(
                height: size.height * 0.5,
                color: Colors.black45,
                alignment: Alignment.center,
                child: const Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Shimmer.fromColors(
                        baseColor: Colors.black45,
                        highlightColor: Colors.black12,
                        child: const Text('No. 000')),
                  ),
                  Shimmer.fromColors(
                      baseColor: Colors.black45,
                      highlightColor: Colors.black12,
                      child: const Text('Name')),
                  Row(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.black45,
                        highlightColor: Colors.black12,
                        child: Container(
                          width: size.width * 0.2,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          color: Colors.black45,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Shimmer.fromColors(
                        baseColor: Colors.black45,
                        highlightColor: Colors.black12,
                        child: Container(
                          width: size.width * 0.2,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
