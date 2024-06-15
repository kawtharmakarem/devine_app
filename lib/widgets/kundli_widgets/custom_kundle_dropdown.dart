import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomKundleDropDownList extends StatefulWidget {
const  CustomKundleDropDownList({super.key, required this.items, this.label, required this.controller});
final List<String> items;
final String? label;
final TextEditingController controller;
  @override
  State<CustomKundleDropDownList> createState() => _CustomKundleDropDownListState();
}

class _CustomKundleDropDownListState extends State<CustomKundleDropDownList> {
 
  String? selectedValue;
  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     widget. label==null ?const  SizedBox() :  Text(
           widget. label!,
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 20))
                : AppStyles.styleBold24(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
          ),
        const SizedBox(height: 2,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppColors.black,
              ),
              borderRadius: BorderRadius.circular(8)),
          child: Material(
              child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              
              hint: Text(
                'select city',
                style: TextStyle(
                  fontSize: getResponsiveFontSizeText(context,
                      fontSize: width < AppConstants.maxMobileWidth ? 20 : 32),
                  color: Theme.of(context).hintColor,
                ),
              ),
              
              items:widget. items
                  .map((item) => DropdownMenuItem(
                    
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize:
                                    width < AppConstants.maxMobileWidth ? 20 : 32),
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              
              buttonStyleData: ButtonStyleData(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: width < AppConstants.maxMobileWidth ? 60 : 70,
                width: width < AppConstants.maxMobileWidth ? 300 : 600,
              ),
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 300,
              ),
              menuItemStyleData: MenuItemStyleData(
                height: width < AppConstants.maxMobileWidth ? 40 : 60,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: widget.controller,
                searchInnerWidgetHeight: 65,
                searchInnerWidget: Container(
                  height: width < AppConstants.maxMobileWidth ? 65 : 80,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: widget.controller,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: 'Search for an item...',
                      hintStyle: TextStyle(
                          fontSize: width < AppConstants.maxMobileWidth
                              ? getResponsiveFontSizeText(context, fontSize: 18)
                              : getResponsiveFontSizeText(context, fontSize: 28)),
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
                  widget.controller.clear();
                }
              },
            ),
          )),
        ),
      ],
    );
  }
}
