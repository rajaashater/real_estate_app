import 'package:flutter/material.dart';

class KRangeSlider<T> extends StatefulWidget {
  const KRangeSlider({Key? key, this.min = 0.0, this.max = 1.0, required this.unit, this.onChanged, this.onSaved}) : super(key: key);
  final double min;
  final double max;
  final String unit;
  final void Function(RangeValues)? onChanged;
  final void Function(T? value)? onSaved;

  @override
  State<KRangeSlider> createState() => _KRangeSliderState();
}

class _KRangeSliderState<T> extends State<KRangeSlider> {
  late RangeValues values;



  @override
  void initState() {
    values = RangeValues(widget.min, widget.max);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(

      onChanged: (RangeValues value) {
        setState(() {
          values = value;

        });
        if(widget.onChanged != null){
          widget.onChanged!(value);
        }
      },
      divisions: 20,
      labels: RangeLabels('${values.start} ${widget.unit}', '${values.end} ${widget.unit}'),
      values: values,
      //onSaved: onSaved,
      min: widget.min,
      max: widget.max,

    );
  }
}
