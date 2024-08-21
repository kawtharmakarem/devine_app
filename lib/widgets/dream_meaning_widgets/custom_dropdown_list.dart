import 'package:divinecontrol/screens/dream_meaning_screens/dream_meaning.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';


typedef void StringCallBack(String selectedValue);

class CustomDropdownList extends StatefulWidget {
  CustomDropdownList({super.key, required this.dreamTitles, required this.callBack });
 //final void Function(String?)? onChanged;
 final List<String> dreamTitles;
 final StringCallBack callBack;

 
  @override
  State<CustomDropdownList> createState() => _CustomDropdownListState();
}

class _CustomDropdownListState extends State<CustomDropdownList> {
  // final List<String> items = [
  //   'A_Item1',
  //   'A_Item2',
  //   'A_Item3',
  //   'A_Item4',
  //   'B_Item1',
  //   'B_Item2',
  //   'B_Item3',
  //   'B_Item4',
  // ];
 final TextEditingController textEditingController = TextEditingController();
  String? selectedValue;
  @override
  void dispose() {
    //textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.black
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Material(
          child: DropdownButtonHideUnderline(

        child: DropdownButton2<String>(
          isExpanded: true,
          
          hint: Text(
            'Choose your last night dream here!..',
            style: TextStyle(
              fontSize: getResponsiveFontSizeText(context,
                  fontSize: width < AppConstants.maxMobileWidth ? 16 : 24),
              color: Theme.of(context).hintColor,
            ),
          ),
          
          items: widget.dreamTitles
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
          onChanged: (value) {
            setState(() {
              selectedValue = value;
              DreamMeaning.of(context)?.string=selectedValue!;
            });
          },
          //onChanged: widget.onChanged,
          buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: width < AppConstants.maxMobileWidth ? 40 : 70,
            width:  width,//300
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight:width<AppConstants.maxMobileWidth? 300:500,
          ),
          menuItemStyleData: MenuItemStyleData(
            height: width < AppConstants.maxMobileWidth ? 40 : 60,
          ),
          dropdownSearchData: DropdownSearchData(
            searchController:textEditingController,

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
                style: TextStyle(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 14:20)),
                expands: true,
                maxLines: null,
                controller:textEditingController,
                decoration: InputDecoration(
                  
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  
                  hintText: 'Search for an item...',
                  hintStyle: TextStyle(
                      fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 14:24)),
                      
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
