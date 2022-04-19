import 'package:flutter/material.dart';

class KChoicesWrap<T> extends StatefulWidget {
  const KChoicesWrap({Key? key, required this.list, required this.onItemSelected, this.spacing = 0.0}) : super(key: key);
  final List<T> list;
  final void Function(T? value) onItemSelected;
  final double spacing;
  @override
  State<KChoicesWrap> createState() => _KChoicesWrapState<T>();
}

class _KChoicesWrapState<T> extends State<KChoicesWrap> {
  late List<bool> selectionStates;
  
  @override
  void initState() {
    selectionStates = List.generate(widget.list.length, (_) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: widget.spacing,
        children: widget.list.map((e) =>
        ChoiceChip(
            label: Text(e.runtimeType is String ? e : e.toString()),
            selected: selectionStates[widget.list.indexOf(e)],
          onSelected: (value){
              if(value){
                setState(() {
                  selectionStates = List.generate(widget.list.length, (_) => false);
                  selectionStates[widget.list.indexOf(e)] = value;
                });
                widget.onItemSelected(e);
              }
          },
        )
    ).toList());
  }
}
