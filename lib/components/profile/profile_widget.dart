import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/used_com/notification/notification_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/user_detail/edit_admin/modal_profile_details/modal_profile_details_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 80.0,
          decoration: BoxDecoration(),
          child: Builder(
            builder: (context) => InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('PROFILE_COMP_Stack_mhnaurrm_ON_TAP');
                await showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: NotificationWidget(),
                    );
                  },
                ).then((value) => setState(() {}));

                _model.recentnotification = await queryLogRecordOnce(
                  queryBuilder: (logRecord) =>
                      logRecord.orderBy('log_time', descending: true),
                  singleRecord: true,
                ).then((s) => s.firstOrNull);

                await currentUserReference!.update(createUsersRecordData(
                  lastReadNotification: _model.recentnotification?.logTime,
                ));

                setState(() {});
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.bell,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size:
                            MediaQuery.sizeOf(context).width < kBreakpointSmall
                                ? 21.0
                                : 30.0,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.56, -0.81),
                      child: AuthUserStreamWidget(
                        builder: (context) => StreamBuilder<List<LogRecord>>(
                          stream: queryLogRecord(
                            queryBuilder: (logRecord) => logRecord.where(
                              'log_time',
                              isGreaterThan:
                                  currentUserDocument?.lastReadNotification,
                            ),
                            singleRecord: true,
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
                            List<LogRecord> containerLogRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final containerLogRecord =
                                containerLogRecordList.isNotEmpty
                                    ? containerLogRecordList.first
                                    : null;
                            return Container(
                              width: MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall
                                  ? 12.0
                                  : 15.0,
                              height: MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall
                                  ? 12.0
                                  : 15.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                shape: BoxShape.circle,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(),
          child: Visibility(
            visible: responsiveVisibility(
              context: context,
              phone: false,
            ),
            child: Builder(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('PROFILE_COMP_Row_ngublnap_ON_TAP');
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: ModalProfileDetailsWidget(
                          emai: currentUserEmail,
                          name: currentUserDisplayName,
                          image: valueOrDefault<String>(
                            currentUserPhoto,
                            'N/A',
                          ),
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 10.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Container(
                          width: 40.0,
                          height: 40.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            valueOrDefault<String>(
                              currentUserPhoto,
                              'https://picsum.photos/seed/909/600',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 30.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
