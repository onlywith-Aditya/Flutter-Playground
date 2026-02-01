import 'package:flutter/material.dart';

void main() {
  runApp(MyTodoAppHelp());
}

class MyTodoAppHelp extends StatelessWidget {
  const MyTodoAppHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'To-Do App', home: TodoHomePageHelp());
  }
}

class TodoHomePageHelp extends StatefulWidget {
  const TodoHomePageHelp({super.key});

  @override
  _TodoHomePageHelpState createState() => _TodoHomePageHelpState();
}

class _TodoHomePageHelpState extends State<TodoHomePageHelp> {
  // List to store all sections
  List<Section> sections = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(56, 56, 56, 1),
        elevation: 0,
        title: const Text(
          "To2Do",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Button to add new section
          ElevatedButton(
            onPressed: () {
              setState(() {
                // Add a new section with empty title and points
                sections.add(Section(title: 'New Section', points: []));
              });
            },
            child: Text('Add New Section'),
          ),

          // Display all sections
          Expanded(
            child: ListView.builder(
              itemCount: sections.length,
              itemBuilder: (context, index) {
                return SectionWidget(
                  section: sections[index],
                  onTitleChanged: (newTitle) {
                    setState(() {
                      sections[index].title = newTitle;
                    });
                  },
                  onAddPoint: () {
                    setState(() {
                      sections[index].points.add('');
                    });
                  },
                  onPointChanged: (pointIndex, newValue) {
                    setState(() {
                      sections[index].points[pointIndex] = newValue;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Section {
  String title;
  List<String> points;

  Section({required this.title, required this.points});
}

class SectionWidget extends StatelessWidget {
  final Section section;
  final Function(String) onTitleChanged;
  final Function() onAddPoint;
  final Function(int, String) onPointChanged;

  const SectionWidget({super.key, 
    required this.section,
    required this.onTitleChanged,
    required this.onAddPoint,
    required this.onPointChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section title
            TextField(
              decoration: InputDecoration(
                labelText: 'Section Title',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: section.title),
              onChanged: onTitleChanged,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            // Points list
            ...section.points.asMap().entries.map((entry) {
              int index = entry.key;
              String point = entry.value;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Text('• '),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter point',
                          border: OutlineInputBorder(),
                        ),
                        controller: TextEditingController(text: point),
                        onChanged: (value) => onPointChanged(index, value),
                      ),
                    ),
                  ],
                ),
              );
            }),

            // Add point button
            ElevatedButton(onPressed: onAddPoint, child: Text('Add Point')),
          ],
        ),
      ),
    );
  }
}
