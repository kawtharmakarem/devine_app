import 'package:country_code_picker/country_code_picker.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:divinecontrol/widgets/homepage_widgets/animation_homepage_widget.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_homepage_button.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_register_textfield.dart';
import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../widgets/homepage_widgets/custom_home_cscpicker.dart';
import '../../widgets/homepage_widgets/custom_home_datepicker.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController langController = TextEditingController();
  int _selectedValue = 1;
  final List<DropdownMenuItem> langs = [
    const DropdownMenuItem(
      value: 'Language',
      child: Text('Language'),
    ),
    const DropdownMenuItem(
      value: 'English',
      child: Text('English'),
    ),
    const DropdownMenuItem(
      value: 'Arabic',
      child: Text('Arabic'),
    )
  ];

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:width<AppConstants.maxTabletWidth? AppBar(
        title: Text(
          'Edit You Account',
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold24(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleBold24(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ):null,
      body:width<AppConstants.maxTabletWidth? getMobileEditAccount(width, height,context):getDeskTopAnimationEditAccount(width, height,context),
    );
  }

  Padding getMobileEditAccount(double width,double height, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: width * 0.35,
                child: Image.asset(
                  AppImages.companyLogo,
                  fit: BoxFit.fill,
                )),
            SizedBox(
              height: height*0.01,
            ),
            CustomRegisterTextField(
                controller: nameController, label: "Name :"),
            SizedBox(
              height: height*0.01,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      'Contact :',
                      style: AppStyles.stylePoppinsRegular20(context)
                          .copyWith(
                              fontSize: getResponsiveFontSizeText(context,
                                  fontSize: 18)),
                    )),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 30,
                    height: 40,
                    child: CountryCodePicker(
                      textStyle: AppStyles.stylePoppinsRegular20(context)
                          .copyWith(
                              fontSize: getResponsiveFontSizeText(context,
                                  fontSize: 18)),
                      initialSelection: '+91',
                      showDropDownButton: true,
                      enabled: true,
                      showCountryOnly: false,
                      hideMainText: false,
                      showFlag: false,
                      padding: EdgeInsets.zero,
                      dialogTextStyle:
                          AppStyles.stylePoppinsRegular20(context).copyWith(
                              fontSize: getResponsiveFontSizeText(context,
                                  fontSize: 18)),
                      searchStyle: AppStyles.stylePoppinsRegular20(context),
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: TextFormField(
                      style: AppStyles.stylePoppinsRegular20(context),
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                    ))
              ],
            ),
            SizedBox(
              height: height*0.01,
            ),
            CustomRegisterTextField(
                controller: otpController, label: 'OTP :'),
            SizedBox(
              height: height*0.02,
            ),
            const CustomRegisterDatePicker(label: "Date Of Birth :"),
             SizedBox(
              height: height*0.01,
            ),
            CustomCscPicker(
              
                currentCountry: countryValue,
                currentState: stateValue,
                currentCity: cityValue,
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    stateValue = value!;
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    cityValue = value!;
                  });
                }),
            SizedBox(
              height: height*0.01,
            ),
            getGender(context,width),
            //  SizedBox(
            //   height: height*0.02,
            // ),
            Row(
              children: [
                Expanded(
                    child: CustomHomePageButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: 'Save',
                )),
                 SizedBox(
                  width: height*0.01,
                ),
                Expanded(
                    child: CustomHomePageButton(onTap: () {}, title: 'Edit'))
              ],
            )
          ],
        ),
      ),
    );
  }

  // Widget getDeskTopEditAccount(double width,double height, BuildContext context) {
  //   return Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //         Stack(
  //   children: [
  //     Positioned(
  //         bottom: 0,
  //         left: 0,
  //         right: 0,
  //         child: Image.asset(AppImages.background,fit: BoxFit.fill,),
  //       ),
  //     Padding(
  //       padding:  EdgeInsets.only(left:width*0.03,top: height*0.03),
  //       child: Column(
  //         children: [
  //           SizedBox(
  //               width: width * 0.3,
  //               child: Image.asset(
  //                 AppImages.companyLogo,
  //                 fit: BoxFit.fill,
  //               )),
            
  //           Text(
  //             'Edit Your Account',
  //             style: AppStyles.styleRufinaBold32(context).copyWith(
  //                 fontSize:
  //                     getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 40:60)),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ],
  //       ),
  //        const Expanded(child: SizedBox()),
  //       SizedBox(
  //         width: width*0.45,
  //         child: SingleChildScrollView(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           CustomRegisterTextField(
  //               controller: nameController, label: "Name :"),
  //               SizedBox(height: height*0.02,),
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.end,
  //             children: [
  //               Expanded(
  //                   flex: 2,
  //                   child: Text(
  //                     'Contact :',
  //                     style: AppStyles.stylePoppinsRegular20(context)
  //                         .copyWith(
  //                             fontSize: getResponsiveFontSizeText(context,
  //                                 fontSize: 30)),
  //                   )),
  //               Expanded(
  //                 flex: 2,
  //                 child: SizedBox(
  //                   width: 30,
  //                   height: 40,
  //                   child: CountryCodePicker(
  //                     textStyle: AppStyles.stylePoppinsRegular20(context)
  //                         .copyWith(
  //                             fontSize: getResponsiveFontSizeText(context,
  //                                 fontSize: 30)),
  //                     initialSelection: '+91',
  //                     showDropDownButton: true,
  //                     enabled: true,
  //                     showCountryOnly: false,
  //                     hideMainText: false,
  //                     showFlag: false,
  //                     padding: EdgeInsets.zero,
  //                     dialogTextStyle:
  //                         AppStyles.stylePoppinsRegular20(context).copyWith(
  //                             fontSize: getResponsiveFontSizeText(context,
  //                                 fontSize: 30)),
  //                     searchStyle: AppStyles.stylePoppinsRegular20(context),
  //                   ),
  //                 ),
  //               ),
  //               Expanded(
  //                   flex: 2,
  //                   child: TextFormField(
  //                     style: AppStyles.stylePoppinsRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 30)),
  //                     controller: phoneController,
  //                     keyboardType: TextInputType.phone,
  //                   ))
  //             ],
  //           ),
  //                             SizedBox(height: height*0.02,),
    
  //           CustomRegisterTextField(
  //               controller: otpController, label: 'OTP :'),
  //                             SizedBox(height: height*0.03,),
    
  //           const CustomRegisterDatePicker(label: "Date Of Birth :"),
  //                             SizedBox(height: height*0.02,),
    
  //           CustomCscPicker(
            
  //               currentCountry: countryValue,
  //               currentState: stateValue,
  //               currentCity: cityValue,
  //               onCountryChanged: (value) {
  //                 setState(() {
  //                   countryValue = value;
  //                 });
  //               },
  //               onStateChanged: (value) {
  //                 setState(() {
  //                   stateValue = value!;
  //                 });
  //               },
  //               onCityChanged: (value) {
  //                 setState(() {
  //                   cityValue = value!;
  //                 });
  //               }),
  //            SizedBox(
  //             height: height*0.02,
  //           ),
  //           getGender(context,width),
  //           SizedBox(
  //             height: height*0.02,
  //           ),
  //           Row(
  //             children: [
  //               Expanded(
  //                   child: CustomHomePageButton(
  //                 onTap: () {},
  //                 title: 'Save',
  //               )),
  //               const SizedBox(
  //                 width: 20,
  //               ),
  //               Expanded(
  //                   child: CustomHomePageButton(onTap: () {}, title: 'Edit'))
  //             ],
  //           ),
  //         ],
  //                   )
  //               ),
  //       ),
  //       const Expanded(child: SizedBox())
  //       ],
  //   );
  // }


  Widget getDeskTopAnimationEditAccount(double width,double height, BuildContext context) {
    return Stack(
        children: [
           Positioned(
        top: height*0.1,
        left: 20,
        child: Text(
              'Edit Your Account',
              style: AppStyles.styleRufinaBold32(context).copyWith(
                  fontSize:
                      getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 40:60)),
            ),),
          Positioned(
            right: 10,
            top: 10,
            child: SizedBox(
                width: width*0.45,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomRegisterTextField(
                      controller: nameController, label: "Name :"),
                      SizedBox(height: height*0.02,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
              flex: 2,
              child: Text(
                'Contact :',
                style: AppStyles.stylePoppinsRegular20(context)
                    .copyWith(
                        fontSize: getResponsiveFontSizeText(context,
                            fontSize: 30)),
              )),
                      Expanded(
            flex: 2,
            child: SizedBox(
              width: 30,
              height: 40,
              child: CountryCodePicker(
                textStyle: AppStyles.stylePoppinsRegular20(context)
                    .copyWith(
                        fontSize: getResponsiveFontSizeText(context,
                            fontSize: 30)),
                initialSelection: '+91',
                showDropDownButton: true,
                enabled: true,
                showCountryOnly: false,
                hideMainText: false,
                showFlag: false,
                padding: EdgeInsets.zero,
                dialogTextStyle:
                    AppStyles.stylePoppinsRegular20(context).copyWith(
                        fontSize: getResponsiveFontSizeText(context,
                            fontSize: 30)),
                searchStyle: AppStyles.stylePoppinsRegular20(context),
              ),
            ),
                      ),
                      Expanded(
              flex: 2,
              child: TextFormField(
                style: AppStyles.stylePoppinsRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 30)),
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ))
                    ],
                  ),
                        SizedBox(height: height*0.02,),
                    
                  CustomRegisterTextField(
                      controller: otpController, label: 'OTP :'),
                        SizedBox(height: height*0.03,),
                    
                  const CustomRegisterDatePicker(label: "Date Of Birth :"),
                        SizedBox(height: height*0.02,),
                    
                  CustomCscPicker(
                  
                      currentCountry: countryValue,
                      currentState: stateValue,
                      currentCity: cityValue,
                      onCountryChanged: (value) {
            setState(() {
              countryValue = value;
            });
                      },
                      onStateChanged: (value) {
            setState(() {
              stateValue = value!;
            });
                      },
                      onCityChanged: (value) {
            setState(() {
              cityValue = value!;
            });
                      }),
                   SizedBox(
                    height: height*0.02,
                  ),
                  getGender(context,width),
                  SizedBox(
                    height: height*0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
              child: CustomHomePageButton(
            onTap: () {
              Navigator.pop(context);
            },
            title: 'Save',
                      )),
                      const SizedBox(
            width: 20,
                      ),
                      Expanded(
              child: CustomHomePageButton(onTap: () {}, title: 'Edit'))
                    ],
                  ),
                ],
              )
                      ),
            ),
          ),
        const  MyAnimationWidget()
         ] );
  }



  Row getGender(BuildContext context,double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
            flex: 2,
            child: Text(
              'Gender:',
              style: AppStyles.stylePoppinsRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxTabletWidth?20:30)),
            )),
        Expanded(
          flex: 2,
          child: Transform.scale(
            scale:width<AppConstants.maxTabletWidth?1: 1.5,
            child: Theme(
              data: Theme.of(context).copyWith(
                  listTileTheme: const ListTileThemeData(horizontalTitleGap: 2)),
              child: RadioListTile(
                  dense: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Male',
                    style: AppStyles.stylePoppinsRegular20(context),
                  ),
                  value: 1,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  }),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Transform.scale(
            scale: width<AppConstants.maxTabletWidth?1:1.5,
            child: Theme(
              data: Theme.of(context).copyWith(
                  listTileTheme: const ListTileThemeData(horizontalTitleGap: 2)),
              child: RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Female',
                    style: AppStyles.stylePoppinsRegular20(context),
                  ),
                  value: 2,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  }),
            ),
          ),
        )
      ],
    );
  }
}
