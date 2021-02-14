import 'package:delivery_service/widgets/loading_indicator.dart';
import 'package:flutter/widgets.dart';

import 'main_screen.dart';

class App extends StatelessWidget {
  const App(this._onReady, {Key key}) : super(key: key);

  final Future _onReady;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _onReady,
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.done
              ? const MainScreen()
              : LoadingIndicator(),
    );
  }
}
