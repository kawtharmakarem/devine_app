import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownList extends StatefulWidget {
  CustomDropdownList({super.key, this.onChanged});
  void Function(String?)? onChanged;
  @override
  State<CustomDropdownList> createState() => _CustomDropdownListState();
}

class _CustomDropdownListState extends State<CustomDropdownList> {
  final List<String> items = [
    'A_Item1',
    'A_Item2',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];
  final TextEditingController textEditingController = TextEditingController();
  String? selectedValue;
  @override
  void dispose() {
    textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Material(
          child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select Item',
            style: TextStyle(
              fontSize: getResponsiveFontSizeText(context,
                  fontSize: width < AppConstants.maxMobileWidth ? 18 : 32),
              color: Theme.of(context).hintColor,
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: getResponsiveFontSizeText(context,
                            fontSize:
                                width < AppConstants.maxMobileWidth ? 18 : 32),
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          // onChanged: (value) {
          //   setState(() {
          //     selectedValue = value;
          //   });
          // },
          onChanged: widget.onChanged,
          buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: width < AppConstants.maxMobileWidth ? 40 : 70,
            width: width < AppConstants.maxMobileWidth ? 300 : 600,
          ),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 300,
          ),
          menuItemStyleData: MenuItemStyleData(
            height: width < AppConstants.maxMobileWidth ? 40 : 60,
          ),
          dropdownSearchData: DropdownSearchData(
            searchController: textEditingController,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: width < AppConstants.maxMobileWidth ? 50 : 80,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: textEditingController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: 'Search for an item...',
                  hintStyle: TextStyle(
                      fontSize: width < AppConstants.maxMobileWidth
                          ? getResponsiveFontSizeText(context, fontSize: 14)
                          : getResponsiveFontSizeText(context, fontSize: 20)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return item.value.toString().contains(searchValue);
            },
          ),
          //This to clear the search value when you close the menu
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              textEditingController.clear();
            }
          },
        ),
      )),
    );
  }
}
