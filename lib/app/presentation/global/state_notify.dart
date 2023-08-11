import 'package:flutter/foundation.dart';

///Helper to ChangeNotifier update state and notify listeners
abstract class StateNotify<State> extends ChangeNotifier {
  StateNotify(this._state) : _oldState = _state;

  State _state, _oldState;
  bool _mounted = true;

  State get stateCurrent => _state;
  State get oldState => _oldState;
  bool get mounted => _mounted;

  set state(State newState) {
    _update(newState);
  }

  void onlyUpdate(State newState) {
    _update(newState, notify: false);
  }

  void _update(State newState, {bool notify = true}) {
    if (_state != newState) {
      _oldState = stateCurrent;
      _state = newState;
      if (notify) {
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
