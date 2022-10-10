import Flutter
import UIKit
import QCloudCOSXML

public class SwiftFlutterQcloudcosTransferPlugin: NSObject, FlutterPlugin, HJQCloudCosApi, QCloudSignatureProvider {
    
    
 
    
    var tmpSecretId = ""
    var tmpSecretKey = ""
    var sessionToken = ""
    var startTime: Double = 0
    var expiredTime: Double = 0
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = SwiftFlutterQcloudcosTransferPlugin()
        HJQCloudCosApiSetup(registrar.messenger(), instance)
        registrar.publish(instance)
    }

    public func initializeOptions(_ options: HJQCloudCosInitOptions, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        let config = QCloudServiceConfiguration()
        let endPoint = QCloudCOSXMLEndPoint()
        endPoint.regionName = options.regionName
        endPoint.useHTTPS = true
        config.endpoint = endPoint
        config.signatureProvider = self
        QCloudCOSXMLService.registerDefaultCOSXML(with: config)
        QCloudCOSTransferMangerService.registerDefaultCOSTransferManger(with: config)
    }
    
    public func uploadOptions(_ options: HJQCloudCosUpdateOptions, completion: @escaping (HJQCloudCosUpdateResult?, FlutterError?) -> Void) {
        tmpSecretId = options.credentials.tmpSecretId
        tmpSecretKey = options.credentials.tmpSecretKey
        sessionToken = options.credentials.sessionToken
        startTime = options.startTime.doubleValue
        expiredTime = options.expiredTime.doubleValue
        
        let path = options.tempUploadPath + options.fileName
        let uploadRequest = QCloudPutObjectRequest<AnyObject>()
        uploadRequest.bucket = options.bucket
        uploadRequest.body = URL(fileURLWithPath: options.filePath) as AnyObject
        uploadRequest.object = path
        uploadRequest.finishBlock = { r, error in
            if let e = error {
                completion(nil, FlutterError(code: "0", message: e.localizedDescription, details: nil))
            } else {
                completion(HJQCloudCosUpdateResult.make(withPath: path), nil)
            }
        }
        QCloudCOSXMLService.defaultCOSXML().putObject(uploadRequest)
    }
    
    public func multipartUploadOptions(_ options: HJQCloudCosUpdateOptions, completion: @escaping (HJQCloudCosUpdateResult?, FlutterError?) -> Void) {
        let path = options.tempUploadPath + options.fileName
        let uploadRequest = QCloudCOSXMLUploadObjectRequest<AnyObject>()
        uploadRequest.bucket = options.bucket
        uploadRequest.body = URL(fileURLWithPath: options.filePath) as AnyObject
        uploadRequest.object = path
        uploadRequest.setFinish { r, error in
            if let e = error {
                completion(nil, FlutterError(code: "0", message: e.localizedDescription, details: nil))
            } else {
                completion(HJQCloudCosUpdateResult.make(withPath: path), nil)
            }
        }
        QCloudCOSTransferMangerService.defaultCOSTransferManager().uploadObject(uploadRequest)
    }
    
    public func signature(with fileds: QCloudSignatureFields!, request: QCloudBizHTTPRequest!, urlRequest urlRequst: NSMutableURLRequest!, compelete continueBlock: QCloudHTTPAuthentationContinueBlock!) {
        let credential = QCloudCredential()
        credential.secretID = tmpSecretId
        credential.secretKey = tmpSecretKey
        credential.token = sessionToken
        credential.startDate = Date(timeIntervalSince1970: startTime)
        credential.expirationDate = Date(timeIntervalSince1970: expiredTime)
        let creator = QCloudAuthentationV5Creator(credential: credential)
        let signature = creator?.signature(forData: urlRequst)
        continueBlock(signature, nil)
    }
}
