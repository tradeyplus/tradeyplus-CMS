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
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart'; // Required for Firebase initialization
import 'package:firebase_storage/firebase_storage.dart'; // For Firebase Storage
import 'package:excel/excel.dart' as Excel;
import 'dart:math';


class UploadPageWidget extends StatefulWidget {
  const UploadPageWidget({super.key});

  @override
  State<UploadPageWidget> createState() => _UploadPageWidgetState();
}

//Custom upload Excel file start

class _UploadPageWidgetState extends State<UploadPageWidget> {
  late UploadPageModel _model;
  void uploadData(BuildContext context, List<List<dynamic>> data) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    WriteBatch batch = firestore.batch(); // Create a new batch
    int totalBalance = 0;
    int totalPoints = 0;
    List<DocumentReference> docRefs = []; // To store document references for later use
    // Loop through each row of validated data
    for (var row in data) {
      var documentReference = firestore.collection('investment_data').doc(); // Create a new document reference
      docRefs.add(documentReference); // Store the reference for later update
      // Prepare the data map
      var dataMap = {
        'investor_evaluation': cellIntToDouble(row, 0),
        'amount': cellIntToDouble(row, 1),
        'duration': toInt(row, 2),
        //result[3].toString().toLowerCase() == 'profit' ? TransactionType.PROFIT : result[3].toString().toLowerCase() == 'deposit' ? TransactionType.DEPOSIT : TransactionType.COMMISSION,
        'transaction_type': row[3],
        'created_date': DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(row[4].toString()),
        'points': cellIntToDouble(row, 6),
        'profit_ratio': cellIntToDouble(row, 7),
        'investor_ref' : _model.userRef?.reference,
        'investor_id' : _model.userRef?.reference.path.split('/').last,
        'investmentId': random_data.randomString(10,15,true,true,true,),
        'investmentRef': documentReference,
      };
      totalBalance += int.tryParse(row[5].toString()) ?? 0;
      totalPoints += int.tryParse(row[6].toString()) ?? 0;

      batch.set(documentReference, dataMap); // Add a set operation to the batch
    }
    // Commit the batch
      batch.commit().then((_) async {
        try {
          
          if (_model.userRef != null) {
            await _model.userRef!.reference.update({
              'balance': FieldValue.increment(totalBalance),
              'points': FieldValue.increment(totalPoints),
            });
            // print(totalBalance);
            // print(totalPoints);
          } else {
            print("Error: _model.userRef or its reference is null.");
          }
          // Ensure all needed values are not null before logging
          if (currentUserReference != null) {
            await LogRecord.collection.doc().set(createLogRecordData(
              logUserRef: currentUserReference,
              logType: LogType.CREATE_INVESTMENT_DATA,
              logTime: getCurrentTimestamp,
              logUserName: currentUserDisplayName,
              logUserId: currentUserUid,
            ));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('All data successfully uploaded, updated, and logged'))
            );
          } else {
            print("Error: Logging references or timestamp are null.");
          }
        } catch (error) {
          print('Failed to update1 $error');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to update additional fields or log: $error'))
          );
        }
        
    }).catchError((error) {
      print('Failed to upload data: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload data: $error'))
      );
    });
  }

  //custom code scan excel file end

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
                          maxHeight: 1.0,
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
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
                                      // onPressed: (_model.dropDownValue == null || _model.dropDownValue == '')
                                      //       ? null : () async {
                                      //       logFirebaseEvent('UPLOAD_PAGE_COMP_BROWSE_FILE_BTN_ON_TAP');
                                      //       final selectedFiles = await selectFiles(
                                      //         multiFile: false,
                                      //         allowedExtensions: ['xlsx'],  
                                      //       );

                                      onPressed: (_model.dropDownValue == null || _model.dropDownValue == '')
                                            ? null : () async {
                                            logFirebaseEvent('UPLOAD_PAGE_COMP_BROWSE_FILE_BTN_ON_TAP');
                                            FilePickerResult? selectedFiles = await FilePicker.platform.pickFiles(
                                            type: FileType.custom,
                                            allowedExtensions: ['xlsx'],
                                            );
                                            _model.userRef =

                                            //dropdown
                                            await queryUsersRecordOnce(
                                              queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                              'uid',
                                              isEqualTo: _model.dropDownValue,
                                            ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            
                                            if (selectedFiles != null) { // Check if a file is selected
                                              var bytes = selectedFiles.files.first.bytes; // Get the bytes of the first file
                                              if (bytes != null) {
                                                var excel = Excel.Excel.decodeBytes(bytes); // Decode the bytes to an Excel document
                                                List<List<dynamic>> validDataRows = []; // Initialize an empty list to store valid rows

                                                // Iterate through each sheet in the Excel document
                                                for (var table in excel.tables.keys) {
                                                  var sheet = excel.tables[table]; // Get the current sheet
                                                  if (sheet != null && sheet.rows.length > 1) { // Check if the sheet is not empty
                                                    // Iterate through each row, skipping the header (index 0)
                                                    for (int rowIndex = 1; rowIndex < sheet.rows.length; rowIndex++) {
                                                      var currentRow = sheet.rows[rowIndex];
                                                      List<dynamic> rowData = [];
                                                      bool hasError = false;

                                                      // Iterate through the first 8 columns of the current row
                                                      for (int colIndex = 0; colIndex < 8; colIndex++) {
                                                        var cellValue = currentRow[colIndex]?.value ?? ''; // Get cell value or empty string if null
                                                        if (cellValue.toString().isEmpty) {
                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                            SnackBar(content: Text('Collum ${colIndex + 1} is empty in row $rowIndex'))
                                                          );
                                                          hasError = true;
                                                          break; // Exit the loop if a required field is empty
                                                        }

                                                        // Perform specific validations based on column index
                                                        switch (colIndex) {
                                                          case 0:
                                                          case 1:
                                                          case 5:
                                                            if (!isDouble(cellValue.toString())) {
                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                SnackBar(content: Text('Error: Column ${colIndex + 1} must be a number'))
                                                              );
                                                              hasError = true;
                                                            }
                                                            break;
                                                          case 2:
                                                          case 6:
                                                          case 7:
                                                            if (!isInteger(cellValue.toString())) {
                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                SnackBar(content: Text('Error: Column ${colIndex + 1} must be an integer'))
                                                              );
                                                              hasError = true;
                                                            }
                                                            break;
                                                          case 3: 
                                                            String lowerCaseValue = cellValue.toString().toLowerCase();
                                                            print(lowerCaseValue);
                                                            if (lowerCaseValue != "profit" && lowerCaseValue != "deposit" && lowerCaseValue != "commission") {
                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                    const SnackBar(content: Text('Error: Column 4 must be "profit", "deposit", or "commission"'))
                                                                );
                                                                hasError = true;
                                                            } else {
                                                                // Assigning the correct transaction type based on the string
                                                                cellValue = lowerCaseValue == 'profit' ? 'PROFIT' :
                                                                            lowerCaseValue == 'deposit' ? 'DEPOSIT' : 'COMMISSION';
                                                            }
                                                            break;
                                                          case 4:
                                                          print(cellValue.toString());
                                                            if (!isValidDateFormat(cellValue.toString(), "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")) {
                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                SnackBar(content: Text('Error: Date format is incorrect in column 5 in row $rowIndex'))
                                                              );
                                                              hasError = true;
                                                            }
                                                            
                                                            break;
                                                        }

                                                        if (!hasError) rowData.add(cellValue); // Add cell value to row data if no errors
                                                      } 

                                                      if (!hasError && rowData.length == 8) validDataRows.add(rowData); // Add row data to valid rows if no errors and all columns are valid
                                                    }
                                                    // print("ValidDataRow = ${validDataRows.length}");
                                                    // print("sheetRow = ${sheet.rows.length - 2}");

                                                    // Upload valid rows to Firestore
                                                    if (validDataRows.length == sheet.rows.length - 1) {
                                                      uploadData(context, validDataRows);
                                                    } else {
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                            const SnackBar(content: Text('Unable to upload data'))
                                                          );
                                                    }
                                                  } else { ScaffoldMessenger.of(context).showSnackBar(
                                                            const SnackBar(content: Text('The Sheet is Empty'))
                                                          );}
                                                }
                                              }
                                            }
                                            //testing for one row start
                                            // var result = [];
                                            // if (selectedFiles != null) {
                                            //   print("This is filePath: ${selectedFiles[0].filePath}");
                                            //   print("This is storagePath: ${selectedFiles[0].storagePath}");
                                            //   setState(() =>
                                            //   _model.isDataUploading = true);
                                            //   var selectedUploadedFiles =
                                            //   <FFUploadedFile>[];
                                            //   try {
                                            //     selectedUploadedFiles = selectedFiles.map((m)
                                            //     => FFUploadedFile(
                                            //                 name: m.storagePath.split('/').last,     
                                            //                 bytes: m.bytes,
                                            //               ))
                                            //           .toList();
                                            //   } 
                                            //   finally {
                                            //       _model.isDataUploading = false;
                                            //     }
                                            //     if (selectedUploadedFiles.length == selectedFiles.length) {
                                            //       setState(() {
                                            //         _model.uploadedLocalFile = selectedUploadedFiles.first;
                                            //       });
                                            //       var bytes = _model.uploadedLocalFile.bytes; 
                                            //       if (bytes != null) {
                                            //         var excel = Excel.Excel.decodeBytes(bytes);
                                            //         for (var table in excel.tables.keys) {
                                            //            // Sheet name
                                            //           var sheet = excel.tables[table];
                                            //           if (sheet != null && sheet.rows.length > 1) {
                                            //             // Get the second row
                                            //             var secondRow = sheet.rows[1];
                                            //             // Loop through the first 8 columns of the second row
                                            //             for (int i = 0; i < 8; i++) {
                                            //               // Get the cell value, with a check for null
                                            //               var cellValue = secondRow[i]?.value;
                                            //               // Handling empty cells and providing feedback via Snackbar
                                            //                 if (cellValue == null || cellValue.toString().isEmpty) {
                                            //                   ScaffoldMessenger.of(context).showSnackBar(
                                            //                     SnackBar(content: Text('Error: Required field in column ${i+1} is empty'))
                                            //                   );
                                            //                   return;
                                            //                 }
                                            //                 // Column specific validations
                                            //                 if ((i == 0 || i == 1 || i == 5) && !isDouble(cellValue.toString())) { // Double for columns 1, 2, 6
                                            //                   ScaffoldMessenger.of(context).showSnackBar(
                                            //                     SnackBar(content: Text('Error: Column ${i+1} must be a number'))
                                            //                   );
                                            //                   return;
                                            //                 } else if ((i == 2 || i == 6 || i == 7) && !isInteger(cellValue.toString())) { // Integer for columns 3, 7, 8
                                            //                   ScaffoldMessenger.of(context).showSnackBar(
                                            //                     SnackBar(content: Text('Error: Column ${i+1} must be an integer'))
                                            //                   );
                                            //                   return;
                                            //                 } else if (i == 4 && !isValidDateFormat(cellValue.toString(), "d/M/yy")) { // Date format for column 5
                                            //                   ScaffoldMessenger.of(context).showSnackBar(
                                            //                     const SnackBar(content: Text('Error: Date format is incorrect in column 5'))
                                            //                   );
                                            //                   return;
                                            //                 } else {
                                            //                 }
                                            //                 result.add(cellValue);
                                            //             }
                                            //           }
                                            //         } 
                                            //       }
                                            //     } else  {
                                            //       setState(() {});
                                            //     }
                                            //   }
                                              // print("Result $result");
                                        // print("myDouble: ${cellIntToDouble(result, 1)}");
                                        // print("investorEva: ${cellIntToDouble(result, 0)}");
                                        // print ("profitRatio: ${cellIntToDouble(result, 7)}");
                                        // print("investorRef: ${_model.userRef?.reference}");
                                        // print("Transition: ${result[3].toString().toLowerCase() == 'profit' ? TransactionType.PROFIT : result[3].toString().toLowerCase() == 'deposit' ? TransactionType.DEPOSIT : TransactionType.COMMISSION}");
                                        // print("duration: ${toInt(result, 2)}");
                                        // print("points: ${cellIntToDouble(result, 6)}");
                                        // print("investorId: ${_model.userRef?.reference.path.split('/').last}"); 
                                        // print("createdDate: ${toDate(result, 4)}");
                                        // var investmentDataRecordReference =
                                        //     InvestmentDataRecord.collection
                                        //         .doc();
                                        // await investmentDataRecordReference
                                        //     .set(createInvestmentDataRecordData(
                                        //   amount: cellIntToDouble(result, 1),
                                        //   investorEvaluation: cellIntToDouble(result, 0),
                                        //   profitRatio: cellIntToDouble(result, 7),
                                        //   investorRef:
                                        //       _model.userRef?.reference,
                                        //   transactionType: result[3].toString().toLowerCase() == 'profit' ? TransactionType.PROFIT : result[3].toString().toLowerCase() == 'deposit' ? TransactionType.DEPOSIT : TransactionType.COMMISSION,
                                        //   investmentId:
                                        //       random_data.randomString(
                                        //     10,
                                        //     15,
                                        //     true,
                                        //     true,
                                        //     true,
                                        //   ),
                                        //   duration: toInt(result, 2),
                                        //   points: cellIntToDouble(result, 6),
                                        //   investorId: _model.userRef?.reference.path.split('/').last,
                                        //   createdDate: toDate(result, 4),
                                        // ));
                                        // _model.investmentData = InvestmentDataRecord
                                        //     .getDocumentFromData(
                                        //         createInvestmentDataRecordData(
                                        //           amount: cellIntToDouble(result, 1),
                                        //           investorEvaluation: cellIntToDouble(result, 0),
                                        //           profitRatio: cellIntToDouble(result, 7),
                                        //           investorRef:
                                        //               _model.userRef?.reference,
                                        //           transactionType:
                                        //               result[3].toString().toLowerCase() == 'profit' ? TransactionType.PROFIT : result[3].toString().toLowerCase() == 'deposit' ? TransactionType.DEPOSIT : TransactionType.COMMISSION,
                                        //           investmentId:
                                        //               random_data.randomString(
                                        //             10,
                                        //             15,
                                        //             true,
                                        //             true,
                                        //             false,
                                        //           ),
                                        //           duration: toInt(result, 2),
                                        //           points: cellIntToDouble(result, 6),
                                        //           investorId:
                                        //             _model.userRef?.reference.path.split('/').last,
                                        //           createdDate: 
                                        //               toDate(result, 4),
                                        //         ),
                                        //         investmentDataRecordReference);
                                        // await _model.investmentData!.reference
                                        //     .update(
                                        //         createInvestmentDataRecordData(
                                        //   investmentRef:
                                        //       _model.investmentData?.reference,
                                        // ));
                                        //Log
                                        // await LogRecord.collection
                                        //     .doc()
                                        //     .set(createLogRecordData(
                                        //       logUserRef: currentUserReference,
                                        //       logType: LogType
                                        //           .CREATE_INVESTMENT_DATA,
                                        //       logTime: getCurrentTimestamp,
                                        //       logUserName:
                                        //           currentUserDisplayName,
                                        //       logUserId: currentUserUid,
                                        //     ));
                                            //testing for one row end

                                        setState(() {});
                                      },
                                      
                                      // Custom code end
                                      text: FFLocalizations.of(context).getText(
                                        'yvm9kbwv' /* Browse File */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 38.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 9.0),
                                        iconPadding: const EdgeInsets.all(0.0),
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
                                        borderSide: const BorderSide(
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
