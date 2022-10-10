#import "FlutterQcloudcosTransferPlugin.h"
#if __has_include(<flutter_qcloudcos_transfer/flutter_qcloudcos_transfer-Swift.h>)
#import <flutter_qcloudcos_transfer/flutter_qcloudcos_transfer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_qcloudcos_transfer-Swift.h"
#endif

@implementation FlutterQcloudcosTransferPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterQcloudcosTransferPlugin registerWithRegistrar:registrar];
}
@end
