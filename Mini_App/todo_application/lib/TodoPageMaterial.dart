import 'package:flutter/material.dart';
import 'Todo_Add_Page.dart';
import 'models_note.dart';
import 'storage_service.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // Add this at the top of your _TodoPageState class
  bool _isSaving = false;
  DateTime? _lastErrorTime;

  List<Note> _notes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _loadNotes();
  }

  Future<void> _loadNotes() async {
    try {
      final loadedNotes = await StorageService.loadNotes();
      if (mounted) {
        setState(() {
          _notes = loadedNotes;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        _showErrorSnackbar('Failed to load notes');
      }
    }
  }

  Future<void> _saveNotes() async {
    if (_isSaving) return;

    setState(() => _isSaving = true);
    try {
      await StorageService.saveNotes(_notes);
    } catch (e) {
      // Only show error if last error was more than 2 seconds ago
      // Only show error if last error was more than 2 seconds ago
      if (_lastErrorTime == null ||
          DateTime.now().difference(_lastErrorTime!) >
              const Duration(seconds: 2)) {
        _lastErrorTime = DateTime.now();
        if (mounted) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to save notes'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  Future<void> _handleNoteUpdate(Note? updatedNote) async {
    if (updatedNote == null) return;

    setState(() {
      final index = _notes.indexWhere((n) => n.id == updatedNote.id);
      if (index != -1) {
        _notes[index] = updatedNote;
      } else {
        _notes.add(updatedNote);
      }
    });
    await _saveNotes();
  }

  Future<void> _deleteNote(String id) async {
    setState(() => _notes.removeWhere((note) => note.id == id));
    await _saveNotes();
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.note_add, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            "No Notes Found",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            "Tap the + button to create one",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildNoteItem(Note note) {
    return Dismissible(
      key: Key(note.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text("Delete Note"),
                content: const Text(
                  "Are you sure you want to delete this note?",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text(
                      "Delete",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
        );
      },
      onDismissed: (direction) => _deleteNote(note.id),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () async {
            final updatedNote = await Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => TodoAddPage(
                      note: note,
                      onSave: (updatedNote) => _handleNoteUpdate(updatedNote),
                    ),
                settings: const RouteSettings(name: '/edit_note'),
              ),
            );
            if (updatedNote != null) {
              await _handleNoteUpdate(updatedNote);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Checkbox(
                  value: note.isCompleted,
                  onChanged: (value) async {
                    await _handleNoteUpdate(
                      Note(
                        id: note.id,
                        title: note.title,
                        tasks: note.tasks,
                        description: note.description,
                        createdAt: note.createdAt,
                        isCompleted: value ?? false,
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.title,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          decoration:
                              note.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (note.description.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          note.description,
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                if (note.tasks.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Chip(
                      label: Text('${note.tasks.length}'),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(65, 65, 65, 1),
        title: const Text(
          "To2Do",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:
          _isLoading
              ? _buildLoadingIndicator()
              : _notes.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: _notes.length,
                itemBuilder: (context, index) => _buildNoteItem(_notes[index]),
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newNote = await Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => TodoAddPage(
                    onSave: (newNote) => _handleNoteUpdate(newNote),
                  ),
              settings: const RouteSettings(name: '/add_note'),
            ),
          );
          if (newNote != null) {
            await _handleNoteUpdate(newNote);
          }
        },
        backgroundColor: const Color.fromRGBO(56, 56, 56, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
