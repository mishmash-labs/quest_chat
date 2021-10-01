import 'package:flutter/material.dart';
import 'package:quest_chat/chat_page.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFA8072),
        centerTitle: true,
        title: const Text(
          "Chat",
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(6),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none)),
                filled: true,
                fillColor: Color(0xFFFA8072),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white54,
                ),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.white54,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFFA8072),
                      borderRadius: BorderRadius.circular(8)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ChatPage(),
                        ),
                      );
                    },
                    leading: const CircleAvatar(
                      backgroundColor: Colors.white70,
                      child: Icon(
                        Icons.person,
                        color: Color(0xFFFA8072),
                      ),
                    ),
                    title: const Text(
                      "Fawad Khan",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Hey, what's up?",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "3 hours ago",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFA8072),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white24,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Home"),
        ],
      ),
    );
  }
}
