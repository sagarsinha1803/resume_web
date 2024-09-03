import 'package:firebase_storage/firebase_storage.dart';
import 'dart:html' as html;
import 'package:logging/logging.dart';

final logger = Logger('MyLogger');

void downloadResume() async {
  try {
    FirebaseStorage storage = FirebaseStorage.instance;
    String downloadURL = await storage.ref('files/my_cv.pdf').getDownloadURL();
    final response = await html.HttpRequest.request(
      downloadURL,
      responseType: 'blob',
      method: 'GET',
    );
    final blob = html.Blob([response.response]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute('download', 'sagar-sinha-resume.pdf')
      ..click();
    html.Url.revokeObjectUrl(url);
  } catch (e) {
    logger.severe('Exception occur while downloading the file. Error Msg: $e');
  }
}
