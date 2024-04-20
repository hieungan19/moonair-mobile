import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import '../widgets/messages.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoonAir Bot'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: Colors.blue.shade300,
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white, // Đặt màu con trỏ là màu trắng
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        // Xóa đường gạch dưới khi TextField được focus
                        borderSide: BorderSide(
                            color: Color.fromRGBO(
                                0, 0, 0, 0)), // Đặt màu trong suốt
                      ),
                      enabledBorder: UnderlineInputBorder(
                        // Xóa đường gạch dưới khi TextField không được focus
                        borderSide: BorderSide(
                            color: Colors.transparent), // Đặt màu trong suốt
                      ),
                    ),
                  )),
                  IconButton(
                      onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.blueGrey,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
