import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../../widgets/dream_meaning_widgets/custom_textfield.dart';
import '../../widgets/dream_meaning_widgets/history_button.dart';

class DreamBookPage extends StatefulWidget {
  const DreamBookPage({super.key});

  @override
  State<DreamBookPage> createState() => _DreamBookPageState();
}

class _DreamBookPageState extends State<DreamBookPage> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _dreamTitleController = TextEditingController();
  final TextEditingController _writeDreamController = TextEditingController();
  final formatter = DateFormat.yMd();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dream Book',
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold24(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleBold24(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppImages.leftArrow),
        ),
      ),
      body: width < AppConstants.maxMobileWidth
          ? getMobileDreamBook(context)
          : width < AppConstants.maxTabletWidth
              ? getTabletDreamBook(context, width)
              : getDesktopDreamBook(context, width),
    );
  }

  Padding getMobileDreamBook(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            '“Track , Analyze, and Explore your Dreams Anytime by Adding them to your Dream Book”',
            textAlign: TextAlign.justify,
            style: AppStyles.styleRegular20(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                title: 'DreamHistory',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                            content: Text('Click here to see your history '),
                            alignment: Alignment.topRight,
                          ));
                },
              ),
            ],
          ),
          CustomTextField(
            label: 'Date',
            hintText: 'select date',
            maxLines: 2,
            controller: _dateController,
            onTap: () async {
              FocusScope.of(context).requestFocus(new FocusNode());
              DateTime? date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  initialDate: DateTime.now());
              date == null
                  ? _dateController.text = 'no date selected'
                  : _dateController.text = formatter.format(date);
              setState(() {});
            },
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextField(
              hintText: 'dream title',
              maxLines: 4,
              label: 'Dream Title:',
              controller: _dreamTitleController),
          const SizedBox(
            height: 5,
          ),
          CustomTextField(
              hintText: 'write your dream',
              maxLines: 6,
              label: 'Write Your Dream :',
              controller: _writeDreamController),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(onPressed: () {}, title: 'SaveDream'),
            ],
          ),
        ],
      ),
    );
  }

  Padding getTabletDreamBook(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Text(
            '“Track , Analyze, and Explore your Dreams Anytime by Adding them to your Dream Book”',
            textAlign: TextAlign.justify,
            style: AppStyles.styleRegular20(context).copyWith(
                fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                title: 'DreamHistory',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                            content: Text('Click here to see your history '),
                            alignment: Alignment.topRight,
                          ));
                },
              ),
            ],
          ),
          CustomTextField(
            label: 'Date',
            hintText: 'select date',
            suffix: Icons.calendar_month,
            maxLines: 3,
            controller: _dateController,
            onTap: () async {
              FocusScope.of(context).requestFocus(new FocusNode());
              DateTime? date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  initialDate: DateTime.now());
              date == null
                  ? _dateController.text = 'no date selected'
                  : _dateController.text = formatter.format(date);
              setState(() {});
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
              hintText: 'dream title',
              maxLines: 5,
              label: 'Dream Title:',
              controller: _dreamTitleController),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
              hintText: 'write your dream',
              maxLines: 7,
              label: 'Write Your Dream :',
              controller: _writeDreamController),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(onPressed: () {}, title: 'SaveDream'),
            ],
          ),
        ],
      ),
    );
  }

  Padding getDesktopDreamBook(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              '“Track , Analyze, and Explore your Dreams Anytime by Adding them to your Dream Book”',
              textAlign: TextAlign.justify,
              style: AppStyles.styleRegular20(context).copyWith(
                  fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  title: 'DreamHistory',
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                              content: Text('Click here to see your history '),
                              alignment: Alignment.topRight,
                            ));
                  },
                ),
              ],
            ),
        
            Row(
              children: [
                   Expanded(
                     child: CustomTextField(
                                 label: 'Date',
                                 hintText: 'select date',
                                 suffix: Icons.calendar_month,
                                 maxLines: 2,
                                 controller: _dateController,
                                 onTap: () async {
                                   FocusScope.of(context).requestFocus(new FocusNode());
                                   DateTime? date = await showDatePicker(
                                    
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      initialDate: DateTime.now());
                                   date == null
                      ? _dateController.text = 'no date selected'
                      : _dateController.text = formatter.format(date);
                                   setState(() {});
                                 },
                               ),
                   ),
              const SizedBox(
              width: 15,
            ),
            Expanded(
              child: CustomTextField(
                  hintText: 'dream title',
                  maxLines: 2,
                  label: 'Dream Title:',
                  controller: _dreamTitleController),
            ),
              ],
            ),
        
            
           
            
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
                hintText: 'write your dream',
                maxLines: 6,
                label: 'Write Your Dream :',
                controller: _writeDreamController),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(onPressed: () {}, title: 'SaveDream'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
