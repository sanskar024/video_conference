import 'package:flutter/material.dart';
import 'package:video_conference/resources/FirestoreHIstory.dart';
import 'package:intl/intl.dart';
class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    meeting meetings=meeting();

    return StreamBuilder(stream: meetings.meet, builder: (context, snapshot) {
      if(snapshot.hasData){
        return ListView.builder(itemCount :(snapshot.data! as dynamic).docs.length,itemBuilder: (context, index){
          final data = (snapshot.data! as dynamic).docs[index];
          return ListTile(
            title: Text("Room Name: ${data['name']}"),
            subtitle: Text("Joined on: ${DateFormat.yMMMd().format(data['created_at'].toDate())}"),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                meetings.deleteMeeting(data.id);
              },
            ),

            
          );
        });
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}