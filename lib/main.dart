import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'TodoApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textFieldController = TextEditingController();

  final List<String> todoTasks = [];
  void _onFloatingPressed() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add a Todo"),
        content: TextField(
          controller: textFieldController,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (textFieldController.text != "") {
                setState(() {
                  todoTasks.add(textFieldController.text);
                });
              }
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todoTasks.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            todoTasks[index],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFloatingPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
