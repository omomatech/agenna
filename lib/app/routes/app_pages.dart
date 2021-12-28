import 'package:agenna/app/modules/auth/bindings/auth_bindings.dart';
import 'package:agenna/app/modules/auth/views/auth_login_views.dart';
import 'package:agenna/app/modules/displayVisiting/binding/displayvisting_binding.dart';
import 'package:agenna/app/modules/displayVisiting/view/dispalyvisiting_view.dart';
import 'package:agenna/app/modules/entery/binding/enter_binding.dart';
import 'package:agenna/app/modules/entery/view/entery_view.dart';
import 'package:agenna/app/modules/home/binding/home_binding.dart';
import 'package:agenna/app/modules/home/views/home_view.dart';
import 'package:agenna/app/modules/notification/bindings/NotelistBinding.dart';
import 'package:agenna/app/modules/notification/bindings/note_binding.dart';
import 'package:agenna/app/modules/notification/controllers/note_controller.dart';
import 'package:agenna/app/modules/notification/views/list_note.dart';
import 'package:agenna/app/modules/notification/views/note_view.dart';
import 'package:agenna/app/modules/notification/views/web_view.dart';
import 'package:agenna/app/modules/on_boarding/bindings/on_boarding_bindings.dart';
import 'package:agenna/app/modules/on_boarding/views/on_boarding_view.dart';
import 'package:agenna/app/modules/reservation/binding/reservation_binding.dart';
import 'package:agenna/app/modules/reservation/view/reservation_view.dart';
import 'package:get/get.dart';
import 'package:agenna/app/modules/settings/bindings/settings_binding.dart';
import 'package:agenna/app/modules/settings/views/language_view.dart';
import 'package:agenna/app/modules/settings/views/settings_view.dart';
import 'package:agenna/app/modules/settings/views/theme_mode_view.dart';
import 'package:agenna/app/modules/tab/binding/tab_binding.dart';
import 'package:agenna/app/modules/tab/view/view_tab.dart';
import 'package:agenna/app/modules/visiting/binding/visitng_binding.dart';
import 'package:agenna/app/modules/visiting/view/view_visiting.dart';
part 'app_routes.dart';

class AppPages {

  // ignore: constant_identifier_names
  static const INITIAL = Routes.ROOT;
  static const SECOND_ENTERY = Routes.ENTERY;
  static final routes = [
    GetPage(name: Routes.ENTERY, page: () => EnteryView(), binding: EnteryBinding()),
    GetPage(name: Routes.ROOT, page: () => OnBoardingView(), binding: OnBoardingBindings()),
    GetPage(name: Routes.LOGIN, page: () => AuthLoginView(), binding: AuthBindings()),
    GetPage(name: Routes.HOME, page: () => HomeView(), binding: HomeBindings()),
    GetPage(name: Routes.SETTINGS, page: () => SettingsView(), binding: SettingsBinding()),
    GetPage(name: Routes.SETTINGS_THEME_MODE, page: () => ThemeModeView(), binding: SettingsBinding()),
    GetPage(name: Routes.SETTINGS_LANGUAGE, page: () => LanguageView(), binding: SettingsBinding()),
    GetPage(name: Routes.TAB, page: () => TabView(), binding: TabsBinding()),
    GetPage(name: Routes.VISITING, page: () => VisitingView(), binding: Visitingbinding()),
    GetPage(name: Routes.NOTEFICATION, page: () => NoteFicationView(), binding: NoteficationBindings()),
    GetPage(name: Routes.VIEWURL, page: () =>Viewurl(), binding: NoteficationBindings()),
    GetPage(name: Routes.RESERVATION, page: () =>ReservationView(), binding: ReservationBinding()),
    GetPage(name: Routes.DISPLAYVISTING, page: () => DisplayVisiting_view(), binding: DisplayVisitingbinding()),
    GetPage(name: Routes.NOTELIST, page: () => NoteFicationListView(), binding: NoteListBindings()),
  ];
}
