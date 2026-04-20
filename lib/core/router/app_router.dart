import 'package:get/get.dart';
import 'package:chitpad_app/core/router/route_names.dart';
import 'package:chitpad_app/core/router/route_guard.dart';
import 'package:chitpad_app/features/auth/presentation/pages/login_page.dart';
import 'package:chitpad_app/features/auth/presentation/pages/register_page.dart';
import 'package:chitpad_app/features/notes/presentation/pages/notes_list_page.dart';
import 'package:chitpad_app/features/notes/presentation/pages/note_detail_page.dart';

/// GetX page definitions — navigation only.
/// No GetX bindings, no GetX controllers here.
/// Middleware = route guard (auth check).
class AppRouter {
  static List<GetPage> pages = [
    GetPage(
      name: RouteNames.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteNames.register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: RouteNames.notesList,
      page: () => const NotesListPage(),
      middlewares: [AuthGuard()],
    ),
    GetPage(
      name: RouteNames.noteDetail,
      page: () => const NoteDetailPage(),
      middlewares: [AuthGuard()],
    ),
    // TODO: Add pages as you build features
  ];
}
