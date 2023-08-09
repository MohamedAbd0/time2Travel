// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'base/selection_widget.dart';

class SelectPiker extends StatefulWidget {
  final List<KeyPares> items;
  final ValueChanged<KeyPares> onSelect;
  final String title;
  final String hintText;
  final KeyPares? initValue;
  final IconData? icon;
  const SelectPiker({
    Key? key,
    required this.items,
    required this.onSelect,
    required this.title,
    required this.hintText,
    this.icon,
    this.initValue,
  }) : super(key: key);

  @override
  State<SelectPiker> createState() => _SelectPikerState();
}

class _SelectPikerState extends State<SelectPiker> {
  String? textValue;

  @override
  void initState() {
    super.initState();
    if (widget.initValue != null) {
      Future.delayed(Duration.zero, () => selectValue(widget.initValue!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: SelectionWidget(
        title: widget.title,
        hintText: widget.hintText,
        icon: widget.icon,
        value: textValue,
        onTap: () {
          _showModal(context);
        },
      ),
    );
  }

  void _showModal(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        context: context,
        builder: (context) {
          return BottomSheetSearchList(
            title: widget.title,
            items: widget.items,
            onSelect: selectValue,
          );
        });
  }

  void selectValue(KeyPares value) {
    setState(() {
      textValue = value.name;
      widget.onSelect(value);
    });
  }
}

class BottomSheetSearchList extends StatelessWidget {
  final List<KeyPares> items;
  final ValueChanged<KeyPares> onSelect;
  final String title;
  const BottomSheetSearchList({
    Key? key,
    required this.items,
    required this.onSelect,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text("Select $title"),
          trailing: IconButton(
              icon: const Icon(Icons.close),
              color: const Color(0xFF1F91E7),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: items.length,
          separatorBuilder: (context, _) => const Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                items[index].name,
                textAlign: TextAlign.center,
              ),
              onTap: () {
                onSelect(items[index]);
                Navigator.pop(context);
              },
            );
          },
        )
      ],
    );
  }
}

class KeyPares {
  String id;
  String name;
  KeyPares({
    required this.id,
    required this.name,
  });
}
