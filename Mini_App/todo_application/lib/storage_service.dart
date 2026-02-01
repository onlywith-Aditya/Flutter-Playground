import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_application/models_note.dart';
import 'dart:convert';

class StorageService {
  static const _notesKey = 'notes';

  //Save all notes
  static Future<void> saveNotes(List<Note> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final notesJson = notes.map((note) => note.toMap()).toList();
    await prefs.setString(_notesKey, json.encode(notesJson));
  }

  // Load all notes
  static Future<List<Note>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final notesJson = prefs.getString(_notesKey);
    if (notesJson != null) {
      final List<dynamic> decoded = json.decode(notesJson);
      return decoded.map((map) => Note.fromMap(map)).toList();
    }
    return [];
  }
}
