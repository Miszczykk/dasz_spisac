import 'package:flutter/material.dart';
import 'package:dasz_spisac/models/local_model.dart';
import 'package:dasz_spisac/services/database_service.dart';
import 'package:file_picker/file_picker.dart';

class AddNoteViewModel extends ChangeNotifier {
  final DatabaseService _dbService = DatabaseService();

  final TextEditingController titleController = TextEditingController();

  PlatformFile? _selectedFile;
  PlatformFile? get selectedFile => _selectedFile;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<String> _allowedExtensions = ['txt', 'docx', 'odt', 'xlsx', 'ods', 'pptx', 'pdf'];
  final int _maxFileSizeInBytes = 2 * 1024 * 1024;

  Future<void> pickFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: _allowedExtensions,
    );

    if(result != null){
      _selectedFile = result.files.first;

      if(titleController.text.isEmpty){
        String fileName = _selectedFile!.name;
        String? extension = _selectedFile!.extension;

        if(extension != null && fileName.endsWith('.$extension')){
          titleController.text = fileName.substring(0, fileName.length - (extension.length + 1));
        }else{
          titleController.text = fileName;
        }
      }
      notifyListeners();
    }
  }

  Future<bool> addNote() async {
    if (titleController.text.isEmpty || _selectedFile == null) {
      return false;
    }

    if(_selectedFile!.size > _maxFileSizeInBytes){
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
        'extension_file': _selectedFile!.extension?.toUpperCase() ?? 'PM',
        'id_user': userId,
        'date': DateTime.now().toIso8601String(),
        'size_file': _selectedFile!.size,
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
    super.dispose();
  }
}