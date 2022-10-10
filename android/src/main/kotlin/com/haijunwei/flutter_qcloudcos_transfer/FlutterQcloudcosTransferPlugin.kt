package com.haijunwei.flutter_qcloudcos_transfer

import com.haijunwei.flutter_qcloudcos_transfer.Messages.QCloudCosUpdateResult
import com.tencent.cos.xml.CosXmlService
import com.tencent.cos.xml.CosXmlServiceConfig
import com.tencent.cos.xml.exception.CosXmlClientException
import com.tencent.cos.xml.exception.CosXmlServiceException
import com.tencent.cos.xml.listener.CosXmlProgressListener
import com.tencent.cos.xml.listener.CosXmlResultListener
import com.tencent.cos.xml.model.CosXmlRequest
import com.tencent.cos.xml.model.CosXmlResult
import com.tencent.cos.xml.model.`object`.PutObjectRequest
import com.tencent.cos.xml.model.`object`.PutObjectResult
import com.tencent.cos.xml.transfer.COSXMLUploadTask.COSXMLUploadTaskResult
import com.tencent.cos.xml.transfer.TransferConfig
import com.tencent.cos.xml.transfer.TransferManager
import com.tencent.qcloud.core.auth.BasicLifecycleCredentialProvider
import com.tencent.qcloud.core.auth.QCloudLifecycleCredentials
import com.tencent.qcloud.core.auth.SessionQCloudCredentials
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding


/** FlutterQcloudcosTransferPlugin */
class FlutterQcloudcosTransferPlugin : FlutterPlugin, ActivityAware, Messages.QCloudCosApi {
    private var activityBinding: ActivityPluginBinding? = null
    private var cosXmlService: CosXmlService? = null
    private var credentialProvider = MyCredentialProvider()

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        Messages.QCloudCosApi.setup(binding.binaryMessenger, this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

    }

    override fun onDetachedFromActivity() {
        activityBinding = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activityBinding = binding
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    override fun initialize(options: Messages.QCloudCosInitOptions) {
        activityBinding?.activity.let {
            val serviceConfig = CosXmlServiceConfig.Builder()
                .setRegion(options.regionName)
                .isHttps(true)
                .builder()
            cosXmlService = CosXmlService(it, serviceConfig, credentialProvider)
        }
    }

    override fun upload(
        options: Messages.QCloudCosUpdateOptions,
        result: Messages.Result<QCloudCosUpdateResult>?
    ) {
        credentialProvider.startTime = options.startTime
        credentialProvider.expiredTime= options.expiredTime
        credentialProvider.tmpSecretId = options.credentials.tmpSecretId
        credentialProvider.tmpSecretKey = options.credentials.tmpSecretKey
        credentialProvider.sessionToken = options.credentials.sessionToken

        val cosPath = options.tempUploadPath + options.fileName
        val putObjectRequest = PutObjectRequest( options.bucket, cosPath, options.filePath)


        cosXmlService!!.putObjectAsync(putObjectRequest, object : CosXmlResultListener {
            override fun onSuccess(cosXmlRequest: CosXmlRequest, r: CosXmlResult) {
                val data = QCloudCosUpdateResult.Builder()
                    .setPath(cosPath)
                    .build()
                result?.success(data)
            }

            override fun onFail(
                cosXmlRequest: CosXmlRequest,
                clientException: CosXmlClientException?,
                serviceException: CosXmlServiceException?
            ) {
                if (clientException != null) {
                    result?.error(clientException)
                } else {
                    result?.error(serviceException)
                }
            }
        })
    }

    override fun multipartUpload(
        options: Messages.QCloudCosUpdateOptions,
        result: Messages.Result<QCloudCosUpdateResult>?
    ) {
        credentialProvider.startTime = options.startTime
        credentialProvider.expiredTime= options.expiredTime
        credentialProvider.tmpSecretId = options.credentials.tmpSecretId
        credentialProvider.tmpSecretKey = options.credentials.tmpSecretKey
        credentialProvider.sessionToken = options.credentials.sessionToken

        val transferConfig = TransferConfig.Builder().build()
        val transferManager = TransferManager(cosXmlService, transferConfig)
        val bucket = options.bucket
        val cosPath = options.tempUploadPath + options.fileName;
        val uploadTask = transferManager.upload(bucket, cosPath, options.filePath, null)
        uploadTask.setCosXmlResultListener(object : CosXmlResultListener {
            override fun onSuccess(request: CosXmlRequest, r: CosXmlResult) {
                val uploadResult = r as COSXMLUploadTaskResult
                val data = QCloudCosUpdateResult.Builder()
                    .setPath(cosPath)
                    .build()
                result?.success(data)
            }
            override fun onFail(
                request: CosXmlRequest,
                clientException: CosXmlClientException?,
                serviceException: CosXmlServiceException?
            ) {
                if (clientException != null) {
                    result?.error(clientException)
                } else {
                    result?.error(serviceException)
                }
            }
        })
    }
}

class MyCredentialProvider : BasicLifecycleCredentialProvider() {
    var tmpSecretId = ""
    var tmpSecretKey = ""
    var sessionToken = ""
    var startTime: Long = 0
    var expiredTime: Long = 0


    override fun fetchNewCredentials(): QCloudLifecycleCredentials {
       return SessionQCloudCredentials(
            tmpSecretId,
            tmpSecretKey,
            sessionToken,
            startTime,
            expiredTime
        )
    }

}


