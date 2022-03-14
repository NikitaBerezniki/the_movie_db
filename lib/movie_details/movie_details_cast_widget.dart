import 'package:flutter/material.dart';

import '../resources/images.dart';

class MovieDetailsCastWidget extends StatelessWidget {
  const MovieDetailsCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'В главных ролях',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Scrollbar(
          controller: _scrollController,
          child: SizedBox(
            height: 250,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              controller: _scrollController,
              itemCount: 10,
              itemExtent: 120,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 9) {
                  return TextButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Text(
                          'Смотреть \nеще',
                          style: TextStyle(color: Colors.black),
                        ),
                        // Icon(Icons.arrow_left_rounded)
                      ],
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.2)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0, 2),
                                blurRadius: 8)
                          ],
                        ),
                        child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset(
                                AppImages.avatarPiterPaker,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: const [
                                    Text(
                                      'Tom Holland',
                                      maxLines: 1,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Peter Parker',
                                      maxLines: 4,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Spider-Man',
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'Полный актёрский и съёмочный состав',
              style: TextStyle(color: Colors.black, fontSize: 18),
            )),
      ],
    );
  }
}
