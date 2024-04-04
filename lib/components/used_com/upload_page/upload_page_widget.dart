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

class UploadPageWidget extends StatefulWidget {
  const UploadPageWidget({super.key});

  @override
  State<UploadPageWidget> createState() => _UploadPageWidgetState();
}

class _UploadPageWidgetState extends State<UploadPageWidget> {
  late UploadPageModel _model;

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
                        List<UsersRecord> dropDownUsersRecordList =
                            snapshot.data!;
                        return FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(null),
                          options: dropDownUsersRecordList
                              .map((e) => e.displayName)
                              .toList(),
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue = val),
                          width: MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall
                              ? 100.0
                              : 135.0,
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
                            'e59dl8b7' /* Month */,
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
            Divider(
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
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'UPLOAD_PAGE_COMP_BROWSE_FILE_BTN_ON_TAP');
                                        final selectedFiles = await selectFiles(
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          setState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedFiles.length) {
                                            setState(() {
                                              _model.uploadedLocalFile =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        _model.userRef =
                                            await queryUsersRecordOnce(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                            'uid',
                                            isEqualTo: _model.dropDownValue,
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);

                                        var investmentDataRecordReference =
                                            InvestmentDataRecord.collection
                                                .doc();
                                        await investmentDataRecordReference
                                            .set(createInvestmentDataRecordData(
                                          amount: 0.0,
                                          investorEvaluation: 0.0,
                                          profitRatio: 5.0,
                                          investorRef:
                                              _model.userRef?.reference,
                                          transactionType:
                                              TransactionType.PROFIT,
                                          investmentId:
                                              random_data.randomString(
                                            10,
                                            15,
                                            true,
                                            true,
                                            false,
                                          ),
                                          duration: 0,
                                          points: 0.0,
                                          investorId: random_data.randomString(
                                            10,
                                            15,
                                            true,
                                            true,
                                            true,
                                          ),
                                          createdDate: getCurrentTimestamp,
                                        ));
                                        _model.investmentData = InvestmentDataRecord
                                            .getDocumentFromData(
                                                createInvestmentDataRecordData(
                                                  amount: 0.0,
                                                  investorEvaluation: 0.0,
                                                  profitRatio: 5.0,
                                                  investorRef:
                                                      _model.userRef?.reference,
                                                  transactionType:
                                                      TransactionType.PROFIT,
                                                  investmentId:
                                                      random_data.randomString(
                                                    10,
                                                    15,
                                                    true,
                                                    true,
                                                    false,
                                                  ),
                                                  duration: 0,
                                                  points: 0.0,
                                                  investorId:
                                                      random_data.randomString(
                                                    10,
                                                    15,
                                                    true,
                                                    true,
                                                    true,
                                                  ),
                                                  createdDate:
                                                      getCurrentTimestamp,
                                                ),
                                                investmentDataRecordReference);

                                        await _model.investmentData!.reference
                                            .update(
                                                createInvestmentDataRecordData(
                                          investmentRef:
                                              _model.investmentData?.reference,
                                        ));

                                        await LogRecord.collection
                                            .doc()
                                            .set(createLogRecordData(
                                              logUserRef: currentUserReference,
                                              logType: LogType
                                                  .CREATE_INVESTMENT_DATA,
                                              logTime: getCurrentTimestamp,
                                              logUserName:
                                                  currentUserDisplayName,
                                              logUserId: currentUserUid,
                                            ));

                                        setState(() {});
                                      },
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
                                        FFLocalizations.of(context).getText(
                                          '4syrj65e' /* my-Data.xlsx */,
                                        ),
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
