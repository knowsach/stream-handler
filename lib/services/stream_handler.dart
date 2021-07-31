import 'dart:async';

class StreamHandler {
  StreamHandler._internal();
  static final StreamHandler _instance = StreamHandler._internal();
  factory StreamHandler() => _instance;

  var _controller1 = StreamController<dynamic>.broadcast(),
      _controller2 = StreamController<dynamic>.broadcast(),
      _controller3 = StreamController<dynamic>.broadcast();

  Map<String, dynamic> _streamRecord = {};
  int _lastUsedController = 1;

  createController<T>(String task) {
    var controller = _assignController<T>(_lastUsedController, task);
    _lastUsedController++;
    return controller;
  }

  dynamic _assignController<T>(int lastUsedController, String task) {
    switch (lastUsedController.toString()) {
      case '1':
        _controller1 = StreamController<T>.broadcast();
        _streamRecord[task] = _controller1;
        return _controller1;

      case '2':
        _controller2 = StreamController<T>.broadcast();
        _streamRecord[task] = _controller2;
        return _controller2;

      case '3':
        _controller3 = StreamController<T>.broadcast();
        _streamRecord[task] = _controller3;
        return _controller3;

      default:
        return null;
    }
  }

  getStream(String task) {
    print('_streamRecord : ${_streamRecord}');
    if (_streamRecord[task] != null) {
      print('_streamRecord 2 : ${_streamRecord[task].stream}');
      return _streamRecord[task].stream;
    } else {
      return null;
    }
  }

  getSink(String task) {
    print('_streamRecord[task] : ${_streamRecord[task]}');

    if (_streamRecord[task] != null) {
      return _streamRecord[task].sink;
    } else {
      return null;
    }
  }

  setDataInSInk(String task) {}
}
