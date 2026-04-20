import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chitpad_app/features/notes/domain/entities/note_entity.dart';

part 'note_model.freezed.dart';
part 'note_model.g.dart';

@freezed
class NoteModel with _$NoteModel {
  const factory NoteModel({
    required String id,
    required String title,
    required String content,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _NoteModel;

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);
}

extension NoteModelMapper on NoteModel {
  NoteEntity toEntity() => NoteEntity(
        id: id,
        title: title,
        content: content,
        userId: userId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
