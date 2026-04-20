import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chitpad_app/features/notes/domain/entities/note_entity.dart';

// TODO: Wire datasource → repository → provider once notes API is built
// Pattern mirrors auth_provider.dart

sealed class NotesState { const NotesState(); }
class NotesInitial  extends NotesState { const NotesInitial(); }
class NotesLoading  extends NotesState { const NotesLoading(); }
class NotesLoaded   extends NotesState {
  final List<NoteEntity> notes;
  const NotesLoaded(this.notes);
}
class NotesError    extends NotesState {
  final String message;
  const NotesError(this.message);
}

class NotesNotifier extends StateNotifier<NotesState> {
  NotesNotifier() : super(const NotesInitial());

  Future<void> loadNotes()  async { /* TODO */ }
  Future<void> createNote(String title, String content) async { /* TODO */ }
  Future<void> updateNote(String id, String title, String content) async { /* TODO */ }
  Future<void> deleteNote(String id) async { /* TODO */ }
}

final notesProvider = StateNotifierProvider<NotesNotifier, NotesState>((ref) {
  return NotesNotifier();
});
