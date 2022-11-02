[<img src="https://techdirr.com/techdirr.png" width="200" />](https://techdirr.com)


# dropdown_pro

Single or Multi Selection Dropdown with search dropdown item, and easy to customization.


## Using

For help getting started with Flutter, view our
[online documentation](https://pub.dev/documentation/dropdown_pro/latest), which offers tutorials,
samples, guidance on mobile and web development, and a full API reference.

## Installation

First, add `dropdown_pro` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels).

In your flutter project add the dependency:

```yml
dependencies:
  ...
  dropdown_pro:
```

For help getting started with Flutter, view the online
[documentation](https://flutter.io/).

## Example

Please follow this [example](https://github.com/techdirrdev/dropdown_pro/tree/master/example) here.

### Dropdown - Single Selection and Multi Selection

1. Declare variables
```dart
List<DropdownItem> _itemList = [];
String _singleSelectedId = ""; //for single selection dropdown
final List<String> _mutiSelectedIds = []; //for multi selection dropdown
```

2. Generate your item list
```dart
_generateItems() {
  List<DropdownItem> list = [];
  for (int i = 1; i <= 20; i++) {
    list.add(DropdownItem(
        id: "$i",
        value: "Item $i",
        data: User(userId: "$i", userName: "User $i") /* User class is another data class (use any datatype in data field )*/
    ));
  }
  setState(() {
    _itemList = list;
  });
}
```

3. Put Dropdown in your build function

* Single Selection Dropdown
```dart
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
})
```

* Multi Selection Dropdown
```dart
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
})
```

* Dropdown with TextField
```dart
DropdownTextField(
  controller: _conDropdownTextField,
  list: _itemList,
  hintText: "Item search",
  labelText: "Item search"
),
```

