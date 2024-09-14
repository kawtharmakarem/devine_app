import 'package:divinecontrol/admin_panel/admin_panel_widgets/auth_button.dart';
import 'package:divinecontrol/admin_panel/admin_panel_widgets/get_reading_widget.dart';
import 'package:divinecontrol/admin_panel/admin_panel_widgets/question_section.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../admin_panel_widgets/get_astrology_section.dart';
import '../admin_panel_widgets/get_spiritual_section.dart';
import '../admin_panel_widgets/more_section.dart';
import '../admin_panel_widgets/welcome_section.dart';

class AdminPanelMainScreen extends StatefulWidget {
  const AdminPanelMainScreen({super.key});

  @override
  State<AdminPanelMainScreen> createState() => _AdminPanelMainScreenState();
}

class _AdminPanelMainScreenState extends State<AdminPanelMainScreen> {
  @override
  Widget build(BuildContext context) {
   // double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: "Divine", leading: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              WelcomeSection(),
              GetReadingSection(),
              const SizedBox(height: 20,),
              GetSpiritualSection(),
              const SizedBox(height: 20,),
              GetAstrologySection(),
              const SizedBox(height: 20,),
              QestionSection(),
              const SizedBox(height: 20,),
              MoreSection(),
              const SizedBox(height: 20,),
              Image.asset(AppImages.companyLogo,height: 200,width: 200,fit: BoxFit.cover,),
              const SizedBox(height: 40,),
              AuthButton()

          
            ],
          ),
        ),
      ),
    );
  }
}