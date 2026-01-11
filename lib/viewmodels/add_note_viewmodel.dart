import 'package:flutter/material.dart';
import 'package:dasz_spisac/models/local_model.dart';
import 'package:dasz_spisac/services/database_service.dart';

class AddNoteViewModel extends ChangeNotifier {
  final DatabaseService _dbService = DatabaseService();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController extensionController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> addNote() async {
    if (titleController.text.isEmpty || extensionController.text.isEmpty) {
      return false;
    }

    _setLoading(true);

    try {
      final userMap = LocalModel.readUser();
      final domain = userMap?['domain'];
      final userId = userMap?['id'];

      if (domain == null || userId == null) {
        throw Exception("Brak danych użytkownika");
      }

      final newNote = {
        'title': titleController.text,
        'extension_file': extensionController.text.toUpperCase(),
        'id_user': userId,
        'date': DateTime.now().toIso8601String(),
        'size_file': 10240,
      };

      await _dbService.addNote(domain, newNote);
      _setLoading(false);
      return true;
    } catch (e) {
      _setLoading(false);
      return false;
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  void dispose() {
    titleController.dispose();
    extensionController.dispose();
    super.dispose();
  }
}