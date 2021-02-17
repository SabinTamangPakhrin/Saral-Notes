import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int currentIndex = 0;
  bool dummyLoading = false;

  List<String> recommendedC = [
    'assets/images/read.jpg',
    'assets/images/write.jpg',
    'assets/images/english.jpg',
    'assets/images/stair.jpg',
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Home Page",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "choose your course",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              )),
                          TextSpan(
                              text: " right way",
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 15,
                              )),
                        ]))
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        icon: Icon(Icons.notifications), onPressed: () {}),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 24, right: 24),
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(16)),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, size: 20),
                  hintText: "Search for your grade, course, training type..",
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        child: Icon(
                          Icons.category,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 3,
                              spreadRadius: 4,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("Category"),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        child: Icon(
                          Icons.ondemand_video,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 3,
                              spreadRadius: 4,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("Boutique Class"),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        child: Icon(
                          Icons.note,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 3,
                              spreadRadius: 4,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("Free Course"),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        child: Icon(
                          Icons.store,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 3,
                              spreadRadius: 4,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("Book Store"),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        child: Icon(
                          Icons.live_tv,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 3,
                              spreadRadius: 4,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("Live course"),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        child: Icon(
                          Icons.card_giftcard,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 3,
                              spreadRadius: 4,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("Leaderboard"),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 230,
              padding: EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Row(
                      children: [
                        Text(
                          "Recommended Course",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "More",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "You may also like",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 160,
                    child: ListView.builder(
                      itemCount: recommendedC.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 140,
                          margin: EdgeInsets.only(right: 16, bottom: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                )
                              ]),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(recommendedC[index]),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Morning Textbook",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "8.6",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 12),
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 12),
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 12),
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 12),
                                          Icon(Icons.star,
                                              color: Colors.grey, size: 12),
                                          Spacer(),
                                          Container(
                                            height: 24,
                                            width: 24,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Icon(Icons.favorite,
                                                  size: 13,
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      // Container(
                      //   width: 140,
                      //   margin: EdgeInsets.only(right: 16, bottom: 8),
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(4),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.black.withOpacity(0.1),
                      //           blurRadius: 3,
                      //           spreadRadius: 2,
                      //         )
                      //       ]),
                      //   child: Column(
                      //     children: [
                      //       Expanded(
                      //         flex: 3,
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //             color: Colors.blueGrey,
                      //             borderRadius: BorderRadius.circular(4),
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               "Place your Image",
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         flex: 4,
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Column(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             crossAxisAlignment:
                      //                 CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 "English Reading",
                      //                 style: TextStyle(color: Colors.grey),
                      //               ),
                      //               Text(
                      //                 "8.0",
                      //                 style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontSize: 18,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //               Row(
                      //                 children: [
                      //                   Icon(Icons.star,
                      //                       color: Colors.yellow, size: 12),
                      //                   Icon(Icons.star,
                      //                       color: Colors.yellow, size: 12),
                      //                   Icon(Icons.star,
                      //                       color: Colors.yellow, size: 12),
                      //                   Icon(Icons.star,
                      //                       color: Colors.yellow, size: 12),
                      //                   Icon(Icons.star,
                      //                       color: Colors.grey, size: 12),
                      //                   Spacer(),
                      //                   Container(
                      //                     height: 24,
                      //                     width: 24,
                      //                     decoration: BoxDecoration(
                      //                       color: Colors.red,
                      //                       shape: BoxShape.circle,
                      //                     ),
                      //                     child: Center(
                      //                       child: Icon(Icons.favorite,
                      //                           size: 13,
                      //                           color: Colors.white),
                      //                     ),
                      //                   )
                      //                 ],
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   width: 140,
                      //   margin: EdgeInsets.only(right: 16, bottom: 8),
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(4),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.black.withOpacity(0.1),
                      //           blurRadius: 3,
                      //           spreadRadius: 2,
                      //         )
                      //       ]),
                      //   child: Column(
                      //     children: [
                      //       Expanded(
                      //         flex: 3,
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //             color: Colors.blueGrey,
                      //             borderRadius: BorderRadius.circular(4),
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               "Place your Image",
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         flex: 4,
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Column(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             crossAxisAlignment:
                      //                 CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 "Illustration Book",
                      //                 style: TextStyle(color: Colors.grey),
                      //               ),
                      //               Text(
                      //                 "7.5",
                      //                 style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontSize: 18,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //               Row(
                      //                 children: [
                      //                   Icon(Icons.star,
                      //                       color: Colors.yellow, size: 12),
                      //                   Icon(Icons.star,
                      //                       color: Colors.yellow, size: 12),
                      //                   Icon(Icons.star,
                      //                       color: Colors.yellow, size: 12),
                      //                   Icon(Icons.star,
                      //                       color: Colors.grey, size: 12),
                      //                   Icon(Icons.star,
                      //                       color: Colors.grey, size: 12),
                      //                   Spacer(),
                      //                   Container(
                      //                     height: 24,
                      //                     width: 24,
                      //                     decoration: BoxDecoration(
                      //                       color: Colors.red,
                      //                       shape: BoxShape.circle,
                      //                     ),
                      //                     child: Center(
                      //                       child: Icon(Icons.favorite,
                      //                           size: 13,
                      //                           color: Colors.white),
                      //                     ),
                      //                   )
                      //                 ],
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   width: 140,
                      //   margin: EdgeInsets.only(right: 16, bottom: 8),
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(4),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.black.withOpacity(0.1),
                      //           blurRadius: 3,
                      //           spreadRadius: 2,
                      //         )
                      //       ]),
                      //   child: Column(
                      //     children: [
                      //       Expanded(
                      //         flex: 3,
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //             color: Colors.blueGrey,
                      //             borderRadius: BorderRadius.circular(4),
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               "Place your Image",
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         flex: 4,
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Column(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             crossAxisAlignment:
                      //                 CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 "Morning Textbook",
                      //                 style: TextStyle(color: Colors.grey),
                      //               ),
                      //               Text(
                      //                 "8.6",
                      //                 style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontSize: 18,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //               Row(
                      //                 children: [
                      //                   Icon(Icons.star,
                      //                       color: Colors.yellow, size: 12),
                      //                   Icon(Icons.star,
                      //                       color: Colors.yellow, size: 12),
                      //                   Icon(Icons.star,
                      //                       color: Colors.yellow, size: 12),
                      //                   Icon(Icons.star,
                      //                       color: Colors.yellow, size: 12),
                      //                   Icon(Icons.star,
                      //                       color: Colors.grey, size: 12),
                      //                   Spacer(),
                      //                   Container(
                      //                     height: 24,
                      //                     width: 24,
                      //                     decoration: BoxDecoration(
                      //                       color: Colors.red,
                      //                       shape: BoxShape.circle,
                      //                     ),
                      //                     child: Center(
                      //                       child: Icon(Icons.favorite,
                      //                           size: 13,
                      //                           color: Colors.white),
                      //                     ),
                      //                   )
                      //                 ],
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 240,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Today's event",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "View all >",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Join now",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 12,
                    ),
                  ),
                  Container(
                    height: 150,
                    margin: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey[100],
                            blurRadius: 3,
                            spreadRadius: 2,
                          )
                        ]),
                    child: Center(
                      child: Text(
                        "Place Your Image",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 4,
                        width: 24,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 4,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 4,
                        width: 12,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 4,
                        width: 8,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 32,
              child: TabBar(
                onTap: (newIndex) {
                  print(newIndex);
                  if (newIndex == 1) {
                    Future.delayed(Duration(seconds: 3), () {
                      setState(() {
                        dummyLoading = true;
                      });
                    });
                  } else {
                    dummyLoading = false;
                  }
                  setState(() {
                    currentIndex = newIndex;
                  });
                },
                unselectedLabelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.teal,
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                tabs: [
                  Tab(
                    text: "Popular",
                  ),
                  Tab(
                    text: "Lecture",
                  ),
                  Tab(
                    text: "Taste",
                  ),
                  Tab(
                    text: "Task",
                  ),
                  Tab(
                    text: "Radio",
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 8),
              height: 380,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 92,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.red[100],
                                  ),
                                  child: Center(
                                    child: Text("Place Image"),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 11,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 8, bottom: 8, right: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "How hard it is for students to get intern?",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                              "Record",
                                              style: TextStyle(),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.favorite,
                                              size: 12,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "98",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Spacer(),
                                            Icon(
                                              Icons.message,
                                              size: 12,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "80",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.more_horiz,
                                              size: 12,
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: 5,
                      separatorBuilder: (context, index) {
                        return Divider();
                      }),
                  !dummyLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 92,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.red[100],
                                      ),
                                      child: Center(
                                        child: Text("Place Image"),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 11,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16,
                                            top: 8,
                                            bottom: 8,
                                            right: 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "How hard it is for students to get intern?",
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Spacer(),
                                            Row(
                                              children: [
                                                Text(
                                                  "Record",
                                                  style: TextStyle(),
                                                ),
                                                Spacer(),
                                                Icon(
                                                  Icons.favorite,
                                                  size: 12,
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  "98",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                SizedBox(width: 16),
                                                Spacer(),
                                                Icon(
                                                  Icons.message,
                                                  size: 12,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  "80",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Spacer(),
                                                Icon(
                                                  Icons.more_horiz,
                                                  size: 12,
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: 5,
                          separatorBuilder: (context, index) {
                            return Divider();
                          }),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 92,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.red[100],
                                  ),
                                  child: Center(
                                    child: Text("Place Image"),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 11,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 8, bottom: 8, right: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "How hard it is for students to get intern?",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                              "Record",
                                              style: TextStyle(),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.favorite,
                                              size: 12,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "98",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Spacer(),
                                            Icon(
                                              Icons.message,
                                              size: 12,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "80",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.more_horiz,
                                              size: 12,
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: 5,
                      separatorBuilder: (context, index) {
                        return Divider();
                      }),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 92,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.red[100],
                                  ),
                                  child: Center(
                                    child: Text("Place Image"),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 11,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 8, bottom: 8, right: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "How hard it is for students to get intern?",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                              "Record",
                                              style: TextStyle(),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.favorite,
                                              size: 12,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "98",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Spacer(),
                                            Icon(
                                              Icons.message,
                                              size: 12,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "80",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.more_horiz,
                                              size: 12,
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: 5,
                      separatorBuilder: (context, index) {
                        return Divider();
                      }),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 92,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.red[100],
                                  ),
                                  child: Center(
                                    child: Text("Place Image"),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 11,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 8, bottom: 8, right: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "How hard it is for students to get intern?",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                              "Record",
                                              style: TextStyle(),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.favorite,
                                              size: 12,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "98",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Spacer(),
                                            Icon(
                                              Icons.message,
                                              size: 12,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "80",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.more_horiz,
                                              size: 12,
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: 5,
                      separatorBuilder: (context, index) {
                        return Divider();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
