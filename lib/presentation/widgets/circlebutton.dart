//import 'package:clay_containers/widgets/clay_container.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({Key? key, required this.fun, required this.wdg})
      : super(key: key);
  final void Function()? fun;
  final Widget wdg;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: ClayContainer(
        height: 100,
        width: 100,
        borderRadius: 50,
        curveType: CurveType.concave,
        spread: 5,
        child: Center(
          child: wdg,
        ),
      ),
    );
  }
}

Icon icon({IconData? ic}) {
  return Icon(
    ic,
    size: 40,
    color: Colors.orange,
  );
}
