import 'package:flutter/material.dart';

/// A utility class where the title is hidden in expanded state
/// where as, on scroll, the title is showing the AppBar title
class ClutterSliverApp extends StatefulWidget {
  final Widget child;

  const ClutterSliverApp({Key? key, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ClutterSliverAppState();
}

class _ClutterSliverAppState extends State<ClutterSliverApp> {
  ScrollPosition? _scrollPosition;
  bool _isVisible = false;

  /// The [Visibility] widget can be replaced for the animation such as [AnimatedOpacity]
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: widget.child,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  _addListener() {
    _scrollPosition = Scrollable.of(context)?.position;
    _scrollPosition?.addListener(_positionScrollListener);
    _positionScrollListener();
  }

  _removeListener() => _scrollPosition?.removeListener(_positionScrollListener);

  _positionScrollListener() {
    final FlexibleSpaceBarSettings? settings = context
        .dependOnInheritedWidgetOfExactType(aspect: FlexibleSpaceBarSettings);
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_isVisible != visible) {
      setState(() {
        _isVisible = visible;
      });
    }
  }
}
