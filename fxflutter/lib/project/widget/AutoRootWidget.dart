import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui' as ui show window;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'dart:collection';
import 'dart:ui' as ui show window, PointerDataPacket;
import 'AutoScreenUtil.dart';
export 'dart:ui' show AppLifecycleState, Locale;

class AutoRootWidget extends WidgetsFlutterBinding{
  static AutoScreenUtil autoScreenUtil;
  static WidgetsBinding ensureInitialized(double uedWidth,double uedHeight) {
    autoScreenUtil = AutoScreenUtil(width: uedWidth,height: uedHeight)..init();
    if (WidgetsBinding.instance == null) {
        AutoRootWidget();
    }
    return WidgetsBinding.instance;
  }

  @override
  ViewConfiguration createViewConfiguration() {
    return ViewConfiguration(
        size:autoScreenUtil.getScreenAdapterSize(),
        devicePixelRatio:autoScreenUtil.getAdapterRatio()
    );
  }
  @override
  void initInstances() {
    super.initInstances();
    ui.window.onPointerDataPacket = _handlePointerDataPacket;
  }

  final Queue<PointerEvent> _pendingPointerEvents = Queue<PointerEvent>();

  void _handlePointerDataPacket(ui.PointerDataPacket packet) {
    _pendingPointerEvents.addAll(PointerEventConverter.expand(
        packet.data,
        autoScreenUtil.getAdapterRatio())
    );
    if (!locked) _flushPointerEventQueue();
  }

  void _flushPointerEventQueue() {
    assert(!locked);
    while (_pendingPointerEvents.isNotEmpty)
      _handlePointerEvent(_pendingPointerEvents.removeFirst());
  }
  final Map<int, HitTestResult> _hitTests = <int, HitTestResult>{};

  @override
  void cancelPointer(int pointer) {
    if (_pendingPointerEvents.isEmpty && !locked)
      scheduleMicrotask(_flushPointerEventQueue);
    _pendingPointerEvents.addFirst(PointerCancelEvent(pointer: pointer));
  }

  void _handlePointerEvent(PointerEvent event) {
    assert(!locked);
    HitTestResult result;
    if (event is PointerDownEvent) {
      assert(!_hitTests.containsKey(event.pointer));
      result = HitTestResult();
      hitTest(result, event.position);
      _hitTests[event.pointer] = result;
      assert(() {
        if (debugPrintHitTestResults) debugPrint('$event: $result');
        return true;
      }());
    } else if (event is PointerUpEvent || event is PointerCancelEvent) {
      result = _hitTests.remove(event.pointer);
    } else if (event.down) {
      result = _hitTests[event.pointer];
    } else {
      return; // We currently ignore add, remove, and hover move events.
    }
    if (result != null) dispatchEvent(event, result);
  }
}