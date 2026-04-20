import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:chitpad_app/core/theme/app_spacing.dart';
import 'package:chitpad_app/features/notes/domain/entities/note_entity.dart';
import 'package:chitpad_app/features/notes/presentation/providers/notes_provider.dart';

class NoteDetailPage extends ConsumerStatefulWidget {
  const NoteDetailPage({super.key});

  @override
  ConsumerState<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends ConsumerState<NoteDetailPage> {
  final _titleController   = TextEditingController();
  final _contentController = TextEditingController();
  NoteEntity? _existingNote;

  @override
  void initState() {
    super.initState();
    // If navigated with existing note arguments, populate fields
    _existingNote = Get.arguments as NoteEntity?;
    if (_existingNote != null) {
      _titleController.text   = _existingNote!.title;
      _contentController.text = _existingNote!.content;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_existingNote == null ? 'New note' : 'Edit note'),
        actions: [
          if (_existingNote != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () async {
                await ref.read(notesProvider.notifier).deleteNote(_existingNote!.id);
                Get.back();
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              style: Theme.of(context).textTheme.titleLarge,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),
            const Divider(),
            Expanded(
              child: TextField(
                controller: _contentController,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  hintText: 'Start writing...',
                  border: InputBorder.none,
                ),
                // TODO: Add markdown support / rich text editor after design decisions
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final title   = _titleController.text.trim();
          final content = _contentController.text.trim();
          if (title.isEmpty) return;

          if (_existingNote == null) {
            await ref.read(notesProvider.notifier).createNote(title, content);
          } else {
            await ref.read(notesProvider.notifier).updateNote(
                  _existingNote!.id, title, content,
                );
          }
          Get.back();
        },
        icon: const Icon(Icons.check),
        label: const Text('Save'),
      ),
    );
  }
}
