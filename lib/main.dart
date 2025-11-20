import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lecture3/text_styles.dart';
import 'package:lecture3/todo_model.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget – stateless because it doesn't store any changing state.
/// All the interesting state lives in [TodoListPage].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.purpleAccent,
        fontFamily: 'Mali',
      ),
      home: const TodoListPage(),
    );
  }
}

/// StatefulWidget – the page has internal state (list of tasks).
class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _controller = TextEditingController();
  final List<TodoTask> _tasks = [];

  @override
  void initState() {
    super.initState();
    // Called once when the widget is inserted in the tree.
    debugPrint('TodoListPage – initState');
  }

  @override
  void dispose() {
    // Always dispose controllers / focus nodes, etc.
    _controller.dispose();
    debugPrint('TodoListPage – dispose');
    super.dispose();
  }

  /// Adds a new task using the current value of the TextField.
  void _addTask() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      return;
    }

    // setState() tells Flutter: "our state changed, please rebuild the UI".
    setState(() {
      _tasks.add(TodoTask(title: text));
    });
    _controller.clear();
  }

  /// Toggles the "done" flag of a task.
  void _toggleTaskDone(int index, bool? value) {
    setState(() {
      _tasks[index].isDone = value ?? false;
    });
  }

  /// Removes a task from the list.
  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // build() is called after every setState().
    debugPrint('TodoListPage – build() called. Tasks count: ${_tasks.length}');

    return Scaffold(
      extendBodyBehindAppBar: true, // To make AppBar transparent over bg image.
      appBar: AppBar(
        title: const Text('To-Do List', style: AppTextStyles.h1),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Input area: TextField + Add button.
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    spacing: 8,
                    children: [
                      // Expanded so the TextField takes remaining width.
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'New task',
                            hintStyle: AppTextStyles.body400BlueGray,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                          ),
                          // Optional: add task on "done" key press.
                          onSubmitted: (_) => _addTask(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _addTask,
                        child: const Text('Add', style: AppTextStyles.body400),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, thickness: 1, color: Colors.blueGrey),
                // Tasks list.
                Expanded(
                  child: _tasks.isEmpty
                      ? const _EmptyWidget()
                      : ListView.builder(
                          itemCount: _tasks.length,
                          itemBuilder: (context, index) {
                            final task = _tasks[index];

                            // flutter_slidable – swipe to reveal actions.
                            return Slidable(
                              key: ValueKey(index.toString()),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                dismissible: DismissiblePane(
                                  onDismissed: () => _removeTask(index),
                                ),
                                children: [
                                  SlidableAction(
                                    onPressed: (_) => _removeTask(index),
                                    backgroundColor: Colors.red,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: CheckboxListTile(
                                title: Text(
                                  task.title,
                                  style: TextStyle(
                                    decoration: task.isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                                value: task.isDone,
                                onChanged: (value) =>
                                    _toggleTaskDone(index, value),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No tasks yet.\nAdd your first one!',
        style: AppTextStyles.body400BlueGray,
        textAlign: TextAlign.center,
      ),
    );
  }
}
