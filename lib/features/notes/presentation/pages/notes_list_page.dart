import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:chitpad_app/core/router/route_names.dart';
import 'package:chitpad_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:chitpad_app/features/notes/presentation/providers/notes_provider.dart';
import 'package:chitpad_app/shared/widgets/empty_state_widget.dart';
import 'package:chitpad_app/shared/widgets/error_widget.dart';
import 'package:chitpad_app/shared/widgets/loading_widget.dart';

class NotesListPage extends ConsumerWidget {
  const NotesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesState = ref.watch(notesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authProvider.notifier).logout(),
          ),
        ],
      ),
      body: switch (notesState) {
        NotesInitial() => const AppLoadingWidget(),
        NotesLoading() => const AppLoadingWidget(),
        NotesError(:final message) => AppErrorWidget(
            message: message,
            onRetry: () => ref.read(notesProvider.notifier).loadNotes(),
          ),
        NotesLoaded(:final notes) when notes.isEmpty => EmptyStateWidget(
            title: 'No notes yet',
            subtitle: 'Tap + to create your first note',
            action: FilledButton(
              onPressed: () => Get.toNamed(RouteNames.noteDetail),
              child: const Text('Create note'),
            ),
          ),
        NotesLoaded(:final notes) => ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: notes.length,
            itemBuilder: (ctx, i) {
              final note = notes[i];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(note.title),
                  subtitle: Text(
                    note.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => Get.toNamed(
                    RouteNames.noteDetail,
                    arguments: note,
                  ),
                ),
              );
            },
          ),
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(RouteNames.noteDetail),
        child: const Icon(Icons.add),
        // TODO: Replace with branded icon after design decisions
      ),
    );
  }
}
