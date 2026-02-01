import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models_note.dart';

class TodoAddPage extends StatefulWidget {
  final Note? note;
  final Function(Note) onSave;

  const TodoAddPage({super.key, this.note, required this.onSave});

  @override
  State<TodoAddPage> createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  final List<TextEditingController> _taskControllers = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final int _maxTitleChars = 15; // Renamed for clarity
  final int _maxDescChars = 100; // Renamed for clarity
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Initialize task controllers (6 empty ones)
    _taskControllers.addAll(List.generate(6, (_) => TextEditingController()));

    // Pre-fill data if editing existing note
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _descriptionController.text = widget.note!.description;

      // Fill task controllers with existing tasks
      for (
        int i = 0;
        i < widget.note!.tasks.length && i < _taskControllers.length;
        i++
      ) {
        _taskControllers[i].text = widget.note!.tasks[i];
      }
    }

    // Add listeners to enforce character limits
    _titleController.addListener(_enforceTitleLimit);
    _descriptionController.addListener(_enforceDescriptionLimit);
  }

  void _enforceTitleLimit() {
    final text = _titleController.text;
    if (text.length > _maxTitleChars) {
      _titleController.value = TextEditingValue(
        text: text.substring(0, _maxTitleChars),
        selection: TextSelection.collapsed(offset: _maxTitleChars),
      );
    }
    setState(() {}); // Update character count display
  }

  void _enforceDescriptionLimit() {
    final text = _descriptionController.text;
    if (text.length > _maxDescChars) {
      _descriptionController.value = TextEditingValue(
        text: text.substring(0, _maxDescChars),
        selection: TextSelection.collapsed(offset: _maxDescChars),
      );
    }
    setState(() {}); // Update character count display
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    for (var controller in _taskControllers) {
      controller.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  void _saveNote() {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a title')));
      return;
    }

    final tasks =
        _taskControllers
            .map((controller) => controller.text.trim())
            .where((task) => task.isNotEmpty)
            .toList();

    final updatedNote = Note(
      id: widget.note?.id ?? Note.generateId(),
      title: _titleController.text,
      tasks: tasks,
      description: _descriptionController.text,
      createdAt: widget.note?.createdAt ?? DateTime.now(),
      isCompleted: widget.note?.isCompleted ?? false,
    );

    widget.onSave(updatedNote);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 127, 127, 127),
        elevation: 0,
        title: Text(
          widget.note == null ? "To2Do | New Page" : "To2Do | Edit Page",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.fromLTRB(15, 40, 15, 50),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(226, 226, 226, 1),
              border: Border.all(
                color: const Color.fromRGBO(65, 65, 65, 1),
                width: 10,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title Section
                Container(
                  height: 140,
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(65, 65, 65, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Title',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: _titleController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLength: _maxTitleChars, // Enforce limit
                        decoration: InputDecoration(
                          hintText: 'Enter your task title...',
                          hintStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: const Color.fromRGBO(65, 65, 65, 1),
                          counterText: '', // Hide default counter
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${_titleController.text.length}/$_maxTitleChars',
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Tasks Section
                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _taskControllers.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 3),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _taskControllers[index],
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 15,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Enter Task ${index + 1}",
                                      hintStyle: const TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          106,
                                          106,
                                          106,
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 2,
                                            vertical: 3,
                                          ),
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    // Description Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Stack(
                            children: [
                              TextField(
                                controller: _descriptionController,
                                maxLength: _maxDescChars, // Enforce limit
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 15,
                                ),
                                maxLines: 5,
                                minLines: 5,
                                decoration: const InputDecoration(
                                  hintText: "",
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 10,
                                  ),
                                  counterText: '', // Hide default counter
                                ),
                              ),
                              if (_descriptionController.text.isEmpty)
                                const Positioned(
                                  left: 15,
                                  top: 12,
                                  child: Text(
                                    "Enter description",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 85, 85, 85),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${_descriptionController.text.length}/$_maxDescChars',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveNote,
        child: const Icon(Icons.save),
      ),
    );
  }
}
