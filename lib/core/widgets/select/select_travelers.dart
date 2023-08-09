// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'base/selection_widget.dart';

class SelectTravelers extends StatefulWidget {
  final String title;
  final ValueChanged<Travelers> onSelect;
  final Travelers initValue;
  const SelectTravelers({
    Key? key,
    required this.onSelect,
    required this.initValue,
    required this.title,
  }) : super(key: key);

  @override
  State<SelectTravelers> createState() => _SelectTravelersState();
}

class _SelectTravelersState extends State<SelectTravelers> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => selectValue(widget.initValue));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: SelectionWidget(
        title: widget.title,
        icon: Icons.group,
        value: widget.initValue.toString(),
        onTap: () {
          _showModal(context);
        },
      ),
    );
  }

  void _showModal(context) {
    showModalBottomSheet(
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        context: context,
        builder: (context) {
          return BottomSheetSelectTravelers(
            init: widget.initValue,
            onSelect: selectValue,
          );
        });
  }

  void selectValue(Travelers value) {
    setState(() {
      widget.onSelect(value);
    });
  }
}

class BottomSheetSelectTravelers extends StatefulWidget {
  final Travelers init;
  final ValueChanged<Travelers> onSelect;
  const BottomSheetSelectTravelers({
    Key? key,
    required this.init,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<BottomSheetSelectTravelers> createState() =>
      _BottomSheetSelectTravelersState();
}

class _BottomSheetSelectTravelersState
    extends State<BottomSheetSelectTravelers> {
  late Travelers travelers;
  @override
  void initState() {
    super.initState();
    travelers = widget.init;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: const Text(
            "Select Travelers",
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              icon: const Icon(Icons.done),
              onPressed: () {
                widget.onSelect(travelers);
                Navigator.pop(context);
              }),
        ),
        const Divider(),
        TravelerItem(
          icon: Icons.man,
          title: "Adult",
          subtitle: "More than 12 years old",
          initCount: travelers.adultCount,
          onChange: (value) => setState(() => travelers.adultCount = value),
        ),
        TravelerItem(
          icon: Icons.woman,
          title: "Child",
          subtitle: "From 2 years to 12 years",
          initCount: travelers.childCount,
          onChange: (value) => setState(() => travelers.childCount = value),
        ),
        TravelerItem(
          icon: Icons.child_friendly_outlined,
          title: "Baby",
          subtitle: "Less than 2 years old",
          initCount: travelers.babyCount,
          onChange: (value) => setState(() => travelers.babyCount = value),
        ),
      ],
    );
  }
}

class TravelerItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final int? initCount;
  final ValueChanged<int> onChange;

  const TravelerItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.initCount = 0,
    required this.onChange,
  }) : super(key: key);

  @override
  State<TravelerItem> createState() => _TravelerItemState();
}

class _TravelerItemState extends State<TravelerItem> {
  final GlobalKey dropdownKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => openDropdown(),
      title: Text(widget.title),
      leading: Icon(widget.icon),
      subtitle: Text(widget.subtitle),
      trailing: DropdownButton<int>(
        key: dropdownKey,
        isDense: true,
        value: widget.initCount,
        items: List<int>.generate(10, (index) => index)
            .toList()
            .map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(
              value.toString(),
            ),
          );
        }).toList(),
        onChanged: (int? newValue) {
          widget.onChange(newValue ?? 0);
        },
      ),
    );
  }

  void openDropdown() {
    GestureDetector? detector;
    void searchForGestureDetector(BuildContext? element) {
      element?.visitChildElements((element) {
        if (element.widget is GestureDetector) {
          detector = element.widget as GestureDetector?;
        } else {
          searchForGestureDetector(element);
        }
      });
    }

    searchForGestureDetector(dropdownKey.currentContext);
    assert(detector != null);
    detector?.onTap?.call();
  }
}

class Travelers {
  int adultCount;
  int childCount;
  int babyCount;
  Travelers({
    required this.adultCount,
    this.childCount = 0,
    this.babyCount = 0,
  });

  @override
  String toString() {
    List<String> textParts = [];
    if (adultCount > 0) {
      textParts.add(_extractText(type: "Adult", count: adultCount));
    }
    if (childCount > 0) {
      textParts.add(_extractText(type: "Child", count: childCount));
    }
    if (babyCount > 0) {
      textParts.add(_extractText(type: "Baby", count: babyCount));
    }

    return textParts.join(', ');
  }

  String _extractText({required String type, required int count}) {
    String newTypeText = '';

    if (count == 1) {
      newTypeText = type;
    } else {
      if (type[type.length - 1] == 'y') {
        newTypeText = "${type.substring(0, type.length - 1)}ies";
      } else {
        newTypeText = '${type}s';
      }
    }

    return "$count $newTypeText";
  }
}
