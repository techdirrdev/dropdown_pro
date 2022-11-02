import 'dart:developer';
import 'package:dropdown_pro/dropdown.dart';
import 'package:dropdown_pro/dropdown_item.dart';
import 'package:dropdown_pro/dropdown_textfield.dart';
import 'package:dropdown_pro_example/user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: DropdownExample());
  }
}

class DropdownExample extends StatefulWidget {
  const DropdownExample({Key? key}) : super(key: key);

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  List<DropdownItem> _itemList = [];
  String _singleSelectedId = "";
  final List<String> _mutiSelectedIds = [];
  final TextEditingController _conDropdownTextField = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generateItems();
  }

  _generateItems() {
    List<DropdownItem> list = [];
    for (int i = 1; i <= 20; i++) {
      list.add(DropdownItem(
          id: "$i",
          value: "Item $i",
          data: User(
              userId: "$i",
              userName:
                  "User $i") /* User class is another data class (use any datatype in data field )*/
          ));
    }
    setState(() {
      _itemList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown Example"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Dropdown.singleSelection(
                  title: "Single Selection Dropdown",
                  labelText: "Single",
                  hintText: "Single Selection",
                  list: _itemList,
                  selectedId: _singleSelectedId,
                  isAddItem: true,
                  onTapAddItem: (searchValue) {
                    log(searchValue);
                  },
                  onSingleItemListener: (selectedItem) {
                    setState(() {
                      _singleSelectedId = selectedItem.id;
                    });
                    String itemId = selectedItem.id;
                    String itemName = selectedItem.value;
                    User user = selectedItem.data as User;
                    log("Item Id: $itemId -- Item Name: $itemName ## Other Details ## User Id: ${user.userId} -- User Name: ${user.userName}");
                  }),
              const SizedBox(
                height: 20,
              ),
              Dropdown.multiSelection(
                  title: "Multi Selection Dropdown",
                  labelText: "Multi",
                  hintText: "Multi Selection",
                  list: _itemList,
                  selectedIds: _mutiSelectedIds,
                  isAllSelection: true,
                  isAddItem: true,
                  onTapAddItem: (searchValue) {
                    log(searchValue);
                  },
                  onMultipleItemListener: (selectedItemList) {
                    for (DropdownItem selectedItem in selectedItemList) {
                      String itemId = selectedItem.id;
                      String itemName = selectedItem.value;
                      User user = selectedItem.data as User;
                      log("Item Id: $itemId -- Item Name: $itemName ## Other Details ## User Id: ${user.userId} -- User Name: ${user.userName}");
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              DropdownTextField(
                controller: _conDropdownTextField,
                list: _itemList,
                hintText: "Item search",
                labelText: "Item search",
              ),
            ],
          ),
        ),
      )),
    );
  }
}
