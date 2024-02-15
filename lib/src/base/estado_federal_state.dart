import 'dart:async';

abstract class EstadoFederal<T> {
  late T _state;
  late StreamController<T> _streamController;

  EstadoFederal(T initState) {
    _create(initState);
    _streamController.onCancel = () => close();
  }

  void _create(T initState) {
    _streamController = StreamController.broadcast();
    _addToSink(initState);
  }

  void _addToSink(T newStateValue) {
    _state = newStateValue;
    _streamController.sink.add(_state);
  }

  T get state => _state;
  set state(T newState) => _addToSink(newState);

  Stream<T> get stream => _streamController.stream;

  void error(Object error) {
    _streamController.addError(error);
    throw error;
  }

  void close() {
    _streamController.close();
    dispose();
  }

  void dispose() {}
  void init() {}
}
