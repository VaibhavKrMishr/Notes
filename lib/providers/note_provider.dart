import 'package:flutter/material.dart';
import '../models/note.dart';
import '../repositories/note_repository.dart';

class NoteProvider with ChangeNotifier {
  final NoteRepository _noteRepository = NoteRepository();
  List<Note> _notes = [];
  bool _isLoading = false;

  List<Note> get notes => _notes;
  bool get isLoading => _isLoading;

  NoteProvider() {
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    _isLoading = true;
    notifyListeners();
    _notes = await _noteRepository.getNotes();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    await _noteRepository.insertNote(note);
    await fetchNotes(); // Refresh the list
  }

  Future<void> updateNote(Note note) async {
    await _noteRepository.updateNote(note);
    await fetchNotes(); // Refresh the list
  }

  Future<void> deleteNote(int id) async {
    await _noteRepository.deleteNote(id);
    await fetchNotes(); // Refresh the list
  }
}