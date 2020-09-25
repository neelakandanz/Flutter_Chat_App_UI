import 'package:flutter/material.dart';
import 'package:hostup/tabs/call.dart';
import 'package:hostup/tabs/camera.dart';
import 'package:hostup/tabs/chats.dart';
import 'package:hostup/tabs/status.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: new Color(0xff075e54),
        accentColor: new Color(0xff25d366),
      ),
      home: HostUp(),
    ));

class HostUp extends StatefulWidget {
  @override
  _HostUpState createState() => _HostUpState();
}

class _HostUpState extends State<HostUp> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HostsUp'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALL',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Camera(),
          Chats(),
          Status(),
          Call(),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
              child: Icon(
                Icons.camera,
                color: Colors.white,
              ),
            )
          : _tabController.index == 1
              ? FloatingActionButton(
                  child: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                )
              : _tabController.index == 2
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 45.0,
                          width: 45.0,
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FloatingActionButton(
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : FloatingActionButton(
                      child: Icon(
                        Icons.add_call,
                        color: Colors.white,
                      ),
                    ),
    );
  }
}
