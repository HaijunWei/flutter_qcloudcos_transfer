import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/messages.dart',
  objcHeaderOut: 'ios/Classes/Messages.h',
  objcSourceOut: 'ios/Classes/Messages.m',
  objcOptions: ObjcOptions(prefix: 'HJ'),
  javaOut:
      'android/src/main/kotlin/com/haijunwei/flutter_qcloudcos_transfer/Messages.java',
  javaOptions: JavaOptions(package: 'com.haijunwei.flutter_qcloudcos_transfer'),
))
class QCloudCosInitOptions {
  final String regionName;

  QCloudCosInitOptions({required this.regionName});
}

class QCloudCosUpdateOptions {
  final String tempUploadPath;
  final String bucket;
  final int startTime;
  final int expiredTime;
  final QCloudCosCredentials credentials;
  final String filePath;
  final String fileName;

  QCloudCosUpdateOptions({
    required this.tempUploadPath,
    required this.bucket,
    required this.startTime,
    required this.expiredTime,
    required this.credentials,
    required this.filePath,
    required this.fileName,
  });
}

class QCloudCosCredentials {
  final String sessionToken;
  final String tmpSecretId;
  final String tmpSecretKey;

  QCloudCosCredentials({
    required this.sessionToken,
    required this.tmpSecretId,
    required this.tmpSecretKey,
  });
}

class QCloudCosUpdateResult {
  final String path;

  QCloudCosUpdateResult({
    required this.path,
  });
}

@HostApi()
abstract class QCloudCosApi {
  void initialize(QCloudCosInitOptions options);
  @async
  QCloudCosUpdateResult upload(QCloudCosUpdateOptions options);
  @async
  QCloudCosUpdateResult multipartUpload(QCloudCosUpdateOptions options);
}
