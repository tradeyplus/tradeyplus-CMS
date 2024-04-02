import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/used_com/notification/notification_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/user_detail/edit_admin/modal_profile_details/modal_profile_details_widget.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Stack widget.
  LogRecord? recentnotification;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
