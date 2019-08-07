import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomCenter extends SingleChildRenderObjectWidget{

  CustomCenter({Widget child}):super(child:child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return RenderCustomCenter();
  }
}

class RenderCustomCenter extends RenderShiftedBox{
  RenderCustomCenter() : super(null);

  @override
  void paint(PaintingContext context, Offset offset) {
    // TODO: implement paint
    super.paint(context, offset);
  }

  @override
  void performLayout() {
    child.layout(
      BoxConstraints(
        minHeight: 0.0,
        maxHeight: constraints.minHeight,
        minWidth: 0.0,
        maxWidth: constraints.minWidth
      ),
      parentUsesSize:true
    );
    
    final BoxParentData childParentData = child.parentData;
    childParentData.offset = Offset(
        (constraints.maxWidth-child.size.width)/2,
        (constraints.maxHeight-child.size.height)/2
    );
    size = Size(constraints.maxWidth,constraints.maxHeight);
  }

}