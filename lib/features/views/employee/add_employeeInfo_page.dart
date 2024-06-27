import 'package:bidyapithedu/features/controller/employee_controller.dart';
import 'package:bidyapithedu/shared_components/custom_widget/custom_appbar.dart';
import 'package:bidyapithedu/shared_components/custom_widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../constants/color_path.dart';
import '../../../constants/local_string.dart';
import '../../../constants/other_constant.dart';
import '../../../shared_components/custom_style.dart';
import '../../../shared_components/custom_widget/custom_button.dart';
import '../../../shared_components/custom_widget/custom_widgets.dart';

class AddEmployeeInfoPage extends StatefulWidget {
   AddEmployeeInfoPage({super.key});

  @override
  State<AddEmployeeInfoPage> createState() => _AddEmployeeInfoPageState();
}

class _AddEmployeeInfoPageState extends State<AddEmployeeInfoPage> {
  final _formKey = GlobalKey<FormState>();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar.appbar(title:'Add Employee Info'),
      body: ListView(
        children:<Widget>[

          GetX<EmployeeController>(
              init: EmployeeController(),
              initState: (_) {},
              builder: (_) {
                print(_.isDataLoaded.value);
                return Stepper(
                  physics: const NeverScrollableScrollPhysics(),
                  currentStep: _index,
                  onStepCancel: () {
                     if (_index > 0) {
                      setState(() {
                        _index -= 1;
                      });
                    }
                  },

                  onStepContinue: () {

                    if (_index == 0) {
                      setState(() {
                        _index++;
                      });
                    } else if (_index == 1) {

                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _index++;
                        });
                        // _.waterLineApplicationSave();
                      }
                      // _.waterLineApplication();
                      // _.getDocumentList(clientApplicationId: '');
                    } else if (_index == 2) {
                      if (_formKey.currentState!.validate()){
                        // Get.off(() => WaterLineApplicationDetailsPage(
                        //     applicationId: _
                        //         .getApplicationAddedResponse.value.data?.id
                        //         .toString()));
                      }else{
                        Fluttertoast.showToast(msg: 'Please, Fill-up application information.');
                      }

                      // Get.back();
                    }
                  },

                  onStepTapped: (int index) {
                    print('onStepTapped');

                    setState(() {
                      _index = index;
                    });
                  },
                  steps: [
                    Step(
                        isActive: _index >= 0 ? true : false,
                        title: Text("Application Type"),
                        content: Row(
                          children: [
                            Text(
                              'LocalString',
                              style: CustomStyle.kCustomTextStyle(
                                  color: ColorPath.kGreenDark,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )),
                    Step(
                        isActive: _index >= 1 ? true : false,
                        title: Text('LocalString'),
                        content: Form(
                          key: _formKey,
                          child: Padding(
                            padding:
                            EdgeInsets.all(OtherConstant.kRegularPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField.kCustomTextField(
                                  hint:''
                                )

                              ],
                            ),
                          ),
                        )),
                    // Step(
                    //   isActive: _index == 2 ? true : false,
                    //   title: Text(LocalString.Document_upload.tr),
                    //   content: _.getApplicationDocumentList.value.data == null
                    //       ? SizedBox()
                    //       : ListView.builder(
                    //       shrinkWrap: true,
                    //       physics: NeverScrollableScrollPhysics(),
                    //       itemCount: _.getApplicationDocumentList.value.data
                    //           ?.length ??
                    //           0,
                    //       itemBuilder: (context, index) {
                    //         return Container(
                    //           padding: EdgeInsets.all(
                    //               OtherConstant.kRegularPadding),
                    //           margin: EdgeInsets.symmetric(
                    //               horizontal: OtherConstant.kRegularPadding,
                    //               vertical: OtherConstant.kSmallPadding),
                    //           decoration: CustomStyle.kCustomBoxDecoration(
                    //               color: ColorPath.kGreyWhite,
                    //               borderRadius: BorderRadius.circular(
                    //                   OtherConstant.kRegularRadius)),
                    //           child: Column(
                    //             crossAxisAlignment:
                    //             CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 _.getApplicationDocumentList.value
                    //                     .data?[index].docName ??
                    //                     '',
                    //                 style: CustomStyle.kCustomTextStyle(
                    //                     color: ColorPath.kGreyDark,
                    //                     fontSize:
                    //                     OtherConstant.kSmallTextSize),
                    //               ),
                    //               Padding(
                    //                 padding: EdgeInsets.only(
                    //                     bottom:
                    //                     OtherConstant.kRegularPadding),
                    //                 child: CustomWidgets.kCustomTextField(
                    //                   readOnly: true,
                    //                   decoration: CustomStyle
                    //                       .kCustomTextFieldDecoration(
                    //                       border:
                    //                       const OutlineInputBorder(
                    //                           borderSide:
                    //                           BorderSide.none),
                    //                       hintText: _
                    //                           .getApplicationDocumentList
                    //                           .value
                    //                           .data?[index]
                    //                           .fileName ??
                    //                           LocalString
                    //                               .Attached_file.tr,
                    //                       suffixIcon: IconButton(
                    //                           onPressed: () async {
                    //                             try {
                    //                               await FilePicker
                    //                                   .platform
                    //                                   .pickFiles(
                    //                                   type: FileType
                    //                                       .custom,
                    //                                   allowedExtensions: [
                    //                                     'jpg',
                    //                                     'jpeg',
                    //                                     'pdf',
                    //                                     'doc',
                    //                                     'docx',
                    //                                     'png'
                    //                                   ]).then((result) {
                    //                                 File file = File(
                    //                                     result!
                    //                                         .files
                    //                                         .single
                    //                                         .path!);
                    //                                 _
                    //                                     .getApplicationDocumentList
                    //                                     .value
                    //                                     .data?[index]
                    //                                     .fileName =
                    //                                     basename(
                    //                                         file.path);
                    //                                 _
                    //                                     .getApplicationDocumentList
                    //                                     .value
                    //                                     .data?[index]
                    //                                     .file = file;
                    //
                    //                                 setState(() {});
                    //                                 // _.arrangeFile(_.getApplicationAddedResponse.value.data!.id.toString(), _.getApplicationDocumentList
                    //                                 //     .value.data?[index].id.toString(),file.path );
                    //                               });
                    //                             } catch (e) {
                    //                               Fluttertoast.showToast(
                    //                                   msg: LocalString
                    //                                       .File_not_picked
                    //                                       .tr);
                    //                             }
                    //                           },
                    //                           icon: Icon(
                    //                             Icons.attach_file,
                    //                           ))),
                    //                   // style: CustomStyle.kCustomTextStyle(),
                    //                 ),
                    //               ),
                    //               Center(
                    //                 child: _.getApplicationDocumentList.value.data![index].file ==
                    //                     null
                    //                     ? _.getApplicationDocumentList.value.data![index].fileName ==
                    //                     null
                    //                     ? const SizedBox()
                    //                     : _
                    //                     .getApplicationDocumentList
                    //                     .value
                    //                     .data![index]
                    //                     .fileName!
                    //                     .contains('pdf')
                    //                     ? Image.asset(
                    //                   AssetPath.pdfIcon,
                    //                   height: OtherConstant
                    //                       .kDefaultImageHeight,
                    //                 )
                    //                     : _
                    //                     .getApplicationDocumentList
                    //                     .value
                    //                     .data![index]
                    //                     .fileName!
                    //                     .contains('doc')
                    //                     ? Image.asset(
                    //                   AssetPath.wordIcon,
                    //                   height: OtherConstant
                    //                       .kDefaultImageHeight,
                    //                 )
                    //                     : Image.network(ApiPath.baseUrlDocumentImage +
                    //                     _
                    //                         .getApplicationDocumentList
                    //                         .value
                    //                         .data![index]
                    //                         .fileName!)
                    //                     : _.getApplicationDocumentList.value.data![index].fileName
                    //                     .toString()
                    //                     .contains("pdf")
                    //                     ? Image.asset(
                    //                   AssetPath.pdfIcon,
                    //                   height: OtherConstant
                    //                       .kDefaultImageHeight,
                    //                 )
                    //                     : _.getApplicationDocumentList.value.data![index].fileName
                    //                     .toString()
                    //                     .contains("doc")
                    //                     ? Image.asset(
                    //                   AssetPath.wordIcon,
                    //                   height: OtherConstant
                    //                       .kDefaultImageHeight,
                    //                 )
                    //                     : _.getApplicationDocumentList.value.data![index].fileName.toString().contains("jpg") ||
                    //                     _
                    //                         .getApplicationDocumentList
                    //                         .value
                    //                         .data![index]
                    //                         .fileName
                    //                         .toString()
                    //                         .contains("png") ||
                    //                     _.getApplicationDocumentList.value.data![index].fileName.toString().contains("jpeg")
                    //                     ? Image.file(_.getApplicationDocumentList.value.data![index].file!)
                    //                     : Image.asset(
                    //                   AssetPath.kNoImage,
                    //                   height: OtherConstant
                    //                       .kDefaultImageHeight,
                    //                 ),
                    //               ),
                    //               _.getApplicationDocumentList.value
                    //                   .data![index].file ==
                    //                   null
                    //                   ? const SizedBox()
                    //                   : SizedBox(
                    //                   width: OtherConstant.kCustomWidth(
                    //                       context),
                    //                   child: Padding(
                    //                     padding: EdgeInsets.all(
                    //                         OtherConstant
                    //                             .kRegularPadding),
                    //                     child: CustomButton
                    //                         .customElevatedButton(
                    //                         title: LocalString
                    //                             .Upload.tr,
                    //                         onPressed: () {
                    //                           _.uploadDocument(
                    //                               file: _
                    //                                   .getApplicationDocumentList
                    //                                   .value
                    //                                   .data![index]
                    //                                   .file!
                    //                                   .path,
                    //                               id: _
                    //                                   .getApplicationDocumentList
                    //                                   .value
                    //                                   .data?[index]
                    //                                   .appDocId,
                    //                               clientApplicationId: _
                    //                                   .getApplicationAddedResponse
                    //                                   .value
                    //                                   .data
                    //                                   ?.id
                    //                                   .toString(),
                    //                               clientApplicationDocumentTypeId: _
                    //                                   .getApplicationDocumentList
                    //                                   .value
                    //                                   .data![index]
                    //                                   .id);
                    //                         }),
                    //                   ))
                    //             ],
                    //           ),
                    //         );
                    //       }),
                    // ),
                  ],
                  controlsBuilder: (context, details) {
                    return Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                      side: BorderSide.none,
                                      borderRadius: BorderRadius.circular(
                                          OtherConstant.kRegularPadding))),
                              elevation: const MaterialStatePropertyAll(0.0),
                              shadowColor: const MaterialStatePropertyAll(ColorPath.kPrimaryColor),
                              padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
                              backgroundColor: const MaterialStatePropertyAll(ColorPath.kPrimaryColor)),
                              onPressed: details.onStepContinue,
                              child: Text(
                              _index == 2 ? LocalString.Done_btn.tr : _index == 0 ? 'Next' : 'Save',
                              style: CustomStyle.kCustomTextStyle(
                                  color: Colors.white,
                                  fontSize: OtherConstant.kMediumTextSize),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: OtherConstant.kRegularPadding,
                        ),
                      Expanded(
                          child:  _index ==0?SizedBox(): CustomButton.customElevatedButton(

                              title: LocalString.back.tr,
                              onPressed: details.onStepCancel,
                              backgroundColor: ColorPath.kGreyLight,
                              elevation: 0.0,
                              textColor: ColorPath.kGreyDark),
                        )
                      ],
                    );
                  },
                );
              })

        ],
      )


    );
  }
}
