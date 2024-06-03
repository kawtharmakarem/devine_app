import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';


class ChooseLang extends StatelessWidget {
  const ChooseLang({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1),
          color: AppColors.lightPurple2),
          child:const FittedBox(
            child:  DropdownMenu(
              
              initialSelection: 'Eng',
              dropdownMenuEntries: [DropdownMenuEntry(value: 'Eng', label: 'Eng'),DropdownMenuEntry(value: 'Arabic', label: 'Arabic')],
              ),
          ),
      // child: Row(
        // children: [Text('Eng'), Icon(Icons.arrow_drop_down)],
      // ),
    );
  }
}