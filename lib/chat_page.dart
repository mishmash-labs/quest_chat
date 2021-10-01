import 'package:flutter/material.dart';
import 'package:quest_chat/chat_model.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  final List<ChatModel> chatItems = ChatModel.list;

  Widget _buildInput() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: const BoxDecoration(
        color: Color(0xFFFA8072),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: const <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type something...",
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.attach_file,
              color: Colors.white70,
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }

  _isFirstMessage(List<ChatModel> chatItems, int index) {
    return (chatItems[index].senderId !=
            chatItems[index - 1 < 0 ? 0 : index - 1].senderId) ||
        index == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFA8072),
        elevation: 0,
        title: const Text(
          "Fawad Khan",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: chatItems.length,
              reverse: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Row(
                    mainAxisAlignment: chatItems[index].senderId == "1"
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: <Widget>[
                      _isFirstMessage(chatItems, index) &&
                              chatItems[index].senderId == "2"
                          ? const SizedBox(
                              width: 30,
                              height: 30,
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFFA8072),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white70,
                                ),
                              ),
                            )
                          : const SizedBox(
                              width: 30,
                              height: 30,
                            ),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * .7,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: chatItems[index].senderId == "1"
                              ? const Color(0xFFFA8072)
                              : const Color(0xFFe69d95),
                        ),
                        child: Text(
                          chatItems[index].message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          _buildInput(),
        ],
      ),
    );
  }
}
