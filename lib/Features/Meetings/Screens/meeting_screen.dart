import 'dart:math';

import 'package:flutter/material.dart';

import 'package:chatbox/Features/Meetings/Repository/meeting_repository_implementation.dart';
import 'package:chatbox/Features/Meetings/Screens/join_meeting_screen.dart';
import 'package:chatbox/Features/Meetings/Widgets/custom_buttons.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({super.key});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final MeetingRepositoryImplementation _meetingRepositoryImplementation =
      MeetingRepositoryImplementation();

  void createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _meetingRepositoryImplementation.createMeeting(roomName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Meetings',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info_outline,
              size: 27.0,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: createNewMeeting,
                child: const CustomButton(
                  text: 'New Meeting',
                  color: Colors.deepOrange,
                  icon: Icons.videocam_sharp,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const JoinMeetingScreen();
                    },
                  ));
                },
                child: const CustomButton(
                  text: 'Join',
                  color: Color.fromRGBO(45, 101, 246, 1),
                  icon: Icons.add_box,
                ),
              ),
            ],
            
          ),
          const SizedBox(
            height: 4.0,
          ),
          const Divider(
            color: Colors.grey,
          ),
          const Text(
            'Moderate a meeting or join one',
            style: TextStyle(
              color: Color.fromRGBO(45, 101, 246, 1),
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
