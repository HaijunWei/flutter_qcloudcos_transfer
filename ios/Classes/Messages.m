// Autogenerated from Pigeon (v3.2.7), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "Messages.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ?: [NSNull null]),
        @"message": (error.message ?: [NSNull null]),
        @"details": (error.details ?: [NSNull null]),
        };
  }
  return @{
      @"result": (result ?: [NSNull null]),
      @"error": errorDict,
      };
}
static id GetNullableObject(NSDictionary* dict, id key) {
  id result = dict[key];
  return (result == [NSNull null]) ? nil : result;
}
static id GetNullableObjectAtIndex(NSArray* array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}


@interface HJQCloudCosInitOptions ()
+ (HJQCloudCosInitOptions *)fromMap:(NSDictionary *)dict;
+ (nullable HJQCloudCosInitOptions *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface HJQCloudCosUpdateOptions ()
+ (HJQCloudCosUpdateOptions *)fromMap:(NSDictionary *)dict;
+ (nullable HJQCloudCosUpdateOptions *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface HJQCloudCosCredentials ()
+ (HJQCloudCosCredentials *)fromMap:(NSDictionary *)dict;
+ (nullable HJQCloudCosCredentials *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface HJQCloudCosUpdateResult ()
+ (HJQCloudCosUpdateResult *)fromMap:(NSDictionary *)dict;
+ (nullable HJQCloudCosUpdateResult *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation HJQCloudCosInitOptions
+ (instancetype)makeWithRegionName:(NSString *)regionName {
  HJQCloudCosInitOptions* pigeonResult = [[HJQCloudCosInitOptions alloc] init];
  pigeonResult.regionName = regionName;
  return pigeonResult;
}
+ (HJQCloudCosInitOptions *)fromMap:(NSDictionary *)dict {
  HJQCloudCosInitOptions *pigeonResult = [[HJQCloudCosInitOptions alloc] init];
  pigeonResult.regionName = GetNullableObject(dict, @"regionName");
  NSAssert(pigeonResult.regionName != nil, @"");
  return pigeonResult;
}
+ (nullable HJQCloudCosInitOptions *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [HJQCloudCosInitOptions fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"regionName" : (self.regionName ?: [NSNull null]),
  };
}
@end

@implementation HJQCloudCosUpdateOptions
+ (instancetype)makeWithTempUploadPath:(NSString *)tempUploadPath
    bucket:(NSString *)bucket
    startTime:(NSNumber *)startTime
    expiredTime:(NSNumber *)expiredTime
    credentials:(HJQCloudCosCredentials *)credentials
    filePath:(NSString *)filePath
    fileName:(NSString *)fileName {
  HJQCloudCosUpdateOptions* pigeonResult = [[HJQCloudCosUpdateOptions alloc] init];
  pigeonResult.tempUploadPath = tempUploadPath;
  pigeonResult.bucket = bucket;
  pigeonResult.startTime = startTime;
  pigeonResult.expiredTime = expiredTime;
  pigeonResult.credentials = credentials;
  pigeonResult.filePath = filePath;
  pigeonResult.fileName = fileName;
  return pigeonResult;
}
+ (HJQCloudCosUpdateOptions *)fromMap:(NSDictionary *)dict {
  HJQCloudCosUpdateOptions *pigeonResult = [[HJQCloudCosUpdateOptions alloc] init];
  pigeonResult.tempUploadPath = GetNullableObject(dict, @"tempUploadPath");
  NSAssert(pigeonResult.tempUploadPath != nil, @"");
  pigeonResult.bucket = GetNullableObject(dict, @"bucket");
  NSAssert(pigeonResult.bucket != nil, @"");
  pigeonResult.startTime = GetNullableObject(dict, @"startTime");
  NSAssert(pigeonResult.startTime != nil, @"");
  pigeonResult.expiredTime = GetNullableObject(dict, @"expiredTime");
  NSAssert(pigeonResult.expiredTime != nil, @"");
  pigeonResult.credentials = [HJQCloudCosCredentials nullableFromMap:GetNullableObject(dict, @"credentials")];
  NSAssert(pigeonResult.credentials != nil, @"");
  pigeonResult.filePath = GetNullableObject(dict, @"filePath");
  NSAssert(pigeonResult.filePath != nil, @"");
  pigeonResult.fileName = GetNullableObject(dict, @"fileName");
  NSAssert(pigeonResult.fileName != nil, @"");
  return pigeonResult;
}
+ (nullable HJQCloudCosUpdateOptions *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [HJQCloudCosUpdateOptions fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"tempUploadPath" : (self.tempUploadPath ?: [NSNull null]),
    @"bucket" : (self.bucket ?: [NSNull null]),
    @"startTime" : (self.startTime ?: [NSNull null]),
    @"expiredTime" : (self.expiredTime ?: [NSNull null]),
    @"credentials" : (self.credentials ? [self.credentials toMap] : [NSNull null]),
    @"filePath" : (self.filePath ?: [NSNull null]),
    @"fileName" : (self.fileName ?: [NSNull null]),
  };
}
@end

@implementation HJQCloudCosCredentials
+ (instancetype)makeWithSessionToken:(NSString *)sessionToken
    tmpSecretId:(NSString *)tmpSecretId
    tmpSecretKey:(NSString *)tmpSecretKey {
  HJQCloudCosCredentials* pigeonResult = [[HJQCloudCosCredentials alloc] init];
  pigeonResult.sessionToken = sessionToken;
  pigeonResult.tmpSecretId = tmpSecretId;
  pigeonResult.tmpSecretKey = tmpSecretKey;
  return pigeonResult;
}
+ (HJQCloudCosCredentials *)fromMap:(NSDictionary *)dict {
  HJQCloudCosCredentials *pigeonResult = [[HJQCloudCosCredentials alloc] init];
  pigeonResult.sessionToken = GetNullableObject(dict, @"sessionToken");
  NSAssert(pigeonResult.sessionToken != nil, @"");
  pigeonResult.tmpSecretId = GetNullableObject(dict, @"tmpSecretId");
  NSAssert(pigeonResult.tmpSecretId != nil, @"");
  pigeonResult.tmpSecretKey = GetNullableObject(dict, @"tmpSecretKey");
  NSAssert(pigeonResult.tmpSecretKey != nil, @"");
  return pigeonResult;
}
+ (nullable HJQCloudCosCredentials *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [HJQCloudCosCredentials fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"sessionToken" : (self.sessionToken ?: [NSNull null]),
    @"tmpSecretId" : (self.tmpSecretId ?: [NSNull null]),
    @"tmpSecretKey" : (self.tmpSecretKey ?: [NSNull null]),
  };
}
@end

@implementation HJQCloudCosUpdateResult
+ (instancetype)makeWithPath:(NSString *)path {
  HJQCloudCosUpdateResult* pigeonResult = [[HJQCloudCosUpdateResult alloc] init];
  pigeonResult.path = path;
  return pigeonResult;
}
+ (HJQCloudCosUpdateResult *)fromMap:(NSDictionary *)dict {
  HJQCloudCosUpdateResult *pigeonResult = [[HJQCloudCosUpdateResult alloc] init];
  pigeonResult.path = GetNullableObject(dict, @"path");
  NSAssert(pigeonResult.path != nil, @"");
  return pigeonResult;
}
+ (nullable HJQCloudCosUpdateResult *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [HJQCloudCosUpdateResult fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"path" : (self.path ?: [NSNull null]),
  };
}
@end

@interface HJQCloudCosApiCodecReader : FlutterStandardReader
@end
@implementation HJQCloudCosApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [HJQCloudCosCredentials fromMap:[self readValue]];
    
    case 129:     
      return [HJQCloudCosInitOptions fromMap:[self readValue]];
    
    case 130:     
      return [HJQCloudCosUpdateOptions fromMap:[self readValue]];
    
    case 131:     
      return [HJQCloudCosUpdateResult fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface HJQCloudCosApiCodecWriter : FlutterStandardWriter
@end
@implementation HJQCloudCosApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[HJQCloudCosCredentials class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[HJQCloudCosInitOptions class]]) {
    [self writeByte:129];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[HJQCloudCosUpdateOptions class]]) {
    [self writeByte:130];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[HJQCloudCosUpdateResult class]]) {
    [self writeByte:131];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface HJQCloudCosApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation HJQCloudCosApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[HJQCloudCosApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[HJQCloudCosApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *HJQCloudCosApiGetCodec() {
  static dispatch_once_t sPred = 0;
  static FlutterStandardMessageCodec *sSharedObject = nil;
  dispatch_once(&sPred, ^{
    HJQCloudCosApiCodecReaderWriter *readerWriter = [[HJQCloudCosApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}


void HJQCloudCosApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<HJQCloudCosApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.QCloudCosApi.initialize"
        binaryMessenger:binaryMessenger
        codec:HJQCloudCosApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(initializeOptions:error:)], @"HJQCloudCosApi api (%@) doesn't respond to @selector(initializeOptions:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        HJQCloudCosInitOptions *arg_options = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api initializeOptions:arg_options error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.QCloudCosApi.upload"
        binaryMessenger:binaryMessenger
        codec:HJQCloudCosApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(uploadOptions:completion:)], @"HJQCloudCosApi api (%@) doesn't respond to @selector(uploadOptions:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        HJQCloudCosUpdateOptions *arg_options = GetNullableObjectAtIndex(args, 0);
        [api uploadOptions:arg_options completion:^(HJQCloudCosUpdateResult *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.QCloudCosApi.multipartUpload"
        binaryMessenger:binaryMessenger
        codec:HJQCloudCosApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(multipartUploadOptions:completion:)], @"HJQCloudCosApi api (%@) doesn't respond to @selector(multipartUploadOptions:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        HJQCloudCosUpdateOptions *arg_options = GetNullableObjectAtIndex(args, 0);
        [api multipartUploadOptions:arg_options completion:^(HJQCloudCosUpdateResult *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
