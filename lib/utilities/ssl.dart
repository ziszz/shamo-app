import 'dart:io';

import 'package:flutter/services.dart';

Future<HttpClient> getHttpClient() async {
  final sslCert = await rootBundle.load("assets/certficate/certificate.crt");
  final securityContext = SecurityContext(withTrustedRoots: false);
  securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());

  final httpClient = HttpClient(context: securityContext);
  httpClient.badCertificateCallback =
      (X509Certificate cert, String host, int port) => false;

  return httpClient;
}
