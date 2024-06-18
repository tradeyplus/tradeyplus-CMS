import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/profile/profile_widget.dart';
import '/components/used_com/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'main_customer_list_model.dart';
export 'main_customer_list_model.dart';

class MainCustomerListWidget extends StatefulWidget {
  const MainCustomerListWidget({super.key});

  @override
  State<MainCustomerListWidget> createState() => _MainCustomerListWidgetState();
}

class _MainCustomerListWidgetState extends State<MainCustomerListWidget>
    with TickerProviderStateMixin {
  late MainCustomerListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainCustomerListModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Main_customerList'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MAIN_CUSTOMER_LIST_Main_customerList_ON_');
      _model.isloaded = false;
      setState(() {});
      _model.userQueryList = await queryUsersRecordOnce();
      _model.listOfUserDocs =
          _model.userQueryList!.toList().cast<UsersRecord>();
      setState(() {});
    });

    _model.searchorderTextController ??= TextEditingController();
    _model.searchorderFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 180.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 180.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 180.0.ms,
            duration: 600.0.ms,
            begin: Offset(20.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(40.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(40.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 180.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 180.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 180.0.ms,
            duration: 600.0.ms,
            begin: Offset(20.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(40.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(40.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) =>
            usersRecord.orderBy('created_time', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRecord> mainCustomerListUsersRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: !isWeb
                ? AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    automaticallyImplyLeading: false,
                    actions: [],
                    centerTitle: false,
                    elevation: 0.0,
                  )
                : null,
            body: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  wrapWithModel(
                    model: _model.webNavModel,
                    updateCallback: () => setState(() {}),
                    child: WebNavWidget(
                      selectedNav: 1,
                    ),
                  ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width < kBreakpointSmall
                                ? 10.0
                                : 50.0,
                            0.0,
                          ),
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width < kBreakpointSmall
                                ? 44.0
                                : 50.0,
                            0.0,
                          ),
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width < kBreakpointSmall
                                ? 10.0
                                : 50.0,
                            0.0,
                          ),
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width < kBreakpointSmall
                                ? 34.0
                                : 0.0,
                            0.0,
                          )),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'n99lg1qh' /* Customers */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize:
                                              MediaQuery.sizeOf(context).width <
                                                      kBreakpointSmall
                                                  ? 21.0
                                                  : 35.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.profileModel,
                                  updateCallback: () => setState(() {}),
                                  child: ProfileWidget(),
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 30.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.easeInOut,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              1.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 5.0
                                                          : 15.0,
                                                      0.0,
                                                    ),
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 5.0
                                                          : 15.0,
                                                      0.0,
                                                    ),
                                                    0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 40.0
                                                          : 100.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 40.0
                                                          : 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Icons.groups_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 18.0
                                                          : 50.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                                .width <
                                                            kBreakpointSmall
                                                        ? 8.0
                                                        : 22.0,
                                                    0.0,
                                                  )),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'x7g0vd0z' /* Total Investors */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                  fontSize: MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall
                                                                      ? 10.0
                                                                      : 14.0,
                                                                  letterSpacing:
                                                                      1.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'textOnPageLoadAnimation1']!),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          mainCustomerListUsersRecordList
                                                              .where((e) =>
                                                                  e.userRole ==
                                                                  UserRole
                                                                      .INVESTOR)
                                                              .toList()
                                                              .length
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall
                                                                    ? 18.0
                                                                    : 30.0,
                                                                letterSpacing:
                                                                    1.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'textOnPageLoadAnimation2']!),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          if (((mainCustomerListUsersRecordList
                                                                          .where((e) =>
                                                                              (dateTimeFormat(
                                                                                    'MM',
                                                                                    e.createdTime,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ) ==
                                                                                  dateTimeFormat(
                                                                                    'MM',
                                                                                    getCurrentTimestamp,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  )) &&
                                                                              (e.userRole == UserRole.INVESTOR))
                                                                          .toList()
                                                                          .length -
                                                                      mainCustomerListUsersRecordList
                                                                          .where((e) =>
                                                                              (dateTimeFormat(
                                                                                    'MM',
                                                                                    e.createdTime,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ) ==
                                                                                  (DateTime.now().subtract(Duration(days: 30)).month.toString().padLeft(2, '0'))) &&
                                                                              (e.userRole == UserRole.INVESTOR))
                                                                          .toList()
                                                                          .length) /
                                                                  mainCustomerListUsersRecordList
                                                                      .where((e) =>
                                                                          (dateTimeFormat(
                                                                                'MM',
                                                                                e.createdTime,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ) ==
                                                                              (DateTime.now().subtract(Duration(days: 30)).month.toString().padLeft(2, '0'))) &&
                                                                          (e.userRole == UserRole.INVESTOR))
                                                                      .toList()
                                                                      .length) <
                                                              0.0)
                                                            Icon(
                                                              Icons
                                                                  .arrow_downward_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .falling,
                                                              size: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall
                                                                  ? 14.0
                                                                  : 20.0,
                                                            ),
                                                          if (((mainCustomerListUsersRecordList
                                                                          .where((e) =>
                                                                              (dateTimeFormat(
                                                                                    'MM',
                                                                                    e.createdTime,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ) ==
                                                                                  dateTimeFormat(
                                                                                    'MM',
                                                                                    getCurrentTimestamp,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  )) &&
                                                                              (e.userRole == UserRole.INVESTOR))
                                                                          .toList()
                                                                          .length -
                                                                      mainCustomerListUsersRecordList
                                                                          .where((e) =>
                                                                              (dateTimeFormat(
                                                                                    'MM',
                                                                                    e.createdTime,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ) ==
                                                                                  (DateTime.now().subtract(Duration(days: 30)).month.toString().padLeft(2, '0'))) &&
                                                                              (e.userRole == UserRole.INVESTOR))
                                                                          .toList()
                                                                          .length) /
                                                                  mainCustomerListUsersRecordList
                                                                      .where((e) =>
                                                                          (dateTimeFormat(
                                                                                'MM',
                                                                                e.createdTime,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ) ==
                                                                              (DateTime.now().subtract(Duration(days: 30)).month.toString().padLeft(2, '0'))) &&
                                                                          (e.userRole == UserRole.INVESTOR))
                                                                      .toList()
                                                                      .length) >=
                                                              0.0)
                                                            Icon(
                                                              Icons
                                                                  .arrow_upward_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .rising,
                                                              size: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall
                                                                  ? 14.0
                                                                  : 20.0,
                                                            ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      formatNumber(
                                                                        (int oldInvestors,
                                                                                int currentInvestors) {
                                                                          return (oldInvestors != 0)
                                                                              ? (currentInvestors - oldInvestors) / oldInvestors
                                                                              : 0;
                                                                        }(
                                                                            valueOrDefault<int>(
                                                                              mainCustomerListUsersRecordList
                                                                                  .where((e) =>
                                                                                      (dateTimeFormat(
                                                                                            'MM',
                                                                                            e.createdTime,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ) ==
                                                                                          (DateTime.now().subtract(Duration(days: 30)).month.toString().padLeft(2, '0'))) &&
                                                                                      (e.userRole == UserRole.INVESTOR))
                                                                                  .toList()
                                                                                  .length,
                                                                              0,
                                                                            ),
                                                                            valueOrDefault<int>(
                                                                              mainCustomerListUsersRecordList
                                                                                  .where((e) =>
                                                                                      (dateTimeFormat(
                                                                                            'MM',
                                                                                            e.createdTime,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ) ==
                                                                                          dateTimeFormat(
                                                                                            'MM',
                                                                                            getCurrentTimestamp,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          )) &&
                                                                                      (e.userRole == UserRole.INVESTOR))
                                                                                  .toList()
                                                                                  .length,
                                                                              0,
                                                                            )),
                                                                        formatType:
                                                                            FormatType.percent,
                                                                      ),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color: ((mainCustomerListUsersRecordList
                                                                                              .where((e) =>
                                                                                                  (dateTimeFormat(
                                                                                                        'MM',
                                                                                                        e.createdTime,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ) ==
                                                                                                      dateTimeFormat(
                                                                                                        'MM',
                                                                                                        getCurrentTimestamp,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      )) &&
                                                                                                  (e.userRole == UserRole.INVESTOR))
                                                                                              .toList()
                                                                                              .length -
                                                                                          mainCustomerListUsersRecordList
                                                                                              .where((e) =>
                                                                                                  (dateTimeFormat(
                                                                                                        'MM',
                                                                                                        e.createdTime,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ) ==
                                                                                                      (DateTime.now().subtract(Duration(days: 30)).month.toString().padLeft(2, '0'))) &&
                                                                                                  (e.userRole == UserRole.INVESTOR))
                                                                                              .toList()
                                                                                              .length) /
                                                                                      mainCustomerListUsersRecordList
                                                                                          .where((e) =>
                                                                                              (dateTimeFormat(
                                                                                                    'MM',
                                                                                                    e.createdTime,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  ) ==
                                                                                                  (DateTime.now().subtract(Duration(days: 30)).month.toString().padLeft(2, '0'))) &&
                                                                                              (e.userRole == UserRole.INVESTOR))
                                                                                          .toList()
                                                                                          .length) >=
                                                                                  0.0
                                                                              ? FlutterFlowTheme.of(context).rising
                                                                              : FlutterFlowTheme.of(context).falling,
                                                                          fontSize: MediaQuery.sizeOf(context).width < kBreakpointSmall
                                                                              ? 10.0
                                                                              : 12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '99tnqf20' /*  this month */,
                                                                    ),
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Tajawal',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize: MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall
                                                                          ? 10.0
                                                                          : 12.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .rising,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'rowOnPageLoadAnimation1']!),
                                                    ].divide(
                                                        SizedBox(height: 5.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 90.0,
                                            child: VerticalDivider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 5.0
                                                          : 15.0,
                                                      0.0,
                                                    ),
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 5.0
                                                          : 15.0,
                                                      0.0,
                                                    ),
                                                    0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 40.0
                                                          : 100.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 40.0
                                                          : 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Icons.person,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 18.0
                                                          : 50.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                                .width <
                                                            kBreakpointSmall
                                                        ? 8.0
                                                        : 22.0,
                                                    0.0,
                                                  )),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'xgzv1eny' /* Total members */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize: MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall
                                                                      ? 10.0
                                                                      : 14.0,
                                                                  letterSpacing:
                                                                      1.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'textOnPageLoadAnimation3']!),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          mainCustomerListUsersRecordList
                                                              .where((e) =>
                                                                  e.userRole !=
                                                                  UserRole
                                                                      .ADMINISTRATOR)
                                                              .toList()
                                                              .length
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall
                                                                    ? 18.0
                                                                    : 30.0,
                                                                letterSpacing:
                                                                    1.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'textOnPageLoadAnimation4']!),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          if (((mainCustomerListUsersRecordList
                                                                          .where((e) =>
                                                                              dateTimeFormat(
                                                                                'MM',
                                                                                e.createdTime,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ) ==
                                                                              dateTimeFormat(
                                                                                'MM',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))
                                                                          .toList()
                                                                          .length -
                                                                      mainCustomerListUsersRecordList
                                                                          .where((e) =>
                                                                              dateTimeFormat(
                                                                                'MM',
                                                                                e.createdTime,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ) ==
                                                                              (DateTime.now().subtract(Duration(days: 30)).month.toString().padLeft(2, '0')))
                                                                          .toList()
                                                                          .length) /
                                                                  mainCustomerListUsersRecordList
                                                                      .where((e) =>
                                                                          dateTimeFormat(
                                                                            'MM',
                                                                            e.createdTime,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ) ==
                                                                          (DateTime.now().subtract(Duration(days: 30)).month.toString().padLeft(2, '0')))
                                                                      .toList()
                                                                      .length) <
                                                              0.0)
                                                            Icon(
                                                              Icons
                                                                  .arrow_downward_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .falling,
                                                              size: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall
                                                                  ? 14.0
                                                                  : 20.0,
                                                            ),
                                                          if (((mainCustomerListUsersRecordList
                                                                          .where((e) =>
                                                                              dateTimeFormat(
                                                                                'MM',
                                                                                e.createdTime,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ) ==
                                                                              dateTimeFormat(
                                                                                'MM',
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ))
                                                                          .toList()
                                                                          .length -
                                                                      mainCustomerListUsersRecordList
                                                                          .where((e) =>
                                                                              dateTimeFormat(
                                                                                'MM',
                                                                                e.createdTime,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ) ==
                                                                              (DateTime.now().subtract(Duration(days: 30)).month.toString().padLeft(2, '0')))
                                                                          .toList()
                                                                          .length) /
                                                                  mainCustomerListUsersRecordList
                                                                      .where((e) =>
                                                                          dateTimeFormat(
                                                                            'MM',
                                                                            e.createdTime,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ) ==
                                                                          (DateTime.now().subtract(Duration(days: 30)).month.toString().padLeft(2, '0')))
                                                                      .toList()
                                                                      .length) >=
                                                              0.0)
                                                            Icon(
                                                              Icons
                                                                  .arrow_upward_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .rising,
                                                              size: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall
                                                                  ? 14.0
                                                                  : 20.0,
                                                            ),
                                                          RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: valueOrDefault<
                                                                      String>(
                                                                    formatNumber(
                                                                      (int oldMembers,
                                                                              int
                                                                                  currentMembers) {
                                                                        return (oldMembers !=
                                                                                0)
                                                                            ? (currentMembers - oldMembers) /
                                                                                oldMembers
                                                                            : 0;
                                                                      }(
                                                                          valueOrDefault<
                                                                              int>(
                                                                            mainCustomerListUsersRecordList
                                                                                .where((e) =>
                                                                                    dateTimeFormat(
                                                                                      'MM',
                                                                                      e.createdTime,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ) ==
                                                                                    (DateTime.now().subtract(Duration(days: 30)).month.toString().padLeft(2, '0')))
                                                                                .toList()
                                                                                .length,
                                                                            0,
                                                                          ),
                                                                          valueOrDefault<
                                                                              int>(
                                                                            mainCustomerListUsersRecordList
                                                                                .where((e) =>
                                                                                    dateTimeFormat(
                                                                                      'MM',
                                                                                      e.createdTime,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ) ==
                                                                                    dateTimeFormat(
                                                                                      'MM',
                                                                                      getCurrentTimestamp,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ))
                                                                                .toList()
                                                                                .length,
                                                                            0,
                                                                          )),
                                                                      formatType:
                                                                          FormatType
                                                                              .percent,
                                                                    ),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: ((mainCustomerListUsersRecordList
                                                                                            .where((e) =>
                                                                                                dateTimeFormat(
                                                                                                  'MM',
                                                                                                  e.createdTime,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ) ==
                                                                                                dateTimeFormat(
                                                                                                  'MM',
                                                                                                  getCurrentTimestamp,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ))
                                                                                            .toList()
                                                                                            .length -
                                                                                        mainCustomerListUsersRecordList
                                                                                            .where((e) =>
                                                                                                dateTimeFormat(
                                                                                                  'MM',
                                                                                                  e.createdTime,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ) ==
                                                                                                (DateTime.now().subtract(Duration(days: 30)).month.toString().padLeft(2, '0')))
                                                                                            .toList()
                                                                                            .length) /
                                                                                    mainCustomerListUsersRecordList
                                                                                        .where((e) =>
                                                                                            dateTimeFormat(
                                                                                              'MM',
                                                                                              e.createdTime,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ) ==
                                                                                            (DateTime.now().subtract(Duration(days: 30)).month.toString().padLeft(2, '0')))
                                                                                        .toList()
                                                                                        .length) >=
                                                                                0.0
                                                                            ? FlutterFlowTheme.of(context).rising
                                                                            : FlutterFlowTheme.of(context).falling,
                                                                        fontSize: MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall
                                                                            ? 10.0
                                                                            : 12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '4uqqoz51' /*  this month */,
                                                                  ),
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Tajawal',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize: MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall
                                                                        ? 10.0
                                                                        : 12.0,
                                                                  ),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize: MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall
                                                                        ? 10.0
                                                                        : 14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'rowOnPageLoadAnimation2']!),
                                                    ].divide(
                                                        SizedBox(height: 5.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation']!),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 4.0, 10.0),
                                child: Container(
                                  height: 450.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          1.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '8blmisjx' /* Our Users */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall
                                                            ? 21.0
                                                            : 35.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall
                                                        ? 150.0
                                                        : 250.0,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .searchorderTextController,
                                                                  focusNode: _model
                                                                      .searchorderFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.searchorderTextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                    () => setState(
                                                                        () {}),
                                                                  ),
                                                                  onFieldSubmitted:
                                                                      (_) async {
                                                                    logFirebaseEvent(
                                                                        'MAIN_CUSTOMER_LIST_searchorder_ON_TEXTFI');
                                                                    safeSetState(
                                                                        () {
                                                                      _model.simpleSearchResults =
                                                                          TextSearch(
                                                                        _model
                                                                            .listOfUserDocs
                                                                            .map(
                                                                              (record) => TextSearchItem.fromTerms(record, [
                                                                                record.displayName!,
                                                                                record.email!,
                                                                                record.phoneNumber!,
                                                                                record.nationality!
                                                                              ]),
                                                                            )
                                                                            .toList(),
                                                                      ).search(_model.searchorderTextController.text).map((r) => r.object).toList();
                                                                      ;
                                                                    });
                                                                    _model.isloaded =
                                                                        true;
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'hdy4xx49' /* Search Order */,
                                                                    ),
                                                                    enabledBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            3.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize: MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall
                                                                            ? 12.0
                                                                            : 18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  validator: _model
                                                                      .searchorderTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 47.0,
                                                            height: 94.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          9.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .search_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ))
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'MAIN_CUSTOMER_LIST_CREATE_USERS_BTN_ON_T');

                                                        context.pushNamed(
                                                            'User_Entry');
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'zr9zfu53' /* Create Users */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 44.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        hoverBorderSide:
                                                            BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                        hoverTextColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        hoverElevation: 0.0,
                                                      ),
                                                    ),
                                                ].divide(SizedBox(width: 15.0)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (!_model.isloaded)
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<UsersRecord>>(
                                                stream: queryUsersRecord(
                                                  queryBuilder: (usersRecord) =>
                                                      usersRecord.orderBy(
                                                          'created_time',
                                                          descending: true),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UsersRecord>
                                                      containerUsersRecordList =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 470.0,
                                                    constraints: BoxConstraints(
                                                      maxHeight: 470.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final userDetail = _model
                                                                .userQueryList
                                                                ?.toList() ??
                                                            [];
                                                        return FlutterFlowDataTable<
                                                            UsersRecord>(
                                                          controller: _model
                                                              .usernosearchController1,
                                                          data: userDetail,
                                                          columnsBuilder:
                                                              (onSortChanged) =>
                                                                  [
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ncfshgie' /* Name */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize: MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall
                                                                            ? 12.0
                                                                            : 16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '3uyt5hzr' /* Phone Number */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize: MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall
                                                                            ? 12.0
                                                                            : 16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'm20y3rfi' /* Nationality */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize: MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall
                                                                            ? 12.0
                                                                            : 16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '8k5leo4e' /* Email */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize: MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall
                                                                            ? 12.0
                                                                            : 16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ppqw2jdk' /* Package */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize: MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall
                                                                            ? 12.0
                                                                            : 16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'yo0rira3' /* Edit */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize: MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall
                                                                            ? 12.0
                                                                            : 16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                          dataRowBuilder:
                                                              (userDetailItem,
                                                                      userDetailIndex,
                                                                      selected,
                                                                      onSelectChanged) =>
                                                                  DataRow(
                                                            color:
                                                                MaterialStateProperty
                                                                    .all(
                                                              userDetailIndex %
                                                                          2 ==
                                                                      0
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                            ),
                                                            cells: [
                                                              Text(
                                                                userDetailItem
                                                                    .displayName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize: MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall
                                                                          ? 10.0
                                                                          : 14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Text(
                                                                userDetailItem
                                                                    .phoneNumber,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize: MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall
                                                                          ? 10.0
                                                                          : 14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Text(
                                                                userDetailItem
                                                                    .nationality,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize: MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall
                                                                          ? 10.0
                                                                          : 14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Text(
                                                                userDetailItem
                                                                    .email,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize: MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall
                                                                          ? 10.0
                                                                          : 14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  userDetailItem
                                                                      .package
                                                                      ?.name,
                                                                  'N/A',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize: MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall
                                                                          ? 10.0
                                                                          : 14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                borderRadius:
                                                                    9.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                hoverColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                hoverIconColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                icon: Icon(
                                                                  Icons
                                                                      .edit_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'MAIN_CUSTOMER_LIST_edit_outlined_ICN_ON_');

                                                                  context
                                                                      .pushNamed(
                                                                    'User_Entry',
                                                                    queryParameters:
                                                                        {
                                                                      'userRef':
                                                                          serializeParam(
                                                                        userDetailItem
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                              ),
                                                            ]
                                                                .map((c) =>
                                                                    DataCell(c))
                                                                .toList(),
                                                          ),
                                                          paginated: true,
                                                          selectable: false,
                                                          hidePaginator: false,
                                                          showFirstLastButtons:
                                                              false,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          minWidth: 700.0,
                                                          headingRowHeight:
                                                              60.0,
                                                          dataRowHeight: 60.0,
                                                          headingRowColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      14.0),
                                                          addHorizontalDivider:
                                                              true,
                                                          addTopAndBottomDivider:
                                                              false,
                                                          hideDefaultHorizontalDivider:
                                                              false,
                                                          horizontalDividerColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                          horizontalDividerThickness:
                                                              1.0,
                                                          addVerticalDivider:
                                                              false,
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        if (_model.isloaded)
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 470.0,
                                                constraints: BoxConstraints(
                                                  maxHeight: 470.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final userDetail = _model
                                                        .simpleSearchResults
                                                        .toList();
                                                    return FlutterFlowDataTable<
                                                        UsersRecord>(
                                                      controller: _model
                                                          .usernosearchController2,
                                                      data: userDetail,
                                                      columnsBuilder:
                                                          (onSortChanged) => [
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'voobws8t' /* Name */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize: MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall
                                                                        ? 12.0
                                                                        : 16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '0th1hkvj' /* Phone Number */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize: MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall
                                                                        ? 12.0
                                                                        : 16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '82za59cf' /* Nationality */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize: MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall
                                                                        ? 12.0
                                                                        : 16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          onSort: onSortChanged,
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'u63u6y9h' /* Email */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize: MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall
                                                                        ? 12.0
                                                                        : 16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          onSort: onSortChanged,
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'u5w279jc' /* Package */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize: MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall
                                                                        ? 12.0
                                                                        : 16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          onSort: onSortChanged,
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '18x6mxif' /* Edit */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize: MediaQuery.sizeOf(context).width <
                                                                            kBreakpointSmall
                                                                        ? 12.0
                                                                        : 16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                      dataRowBuilder: (userDetailItem,
                                                              userDetailIndex,
                                                              selected,
                                                              onSelectChanged) =>
                                                          DataRow(
                                                        color:
                                                            MaterialStateProperty
                                                                .all(
                                                          userDetailIndex % 2 ==
                                                                  0
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryBackground
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                        ),
                                                        cells: [
                                                          Text(
                                                            userDetailItem
                                                                .displayName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall
                                                                      ? 10.0
                                                                      : 14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Text(
                                                            userDetailItem
                                                                .phoneNumber,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall
                                                                      ? 10.0
                                                                      : 14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Text(
                                                            userDetailItem
                                                                .nationality,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall
                                                                      ? 10.0
                                                                      : 14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Text(
                                                            userDetailItem
                                                                .email,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall
                                                                      ? 10.0
                                                                      : 14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              userDetailItem
                                                                  .package
                                                                  ?.name,
                                                              'N/A',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall
                                                                      ? 10.0
                                                                      : 14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            borderRadius: 9.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            hoverColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            hoverIconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            icon: Icon(
                                                              Icons
                                                                  .edit_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'MAIN_CUSTOMER_LIST_edit_outlined_ICN_ON_');

                                                              context.pushNamed(
                                                                'User_Entry',
                                                                queryParameters:
                                                                    {
                                                                  'userRef':
                                                                      serializeParam(
                                                                    userDetailItem
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                          ),
                                                        ]
                                                            .map((c) =>
                                                                DataCell(c))
                                                            .toList(),
                                                      ),
                                                      paginated: true,
                                                      selectable: false,
                                                      hidePaginator: false,
                                                      showFirstLastButtons:
                                                          false,
                                                      width: double.infinity,
                                                      minWidth: 700.0,
                                                      headingRowHeight: 60.0,
                                                      dataRowHeight: 60.0,
                                                      headingRowColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      sortIconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      addHorizontalDivider:
                                                          true,
                                                      addTopAndBottomDivider:
                                                          false,
                                                      hideDefaultHorizontalDivider:
                                                          false,
                                                      horizontalDividerColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      horizontalDividerThickness:
                                                          1.0,
                                                      addVerticalDivider: false,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'MAIN_CUSTOMER_LIST_CREATE_USERS_BTN_ON_T');

                                              context.pushNamed('User_Entry');
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '5rrn7kk7' /* Create Users */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 44.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              hoverBorderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              hoverTextColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              hoverElevation: 0.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
