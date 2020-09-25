import 'package:flutter/material.dart';
import 'package:hostup/model/status_model.dart';

class Status extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ListTile(
                leading: Container(
                  width: 50.0,
                  child: Stack(
                    children: [
                      ClipOval(
                        child: Image.network(
                          'https://randomuser.me/api/portraits/men/22.jpg',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                title: Text(
                  'My Status',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Tab to ad status Update'),
              ),
            )
          ],
        ),
        SizedBox(
          height: 30.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Text(
              'Recent Update',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey.shade500),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: statusData.length,
              itemBuilder: (context, i) => new Column(
                    children: [
                      new Divider(
                        height: 0.1,
                      ),
                      new ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(statusData[i].pic),
                        ),
                        title: Row(
                          children: [
                            Text(
                              statusData[i].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0),
                            ),
                          ],
                        ),
                        subtitle: Container(
                          child: Text(
                            statusData[i].time,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  )),
        ),
      ],
    );
  }
}
