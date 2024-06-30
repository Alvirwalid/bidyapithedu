
import 'package:bidyapithedu/features/controller/employee_controller.dart';
import 'package:bidyapithedu/shared_components/custom_widget/custom_textfield.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/color_path.dart';
import '../../../constants/local_string.dart';
import '../../../constants/other_constant.dart';
import '../../../shared_components/custom_style.dart';
import '../../../shared_components/custom_widget/custom_widgets.dart';
import '../../../utils/helper/time_convert_class.dart';
import '../../../utils/mixin/date_time_picker.dart';

class AddEmployeeInfoPage extends StatefulWidget {
   AddEmployeeInfoPage({super.key});

  @override
  State<AddEmployeeInfoPage> createState() => _AddEmployeeInfoPageState();
}

class _AddEmployeeInfoPageState extends State<AddEmployeeInfoPage> {
  final _formKeyForBasicInfo = GlobalKey<FormState>();
  final _formKeyForEmpInfo = GlobalKey<FormState>();
  int _index = 0;
  var isSaveBasicInfo = false.obs;
  var selecOfficeTypeValue=null;
  var selecBatchValue=null;
  var selecOfficeValue=null;
  var selecDesignationValue=null;
  var selecDepartmentValue=null;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorPath.kWhite,
      appBar: AppBar(
        backgroundColor: ColorPath.kPrimaryColor,
        title: Text('Add Employee Info',style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w600,color: ColorPath.kGreyWhite,fontSize:OtherConstant.kMediumTextSize.sp),
        ),
      ),
      body: GetX<EmployeeController>(
          init: EmployeeController(),
          builder: (_) {

            return ListView(
              children: [
                Stepper(
                  physics: const NeverScrollableScrollPhysics(),
                  currentStep: _index,

                  // onStepCancel: () {
                  //
                  //
                  //    if (_index > 0) {
                  //     setState(() {
                  //       _index -= 1;
                  //     });
                  //   }
                  // },

                  onStepContinue: ()async{

                    if (_index == 0) {
                      if (_formKeyForBasicInfo.currentState!.validate()) {
                      await  _.saveBasicInfo().then((val){
                        if(val==true){
                          setState(() {
                            _index++;
                          });
                        }
                      });
                      }
                    }
                    else if (_index == 1) {



                      if (_formKeyForEmpInfo.currentState!.validate()) {


                        await  _.saveEmployeeInfo().then((val){

                          if(val==true){



                          //   if(_.employeeInfoForSave.value.data !=null){
                          //
                          //
                          //     if(_.employeeInfoForSave.value.data!.confirmIs==true){
                          //       Get.offAll(()=>HomePage());
                          //     }else{
                          //       Get.to(()=>InfoReviewDialogPage());
                          //     }
                          //
                          // }

                          }


                        });
                      }
                    }
                  },

                  // onStepTapped: (int index) {
                  //
                  //   // setState(() {
                  //   //   _index = index;
                  //   // });
                  // },
                  steps: [
                    Step(
                        isActive: _index >= 0 ? true : false,
                        title: Text("Basic Info",style: CustomStyle.kCustomTextStyle(),),
                        content: Form(
                          key: _formKeyForBasicInfo,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                             CustomWidgets.requiredLabelText(label:'Employee ID',isRequire: true),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                controller: _.employeeIDController,
                                validator: (val) => val!.isEmpty?'Enter Employee ID':null,
                                fillColor: ColorPath.kWhite
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Employee Name',isRequire: true),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                  controller: _.employeeNameController,
                                  validator: (val) => val!.isEmpty?'Enter Employee Name':null,
                                  fillColor: ColorPath.kWhite
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Bangla Name'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                  controller: _.employeeBanglaNameController,
                                  fillColor: ColorPath.kWhite
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Father  Name'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                  controller: _.fatherNameController,
                                  fillColor: ColorPath.kWhite
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Father  Name Bangla'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                  controller: _.fatherNameBanglaController,
                                  fillColor: ColorPath.kWhite
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Mother   Name'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                  controller: _.motherNameController,
                                  fillColor: ColorPath.kWhite
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Mother   Name Bangla'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                  controller: _.motherNamebanglaController,
                                  fillColor: ColorPath.kWhite
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Mobile',isRequire: true),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                  controller: _.mobileController,
                                  validator: (val) => val.toString().length<11?'Enter Valid Mobile No.':null,
                                  fillColor: ColorPath.kWhite
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Phone'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                  controller: _.phoneController,
                                  fillColor: ColorPath.kWhite
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Email'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                  controller: _.emailController,
                                  fillColor: ColorPath.kWhite
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'FAX'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                  controller: _.faxController,
                                  fillColor: ColorPath.kWhite
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Date Of Birth ',isRequire: true),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(

                                  controller: _.dobController,
                                  hint: 'mm/dd/yyyy',
                                  validator: (val) => val!.isEmpty ? LocalString.Enter_valid_info.tr : null,
                                  readOnly: true,
                                  fillColor: ColorPath.kWhite,
                                  onPresses: () {
                                    DateTimePicker.selectDate(context).then(
                                            (time) {
                                              _.dobController.text = TimeConvert.toYYYYmmdd(time.toString());}
                                    );
                                    // setState(() {});
                                  },
                                suffixIcon: Padding(padding: EdgeInsets.only(right:OtherConstant.kRegularPadding),
                                  child: Icon(FeatherIcons.calendar,size: OtherConstant.kSmallIconSize,),),),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'NID'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                  controller: _.nidController,
                                  fillColor: ColorPath.kWhite
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Gender'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomDropdown(
                                onChanged: (val) {
                                 _.genderController.text=val.toString();
                                },
                                item:_.genderDropDownList.value.data?.map((e) {
                                  return DropdownMenuItem(
                                    onTap: () {
                                      _.genderNameController.text=e.name.toString();
                                    },
                                      value: e.id,
                                      child: Text(e.name!,
                                          style:
                                          CustomStyle.kCustomTextStyle(
                                              fontWeight:
                                              FontWeight.w500)));
                                }).toList(),

                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Blood Group'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomDropdown(
                                onChanged: (val) {
                                  _.bloodGroupController.text=val.toString();
                                },
                                item:_.bloodGroupDropDownList.value.data?.map((e) {
                                  return DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.name!,
                                          style:
                                          CustomStyle.kCustomTextStyle(
                                              fontWeight:
                                              FontWeight.w500)));
                                }).toList(),
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Marital Status'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomDropdown(
                                onChanged: (val) {
                                  _.maritalStatusController.text=val.toString();
                                },
                                item:_.maritalStatusDropDownList.value.data?.map((e) {
                                  return DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.name!,
                                          style:
                                          CustomStyle.kCustomTextStyle(
                                              fontWeight:
                                              FontWeight.w500)));
                                }).toList(),
                              ),


                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Religion'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomDropdown(
                                onChanged: (val) {
                                  _.religionController.text=val.toString();
                                },
                                item:_.religionDropDownList.value.data?.map((e) {
                                  return DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.name!,
                                          style:
                                          CustomStyle.kCustomTextStyle(
                                              fontWeight:
                                              FontWeight.w500)));
                                }).toList(),
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              Row(
                                children: [
                                  Transform.translate(
                                    offset: Offset(-OtherConstant.kSmallTextSize, 0),
                                    child: Transform.scale(
                                      scale: 1.3,
                                      child:   Checkbox(
                                        value: _.isCheckFreedomFighter.value,
                                        visualDensity:VisualDensity.compact ,
                                        shape:RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4)
                                        ) ,
                                        onChanged: (value) {
                                          _.isCheckFreedomFighter.value=value!;
                                        },

                                      ),
                                    ),
                                  ),



                                  Text('Freedom Fighter',style: CustomStyle.kCustomTextStyle(fontWeight:FontWeight.w600),)



                                ],
                              ),
                              SizedBox(height: OtherConstant.kLargePadding,)
                            ],
                          ),
                        )),
                    Step(
                        isActive: _index >= 1 ? true : false,
                        title: Text('Employeement'),
                        content: Form(
                          key: _formKeyForEmpInfo,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              ////////////////  EMPLOYEE TYPE /////////
                              CustomWidgets.requiredLabelText(label:'Employee Type',isRequire: true),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomDropdown(
                                  selectValue: selecOfficeTypeValue,
                                  validator: (val) => val == null ? LocalString.Select_valid_info.tr : null,
                                  hint: Text(LocalString.select_an_option.tr, style: CustomStyle.kCustomTextStyle(fontSize: OtherConstant.kMediumTextSize)),
                                  onChanged: (val) {
                                    setState(() {
                                      print(val.runtimeType);
                                      selecOfficeTypeValue = val;
                                      _.employeeTypeIdController.text = selecOfficeTypeValue.toString();
                                      selecBatchValue = null;
                                      _.getBatch(empTypeId:  _.employeeTypeIdController.text);
                                    });
                                  },
                                  item: _.employeeDropDownList.value.data
                                      ?.map((e) {
                                    return DropdownMenuItem(
                                        value: e.id,
                                        child: Text(e.name!, style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w500)));
                                  }).toList(),

                              ),

                              ////////////////  Batch TYPE /////////
                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Batch',isRequire: true),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomDropdown(
                                  selectValue: selecBatchValue,
                                  validator: (val) => val == null ? LocalString.Select_valid_info.tr : null,
                                  hint: Text(LocalString.select_an_option.tr,
                                      style: CustomStyle.kCustomTextStyle(fontSize: OtherConstant.kMediumTextSize)),
                                  onChanged: (val) {
                                    setState(() {
                                      selecBatchValue = val;
                                      _.batchIdController.text = selecBatchValue.toString();
                                    });
                                  },
                                  item: _.batchDropDownList.value.data?.map((e) {
                                    return DropdownMenuItem(
                                        value: e.id,
                                        child: Text(e.name!,
                                            style:
                                            CustomStyle.kCustomTextStyle(
                                                fontWeight:
                                                FontWeight.w500)));
                                  }).toList(),

                              ),



                              ////////////////////// OFFICE /////////

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Office',isRequire: true),
                              SizedBox(height: OtherConstant.kRegularPadding,),


                              CustomTextField.kCustomDropdown(
                                selectValue: selecOfficeValue,
                                validator: (val) => val == null ? LocalString.Select_valid_info.tr : null,
                                hint: Text(LocalString.select_an_option.tr, style: CustomStyle.kCustomTextStyle(fontSize: OtherConstant.kMediumTextSize)),
                                onChanged: (val) {
                                  setState(() {
                                    selecOfficeValue = val;
                                    _.officeIDController.text = selecOfficeValue.toString();
                                    selecDesignationValue = null;
                                    _.getDesignation(empId:  _.officeIDController.text);
                                  });
                                },
                                item: _.officeDropDownList.value.data
                                    ?.map((e) {
                                  return DropdownMenuItem(
                                      value: e.id,
                                      child: Padding(
                                        padding:  EdgeInsets.only(bottom: OtherConstant.kRegularPadding),
                                        child: Text(e.name!, style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w500)),
                                      ));
                                }).toList(),

                              ),


                              ////////////////////// Designation   /////////
                               SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Designation',isRequire: true),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomDropdown(
                                selectValue: selecDesignationValue,
                                validator: (val) => val == null ? LocalString.Select_valid_info.tr : null,
                                hint: Text(LocalString.select_an_option.tr,
                                    style: CustomStyle.kCustomTextStyle(fontSize: OtherConstant.kMediumTextSize)),
                                onChanged: (val) {
                                  setState(() {
                                    selecDesignationValue = val;
                                    _.designationIDController.text = selecDesignationValue.toString();
                                  });
                                },
                                item: _.designationDropDownList.value.data?.map((e) {
                                  return DropdownMenuItem(
                                      value: e.id,
                                      child:Padding(
                                        padding:  EdgeInsets.only(bottom:OtherConstant.kRegularPadding),
                                        child: Text(e.name!,
                                            style:
                                            CustomStyle.kCustomTextStyle(
                                                fontWeight:
                                                FontWeight.w500)),
                                      ));
                                }).toList(),

                              ),

                              /////////// Department  ////////////////

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Department'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomDropdown(
                                selectValue: selecDepartmentValue,
                                // validator: (val) => val == null ? LocalString.Select_valid_info.tr : null,
                                hint: Text(LocalString.select_an_option.tr, style: CustomStyle.kCustomTextStyle(fontSize: OtherConstant.kMediumTextSize)),
                                onChanged: (val) {
                                  setState(() {
                                    selecDepartmentValue = val;
                                    _.departmentIDController.text = selecDepartmentValue.toString();
                                  });
                                },
                                item: _.departmentDropDownList.value.data
                                    ?.map((e) {
                                  return DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.name!, style: CustomStyle.kCustomTextStyle(fontWeight: FontWeight.w500)));
                                }).toList(),

                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Employee Official Phone'),
                              SizedBox(height: OtherConstant.kRegularPadding,),

                              CustomTextField.kCustomTextField(
                                  controller: _.employeeOfficialPhoneController,
                                  fillColor: ColorPath.kWhite
                              ),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Employee Official Email'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                  controller: _.employeeOfficialEmailController,
                                  fillColor: ColorPath.kWhite
                              ),



                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Joining Date',isRequire: true),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                controller: _.joiningDateController,
                                hint: 'mm/dd/yyyy',
                                validator: (val) => val!.isEmpty ? LocalString.Enter_valid_info.tr : null,
                                readOnly: true,
                                fillColor: ColorPath.kWhite,
                                onPresses: () {
                                  DateTimePicker.selectDate(context).then(
                                          (time) {
                                        _.joiningDateController.text = TimeConvert.toYYYYmmdd(time.toString());}
                                  );
                                  // setState(() {});
                                },
                                suffixIcon: Padding(padding: EdgeInsets.only(right:OtherConstant.kRegularPadding),
                                  child: Icon(FeatherIcons.calendar,size: OtherConstant.kSmallIconSize,),),),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'PRL Start Date'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                controller: _.prlStartDateDateController,
                                hint: 'mm/dd/yyyy',
                                // validator: (val) => val!.isEmpty ? LocalString.Enter_valid_info.tr : null,
                                readOnly: true,
                                fillColor: ColorPath.kWhite,
                                // onPresses: () {
                                //   DateTimePicker.selectDate(context).then(
                                //           (time) {
                                //         _.prlStartDateDateController.text = TimeConvert.toYYYYmmdd(time.toString());}
                                //   );
                                //   // setState(() {});
                                // },
                                suffixIcon: Padding(padding: EdgeInsets.only(right:OtherConstant.kRegularPadding),
                                  child: Icon(FeatherIcons.calendar,size: OtherConstant.kSmallIconSize,),),),

                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'PRL End Date'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                             CustomTextField.kCustomTextField(
                             controller: _.prlEndDateDateController,
                              hint: 'mm/dd/yyyy',
                             // validator: (val) => val!.isEmpty ? LocalString.Enter_valid_info.tr : null,
                             readOnly: true,
                            fillColor: ColorPath.kWhite,
                           // onPresses: () {
                          //   DateTimePicker.selectDate(context).then(
                           //           (time) {
                          //         _.prlEndDateDateController.text = TimeConvert.toYYYYmmdd(time.toString());}
                               //   );
                          //   // setState(() {});
                            // },
                          suffixIcon: Padding(padding: EdgeInsets.only(right:OtherConstant.kRegularPadding),
                          child: Icon(FeatherIcons.calendar,size: OtherConstant.kSmallIconSize,),),),


                              SizedBox(height: OtherConstant.kLargePadding,),
                              CustomWidgets.requiredLabelText(label:'Retired Date'),
                              SizedBox(height: OtherConstant.kRegularPadding,),
                              CustomTextField.kCustomTextField(
                                controller: _.retiredDateController,
                                hint: 'mm/dd/yyyy',
                                // validator: (val) => val!.isEmpty ? LocalString.Enter_valid_info.tr : null,
                                readOnly: true,
                                fillColor: ColorPath.kWhite,
                                // onPresses: () {
                                //   DateTimePicker.selectDate(context).then(
                                //           (time) {
                                //         _.prlEndDateDateController.text = TimeConvert.toYYYYmmdd(time.toString());}
                                //   );
                                //   // setState(() {});
                                // },
                                suffixIcon: Padding(padding: EdgeInsets.only(right:OtherConstant.kRegularPadding),
                                  child: Icon(FeatherIcons.calendar,size: OtherConstant.kSmallIconSize,),),),
                           SizedBox(height: OtherConstant.kLargePadding,)
                            ],
                          ),
                        )
                    ),

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
                               'Save',
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
                          child:  SizedBox(),
                        )
                      ],
                    );
                  },
                ),
              ],
            );
          })


    );
  }


}
