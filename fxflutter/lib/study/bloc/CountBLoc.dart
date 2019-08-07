import 'dart:async';

class CountBloc{
  int _count;
  StreamController<int> _controller;
  CountBloc(){
    _count = 0;
    _controller = StreamController<int>();
  }

  Stream<int> get value => _controller.stream;

  increme(){
    _controller.sink.add(++_count);
  }

  dispose(){
    _controller.close();
  }
}