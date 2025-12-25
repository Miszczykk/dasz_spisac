import 'package:flutter/material.dart';
import 'package:dasz_spisac/services/database_service.dart';
import 'package:dasz_spisac/models/local_model.dart';
import 'dart:async';

class MainViewmodel extends ChangeNotifier {
  final DatabaseService _dbService = DatabaseService();
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> _notes = [];
  List<Map<String, dynamic>> get notes => _notes;

  StreamSubscription? _notesSubscription;
  Timer? _debounce;

  MainViewmodel() {
    _startListening();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _startListening();
    });
  }

  void _startListening() {
    _notesSubscription?.cancel();

    final query = searchController.text;

    final userMap = LocalModel.readUser();
    final domain = userMap?['domain'];

    if (domain == null || domain.isEmpty) {
      _notes = [];
      notifyListeners();
      return;
    }

    _notesSubscription = _dbService
        .getData(query, domain)
        .listen(
          (data) {
            _notes = data;
            notifyListeners();
          },
          onError: (error) {
            print("Błąd streama: $error");
          },
        );
  }

  @override
  void dispose() {
    searchController.dispose();
    _notesSubscription?.cancel();
    _debounce?.cancel();
    super.dispose();
  }
}
