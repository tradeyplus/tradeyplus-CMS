import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'log_page_model.dart';
export 'log_page_model.dart';

class LogPageWidget extends StatefulWidget {
  const LogPageWidget({
    super.key,
    String? typeLog,
  }) : this.typeLog = typeLog ?? 'Investment';

  final String typeLog;

  @override
  State<LogPageWidget> createState() => _LogPageWidgetState();
}

class _LogPageWidgetState extends State<LogPageWidget> {
  late LogPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogPageModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOG_PAGE_COMP_logPage_ON_INIT_STATE');
      if (widget.typeLog == 'Investment') {
        _model.investmentData = await queryLogRecordOnce(
          queryBuilder: (logRecord) =>
              logRecord.orderBy('log_time', descending: true),
        );
        _model.filterLog = _model.investmentData!
            .where((e) =>
                (e.logType == LogType.CREATE_INVESTMENT_DATA) ||
                (e.logType == LogType.UPDATE_INVESTMENT_DATA) ||
                (e.logType == LogType.UPLOAD_DOC))
            .toList()
            .toList()
            .cast<LogRecord>();
        setState(() {});
      } else {
        if (widget.typeLog == 'UserEntry') {
          _model.userEntry = await queryLogRecordOnce(
            queryBuilder: (logRecord) =>
                logRecord.orderBy('log_time', descending: true),
          );
          _model.filterLog = _model.userEntry!
              .where((e) =>
                  (e.logType == LogType.CREATE_USER) ||
                  (e.logType == LogType.UPDATE_USER))
              .toList()
              .toList()
              .cast<LogRecord>();
          setState(() {});
        } else {
          _model.allLog = await queryLogRecordOnce(
            queryBuilder: (logRecord) =>
                logRecord.orderBy('log_time', descending: true),
          );
          _model.filterLog = _model.allLog!.toList().cast<LogRecord>();
          setState(() {});
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 350.0,
          maxHeight: 600.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x266D7D93),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).border,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'lfgo6uyz' /* Notification */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall
                              ? 18.0
                              : 25.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final log = _model.filterLog.toList();
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(log.length, (logIndex) {
                            final logItem = log[logIndex];
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: 20.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Container(
                                            width: 1.0,
                                            height: 90.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dateTimeFormat(
                                            'd/M/y',
                                            logItem.logTime!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Text(
                                          logItem.logUserName,
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
                                                        ? 14.0
                                                        : 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: () {
                                              if ((logItem.logType ==
                                                      LogType.CREATE_USER) ||
                                                  (logItem.logType ==
                                                      LogType.UPDATE_USER)) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .accent2;
                                              } else if ((logItem.logType ==
                                                      LogType
                                                          .CREATE_INVESTMENT_DATA) ||
                                                  (logItem.logType ==
                                                      LogType
                                                          .UPDATE_INVESTMENT_DATA)) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .accent3;
                                              } else if (logItem.logType ==
                                                  LogType.LOGIN) {
                                                return Color(0xFF00FF8A);
                                              } else if (logItem.logType ==
                                                  LogType.LOGOUT) {
                                                return Color(0xFFFF343E);
                                              } else if (logItem.logType ==
                                                  LogType.EDIT_PROFILE) {
                                                return Color(0xFF006AFF);
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .accent4;
                                              }
                                            }(),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 10.0, 20.0, 10.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  logItem.logType?.name,
                                                  'N/A',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: () {
                                                            if ((logItem.logType ==
                                                                    LogType
                                                                        .CREATE_USER) ||
                                                                (logItem.logType ==
                                                                    LogType
                                                                        .UPDATE_USER)) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText;
                                                            } else if ((logItem
                                                                        .logType ==
                                                                    LogType
                                                                        .CREATE_INVESTMENT_DATA) ||
                                                                (logItem.logType ==
                                                                    LogType
                                                                        .UPDATE_INVESTMENT_DATA)) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary;
                                                            } else if (logItem
                                                                    .logType ==
                                                                LogType.LOGIN) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText;
                                                            } else if (logItem
                                                                    .logType ==
                                                                LogType
                                                                    .LOGOUT) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary;
                                                            } else if (logItem
                                                                    .logType ==
                                                                LogType
                                                                    .EDIT_PROFILE) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary;
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary;
                                                            }
                                                          }(),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                  ].divide(SizedBox(width: 25.0)),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
