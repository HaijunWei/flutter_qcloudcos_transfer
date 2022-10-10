export 'src/messages.dart';

import 'src/messages.dart';

class QCloudCosTransfer {
  static final _api = QCloudCosApi();

  static void initialize(QCloudCosInitOptions options) {
    _api.initialize(options);
  }

  static Future<QCloudCosUpdateResult> update(QCloudCosUpdateOptions options) {
    return _api.upload(options);
  }

  static Future<QCloudCosUpdateResult> multipartUpload(
      QCloudCosUpdateOptions options) {
    return _api.multipartUpload(options);
  }
}
