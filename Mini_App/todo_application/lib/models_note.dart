class Note {
  final String id; // Add unique identifier
  final String title;
  final List<String> tasks;
  final String description;
  final DateTime createdAt;
  bool isCompleted; // Make this mutable

  Note({
    required this.id, // Add this
    required this.title,
    required this.tasks,
    required this.description,
    required this.createdAt,
    this.isCompleted = false, // Default value
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'tasks': tasks,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  // Create Note from Map
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      tasks: List<String>.from(map['tasks']),
      description: map['description'],
      createdAt: DateTime.parse(map['createdAt']),
      isCompleted: map['isCompleted'],
    );
  }

  // Helper method to create a new ID
  static String generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
