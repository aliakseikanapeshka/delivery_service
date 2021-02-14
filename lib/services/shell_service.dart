import 'package:delivery_service/pages/shell/shell_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_service.dart';

class ShellService {
  ShellBloc _shellBloc;

  ShellBloc get shellBloc =>
      _shellBloc ??= BlocProvider.of<ShellBloc>(mainGlobalKey.currentContext);

  void changeShellTab(Pages page) {
    shellBloc.add(ShellEvent.selectPage(page));
  }
}
