import 'dart:async';

import 'package:tradey_plus_web_cms/components/used_com/upload_page/calculate_value.dart';


import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upload_page_model.dart';
export 'upload_page_model.dart';
import 'package:firebase_core/firebase_core.dart'; // Required for Firebase initialization
import 'package:firebase_storage/firebase_storage.dart'; // For Firebase Storage
import 'package:excel/excel.dart' as Excel;
import 'dart:math';


class UploadPageWidget extends StatefulWidget {
  const UploadPageWidget({super.key});

  @override
  State<UploadPageWidget> createState() => _UploadPageWidgetState();
}

class _UploadPageWidgetState extends State<UploadPageWidget> {
  late UploadPageModel _model;

  //additional member start
  bool isDouble(String s) {
    return double.tryParse(s) != null;
  }

  bool isInteger(String s) {
    return int.tryParse(s) != null;
  }

  bool isValidDateFormat(String date, String format) {
    try {
      DateFormat(format).parseStrict(date);
      return true;
    } catch (e) {
      return false;
    }
  }
  //additional member end



  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width < kBreakpointSmall
                        ? 10.0
                        : 30.0,
                    0.0,
                  ),
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width < kBreakpointSmall
                        ? 10.0
                        : 30.0,
                    0.0,
                  ),
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width < kBreakpointSmall
                        ? 10.0
                        : 30.0,
                    0.0,
                  ),
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width < kBreakpointSmall
                        ? 10.0
                        : 30.0,
                    0.0,
                  )),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Color(0xFFCBD0DC),
                        borderRadius: 25.0,
                        borderWidth: 2.0,
                        buttonSize:
                            MediaQuery.sizeOf(context).width < kBreakpointSmall
                                ? 40.0
                                : 50.0,
                        fillColor: FlutterFlowTheme.of(context).secondary,
                        icon: Icon(
                          Icons.cloud_done_outlined,
                          color: Color(0xFF292D32),
                          size: MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall
                              ? 14.0
                              : 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'r24z20jr' /* Upload files */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall
                                      ? 16.0
                                      : 25.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'saq6vbqx' /* Select and upload the files of... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFFCBD0DC),
                                  fontSize: MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall
                                      ? 8.0
                                      : 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ].divide(SizedBox(height: 9.0)),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord.where(
                          'user_role',
                          isEqualTo: UserRole.INVESTOR.serialize(),
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        // List<UsersRecord> dropDownUsersRecordList =
                        //     snapshot.data!;
                        // return FlutterFlowDropDown<String>(
                        //   controller: _model.dropDownValueController ??=
                        //       FormFieldController<String>(null),
                        //   options: dropDownUsersRecordList
                        //       .map((e) => e.displayName)
                        //       .toList(),
                        //   onChanged: (val) =>
                        //       setState(() => _model.dropDownValue = val),
                        List<UsersRecord> dropDownUsersRecordList = snapshot.data!;
                        return FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            null
                          ),
                          options: List<String>.from(
                              dropDownUsersRecordList.map((e) => e.uid).toList()),
                          optionLabels:
                              dropDownUsersRecordList.map((e) => e.displayName).toList(),
                          onChanged: (val) => setState(() => _model.dropDownValue = val),
                          width: MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall
                              ? 100.0
                              : 155.0,
                          height: MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall
                              ? 35.0
                              : 50.0,
                          maxHeight: 150.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall
                                    ? 12.0
                                    : 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                          hintText: FFLocalizations.of(context).getText(
                            'e59dl8b7' /*Choose User*/,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 9.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 4.0,
              color: Color(0xFFCBD0DC),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(70.0, 35.0, 70.0, 0.0),
                child: Container(
                  height: 268.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(26.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 5.0,
                    ),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 45.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 465.0,
                            height: 167.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Icon(
                                    Icons.cloud_done_outlined,
                                    color: Color(0xFF292D32),
                                    size: MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall
                                        ? 20.0
                                        : 47.0,
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'j99c87ez' /* Choose a file or drag & drop i... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize:
                                            MediaQuery.sizeOf(context).width <
                                                    kBreakpointSmall
                                                ? 12.0
                                                : 20.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '8uxe41b7' /* .xlsx, .xlsm and .xltx formats... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize:
                                            MediaQuery.sizeOf(context).width <
                                                    kBreakpointSmall
                                                ? 10.0
                                                : 20.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      // onPressed: () async {
                                      //   logFirebaseEvent(
                                      //       'UPLOAD_PAGE_COMP_BROWSE_FILE_BTN_ON_TAP');
                                      //   final selectedFiles = await selectFiles(
                                      //     allowedExtensions: ['xlsx'],
                                      //     multiFile: false,
                                      //   );
                                      //   if (selectedFiles != null) {
                                      //     setState(() =>
                                      //         _model.isDataUploading = true);
                                      //     var selectedUploadedFiles =
                                      //         <FFUploadedFile>[];

                                      //     var downloadUrls = <String>[];
                                      //     try {
                                      //       selectedUploadedFiles =
                                      //           selectedFiles
                                      //               .map((m) => FFUploadedFile(
                                      //                     name: m.storagePath
                                      //                         .split('/')
                                      //                         .last,
                                      //                     bytes: m.bytes,
                                      //                   ))
                                      //               .toList();

                                      //       downloadUrls = (await Future.wait(
                                      //         selectedFiles.map(
                                      //           (f) async => await uploadData(
                                      //               f.storagePath, f.bytes),
                                      //         ),
                                      //       ))
                                      //           .where((u) => u != null)
                                      //           .map((u) => u!)
                                      //           .toList();
                                      //     } finally {
                                      //       _model.isDataUploading = false;
                                      //     }
                                      //     if (selectedUploadedFiles.length ==
                                      //             selectedFiles.length &&
                                      //         downloadUrls.length ==
                                      //             selectedFiles.length) {
                                      //       setState(() {
                                      //         _model.uploadedLocalFile =
                                      //             selectedUploadedFiles.first;
                                      //         _model.uploadedFileUrl =
                                      //             downloadUrls.first;
                                      //       });
                                      //     } else {
                                      //       setState(() {});
                                      //       return;
                                      //     }
                                      //   }
                                      // },
                                      //             .toList();
                                        //   } finally {
                                        //     _model.isDataUploading = false;
                                        //   }
                                        //   if (selectedUploadedFiles.length ==
                                        //       selectedFiles.length) {
                                        //     setState(() {
                                        //       _model.uploadedLocalFile =
                                        //           selectedUploadedFiles.first;
                                        //     });
                                        //   } else {
                                        //     setState(() {});
                                        //     return;
                                        //   }
                                        // }
                                    
                                      //custom code start
                                      onPressed: (_model.dropDownValue == null || _model.dropDownValue == '')
                                            ? null : () async {
                                            logFirebaseEvent('UPLOAD_PAGE_COMP_BROWSE_FILE_BTN_ON_TAP');
                                            final selectedFiles = await selectFiles(
                                              multiFile: false,
                                              allowedExtensions: ['xlsx'],
                                          
                                            );

                                            
                                            
                        
                                            var result = [];
                                            
                                            if (selectedFiles != null) {
                                              print("This is filePath: ${selectedFiles[0].filePath}");
                                              print("This is storagePath: ${selectedFiles[0].storagePath}");
                                              setState(() =>
                                              _model.isDataUploading = true);
                                              var selectedUploadedFiles =
                                              <FFUploadedFile>[];
                                              // try {
                                              //   selectedUploadedFiles = selectedFiles.map((m) {
                                              //     // Extract the file name
                                              //     String fileName = m.storagePath.split('/').last;
                                                  
                                              //     // Add the file name to the list of file names
                                              //     fileNames.add(fileName);
                                                  
                                              //     // Return a new FFUploadedFile
                                              //     return FFUploadedFile(
                                              //       name: fileName,
                                              //       bytes: m.bytes,
                                              //     );
                                              //   }).toList();
                                              // }
                                              try {
                                                selectedUploadedFiles = selectedFiles.map((m)
                                              
                                                => FFUploadedFile(
                                                            name: m.storagePath.split('/').last,
                                                            
                                                            bytes: m.bytes,
                                                          ))
                                                      .toList();

                                              } 
                                              finally {
                                                  _model.isDataUploading = false;
                                                }
                                                
                                                if (selectedUploadedFiles.length == selectedFiles.length) {
                                                  setState(() {
                                                    _model.uploadedLocalFile = selectedUploadedFiles.first;
                                                  });
                                                  
                                                    
                                                  var bytes = _model.uploadedLocalFile.bytes; 
                                                  if (bytes != null) {
                                                    var excel = Excel.Excel.decodeBytes(bytes);
                                                    for (var table in excel.tables.keys) {
                                                       // Sheet name
                                                      var sheet = excel.tables[table];
                                                      
                                                      if (sheet != null && sheet.rows.length > 1) {
                                                        // Get the second row
                                                        var secondRow = sheet.rows[1];
                                                        // Loop through the first 8 columns of the second row
                                                        for (int i = 0; i < 8; i++) {
                                                          // Get the cell value, with a check for null
                                                          var cellValue = secondRow[i]?.value;
                                                          // Handling empty cells and providing feedback via Snackbar
                                                            if (cellValue == null || cellValue.toString().isEmpty) {
                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                SnackBar(content: Text('Error: Required field in column ${i+1} is empty'))
                                                              );
                                                              return;
                                                            }

                                                            // Column specific validations
                                                            if ((i == 0 || i == 1 || i == 5) && !isDouble(cellValue.toString())) { // Double for columns 1, 2, 6
                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                SnackBar(content: Text('Error: Column ${i+1} must be a number'))
                                                              );
                                                              return;
                                                            } else if ((i == 2 || i == 6 || i == 7) && !isInteger(cellValue.toString())) { // Integer for columns 3, 7, 8
                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                SnackBar(content: Text('Error: Column ${i+1} must be an integer'))
                                                              );
                                                              return;
                                                            } else if (i == 4 && !isValidDateFormat(cellValue.toString(), "dd/MM/yy")) { // Date format for column 5
                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                const SnackBar(content: Text('Error: Date format is incorrect in column 5'))
                                                              );
                                                              return;
                                                            } else {
                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                const SnackBar(content: Text('The File has been uploaded'))
                                                                );
                                                            }
                                                            result.add(cellValue);

                                                                                                          
                                                          // // If the cellValue is null, determine what to return based on the column
                                                          // if (cellValue == null) {
                                                          //   if (i == 3) { // For the fourth column (index 3), return an empty string
                                                          //     result.add("");
                                                          //   } else { // For other columns, return 0
                                                          //     result.add(0);
                                                          //   }
                                                          // } else {
                                                          //   result.add(cellValue);
                                                          // }
                                                        }
                                                      }
                                                      //skip the first row
                                                      // for (var row in sheet!.rows.skip(1)) {
                                                      //   // Iterate through each cell in the row and print its value
                                                      //   // var rowValues = row.map((cell) => double.parse(cell!.value.toString())).toList();
                                                      //   // double testRowVal = double.parse(rowValues[0].toStringAsFixed(2));
                                                      //   // Do something with the row values, e.g., print or process further
                                                      //   var rowValues = row.map((cell) => cell!.value).toList();
                                                      //   result.addAll(rowValues);
                                                      // }
                                                      
                                                    } 
                                                  }
                                                } else  {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(content: Text('Error: No data found in the uploaded file'))
                                                  );
                                                  setState(() {});
                                                }
                                              }
                                              print("Result $result");
                                              

                                        
                                        
                                                
                                        _model.userRef =
                                            await queryUsersRecordOnce(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                            'uid',
                                            isEqualTo: _model.dropDownValue,
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);

                                        
                                        print("myDouble: ${cellIntToDouble(result, 1)}");
                                        print("investorEva: ${cellIntToDouble(result, 0)}");
                                        print ("profitRatio: ${cellIntToDouble(result, 7)}");
                                        print("investorRef: ${_model.userRef?.reference}");

                                        print("Transition: ${result[3].toString().toLowerCase() == 'profit' ? TransactionType.PROFIT : result[3].toString().toLowerCase() == 'deposit' ? TransactionType.DEPOSIT : TransactionType.COMMISSION}");
                                        
                                        print("duration: ${toInt(result, 2)}");
                                        print("points: ${cellIntToDouble(result, 6)}");
                                        print("investorId: ${_model.userRef?.reference.path.split('/').last}"); 
                                        print("createdDate: ${toDate(result, 4)}");

                                        

                                      //   var investmentDataRecordReference =
                                      //       InvestmentDataRecord.collection
                                      //           .doc();
                                      //   await investmentDataRecordReference
                                      //       .set(createInvestmentDataRecordData(
                                      //     amount: cellIntToDouble(result, 1),
                                      //     investorEvaluation: cellIntToDouble(result, 0),
                                      //     profitRatio: cellIntToDouble(result, 7),
                                      //     investorRef:
                                      //         _model.userRef?.reference,
                                      //     transactionType: result[3].toString().toLowerCase() == 'profit' ? TransactionType.PROFIT : result[3].toString().toLowerCase() == 'deposit' ? TransactionType.DEPOSIT : TransactionType.COMMISSION,
                                      //     investmentId:
                                      //         random_data.randomString(
                                      //       10,
                                      //       15,
                                      //       true,
                                      //       true,
                                      //       true,
                                      //     ),
                                      //     duration: toInt(result, 2),
                                      //     points: cellIntToDouble(result, 6),
                                      //     investorId: _model.userRef?.reference.path.split('/').last,
                                          
                                      //     createdDate: toDate(result, 4),
                                      //   ));
                                      //   _model.investmentData = InvestmentDataRecord
                                      //       .getDocumentFromData(
                                      //           createInvestmentDataRecordData(
                                      //             amount: cellIntToDouble(result, 1),
                                      //             investorEvaluation: cellIntToDouble(result, 0),
                                      //             profitRatio: cellIntToDouble(result, 7),
                                      //             investorRef:
                                      //                 _model.userRef?.reference,
                                      //             transactionType:
                                      //                 result[3].toString().toLowerCase() == 'profit' ? TransactionType.PROFIT : result[3].toString().toLowerCase() == 'deposit' ? TransactionType.DEPOSIT : TransactionType.COMMISSION,
                                      //             investmentId:
                                      //                 random_data.randomString(
                                      //               10,
                                      //               15,
                                      //               true,
                                      //               true,
                                      //               false,
                                      //             ),
                                      //             duration: toInt(result, 2),
                                      //             points: cellIntToDouble(result, 6),
                                      //             investorId:
                                      //               _model.userRef?.reference.path.split('/').last,
                                      //             createdDate: 
                                      //                 toDate(result, 4),
                                      //           ),
                                      //           investmentDataRecordReference);

                                      //   await _model.investmentData!.reference
                                      //       .update(
                                      //           createInvestmentDataRecordData(
                                      //     investmentRef:
                                      //         _model.investmentData?.reference,
                                      //   ));

                                      //   await LogRecord.collection
                                      //       .doc()
                                      //       .set(createLogRecordData(
                                      //         logUserRef: currentUserReference,
                                      //         logType: LogType
                                      //             .CREATE_INVESTMENT_DATA,
                                      //         logTime: getCurrentTimestamp,
                                      //         logUserName:
                                      //             currentUserDisplayName,
                                      //         logUserId: currentUserUid,
                                      //       ));

                                      //   setState(() {});
                                      },
                                      // Custom code end
                                      text: FFLocalizations.of(context).getText(
                                        'yvm9kbwv' /* Browse File */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 38.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 9.0),
                                        iconPadding: EdgeInsets.all(0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        disabledColor: FlutterFlowTheme.of(context).error,
                                        disabledTextColor: FlutterFlowTheme.of(context).falling,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (_model.uploadedLocalFile != null &&
                      (_model.uploadedLocalFile.bytes?.isNotEmpty ?? false))
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 9.0, 30.0, 9.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Excel_logo.png',
                                    width: MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall
                                        ? 25.0
                                        : 50.0,
                                    height: MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall
                                        ? 25.0
                                        : 50.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFAppState().selectedFileName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                              .width <
                                                          kBreakpointSmall
                                                      ? 14.0
                                                      : 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'ok78qct2' /* 120 KB of 120 KB • */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                              .width <
                                                          kBreakpointSmall
                                                      ? 12.0
                                                      : 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Icon(
                                          Icons.check_circle,
                                          color: FlutterFlowTheme.of(context)
                                              .rising,
                                          size:
                                              MediaQuery.sizeOf(context).width <
                                                      kBreakpointSmall
                                                  ? 16.0
                                                  : 24.0,
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'vrt8s1s8' /* Completed */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                              .width <
                                                          kBreakpointSmall
                                                      ? 12.0
                                                      : 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
