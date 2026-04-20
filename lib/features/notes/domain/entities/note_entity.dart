import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_entity.freezed.dart';

@freezed
class NoteEntity with _$NoteEntity {
  const factory NoteEntity({
    required String id,
    required String title,
    required String content,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _NoteEntity;
}
