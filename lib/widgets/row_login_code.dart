import 'package:flutter/material.dart';

class RowLoginCode extends StatefulWidget {
  final List colors;
  const RowLoginCode({
    required this.colors,
    Key? key,
  }) : super(key: key);

  @override
  State<RowLoginCode> createState() => _RowLoginCodeState();
}

class _RowLoginCodeState extends State<RowLoginCode> {
  Widget _buildContainer(int idx) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: widget.colors[idx],
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [0, 1, 2, 3, 4, 5]
          .map(
            (e) => _buildContainer(e),
          )
          .toList(),
    );
  }
}
