// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dio/dio.dart';

import 'package:mime_type/mime_type.dart';

import 'dart:html' as html;

Future downloadSample(String? url) async {
  Dio dio = Dio();

  try {
// Fetch the file

    Response response =
        await dio.get(url!, options: Options(responseType: ResponseType.bytes));

// Generate a unique file name

    String? ext = (url!.split(".").last);

    String? extension = (ext.split("?").first);

    String fileName =
        'downloaded_file_${DateTime.now().millisecondsSinceEpoch.toString()}.$extension';

// Create a download link

    final anchor = html.AnchorElement(
        href: html.Url.createObjectUrlFromBlob(html.Blob([response.data])));

    anchor.download = fileName;

    anchor.style.display = 'none';

// Append the link to the body

    html.document.body!.children.add(anchor);

// Trigger a click on the link

    anchor.click();

// Remove the link from the body

    html.document.body!.children.remove(anchor);

    print('File downloaded');
  } catch (e) {
    print('Error downloading file: $e');
  }
}
