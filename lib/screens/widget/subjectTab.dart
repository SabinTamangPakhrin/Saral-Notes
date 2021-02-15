import 'package:flutter/material.dart';

class SubjectTabView extends StatefulWidget {
  @override
  _SubjectTabViewState createState() => _SubjectTabViewState();
}

class _SubjectTabViewState extends State<SubjectTabView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Tab> subjectTabs = [
    Tab(text: 'Mathematics'),
    Tab(text: 'English'),
    Tab(text: 'Physics'),
    Tab(text: 'Chemistry'),
    Tab(text: 'Biology'),
  ];

  List<TabBarView> subjectView = [];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 32,
          child: TabBar(
            unselectedLabelColor: Colors.grey,
            unselectedLabelStyle: TextStyle(fontSize: 16),
            labelStyle: TextStyle(fontSize: 20),
            isScrollable: true,
            labelColor: Colors.black,
            controller: _tabController,
            tabs: subjectTabs,
          ),
        ),
        Container(
          height: 390,
          child: TabBarView(
            controller: _tabController,
            children: [
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
