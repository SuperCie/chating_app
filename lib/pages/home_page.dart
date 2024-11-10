import 'package:flutter/material.dart';
import 'package:trial_line/components/auth/auth_service.dart';
import 'package:trial_line/components/models/chat_tile.dart';
import 'package:trial_line/components/models/mydrawer.dart';
import 'package:trial_line/components/services/chat_service.dart';
import 'package:trial_line/pages/chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

// chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text(
            "Line",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          backgroundColor: Colors.transparent,
        ),
        endDrawer: const Mydrawer(),
        body: _buildUserList(),
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("Data Error");
        }
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        //return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // build individual list tile
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all users except current user
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return ChatTile(
          text: userData["email"],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverEmail: userData["email"],
                  receiverId: userData["uid"],
                ),
              ),
            );
          });
    } else {
      return Container();
    }
  }
}
