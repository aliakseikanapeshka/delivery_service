import 'package:delivery_service/pages/shell/shell_bloc.dart';
import 'package:delivery_service/services/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShellService {
  void setNotificationCount(Pages page, int count) {
    BlocProvider.of<ShellBloc>(mainGlobalKey.currentContext);
  }
}
