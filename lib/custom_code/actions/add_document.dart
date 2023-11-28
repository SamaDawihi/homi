// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future addDocument(
  DocumentRecord document,
  List<AttachmentRecord>? attachments,
) async {
  // Add your function code here!
  try {
    // Add the document to the Document collection
    final documentReference = await DocumentRecord.collection.add({
      'title': document.title,
      'createdAt': document.createdAt,
      'createdBy': document.createdBy,
      'document': document.document,
      'familyId': document.familyId,
    });
    print("document title ${document.title}");
    // Get the reference to the newly created document
    final documentId = documentReference.id;

    // Check if attachments is not null before processing
    if (attachments != null) {
      print("Attachements isnt null");
      print("Attachements number is ${attachments.length}");
      // Add each attachment to the Attachment subcollection of the document
      for (final attachment in attachments) {
        print("Attachements name is ${attachment.name}");
        await DocumentRecord.collection
            .doc(documentId)
            .collection('Attachment')
            .add({
          'name': attachment.name,
          'url': attachment.url,
        });
      }
    }

    print('Document and attachments added successfully!');
  } catch (e) {
    print('Error adding document with attachments: $e');
  }
}
