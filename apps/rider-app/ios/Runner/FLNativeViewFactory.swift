import Foundation
import Flutter
import UIKit
import PayBoxSdk

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    private var channel: FlutterMethodChannel

    
    init(messenger: FlutterBinaryMessenger, channel : FlutterMethodChannel) {
        self.messenger = messenger
        self.channel = channel
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger,
            channel: channel)
    }
}

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView
    private var channel : FlutterMethodChannel
    
    lazy var paymentView : PaymentView! = {
        let screenSize: CGRect = UIScreen.main.bounds
        paymentView = PaymentView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        paymentView.autoresizesSubviews = true
        paymentView.translatesAutoresizingMaskIntoConstraints = false
        
        return paymentView
    }()
    
    lazy var sdk : PayboxSdkProtocol = {
        let sdk = PayboxSdk.initialize(merchantId: 544319, secretKey: "F9IEaYAFo6JhJS9M")
    
        sdk.setPaymentView(paymentView: paymentView)
        sdk.config().setPaymentSystem(paymentSystem: PaymentSystem.NONE)
        sdk.config().setCurrencyCode(code: "KZT")
        sdk.config().recurringMode(enabled: false)
        sdk.config().setLanguage(language: Language.ru)
        sdk.config().setFrameRequired(isRequired: true)
        #if debug
        sdk.config().testMode(enabled: true)
        #else
        sdk.config().testMode(enabled: false)
        #endif
        return sdk
    }()
        
   
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?,
        channel: FlutterMethodChannel
    ) {
        _view = UIView()
        self.channel = channel
        super.init()
        // iOS views can be created here
        createNativeView(view: _view)
    }

    func view() -> UIView {
        return _view
    }

    func createNativeView(view _view: UIView){
        _view.backgroundColor = UIColor.blue
        
        paymentView.isHidden = false
        
        self.channel.setMethodCallHandler({
            (call : FlutterMethodCall, result : @escaping FlutterResult) -> Void in
            guard call.method == "setUrl" else {
                result(FlutterMethodNotImplemented)
                return
            }
            
            guard let args = call.arguments as? [String : Any] else {return}
            let phoneNumber = args["phoneNumber"] as! String
            let amount = args["amount"] as! String
            
                self.sdk.createPayment(amount: (amount as NSString).floatValue, description: "trip cost", orderId: nil, userId: phoneNumber, extraParams: nil) {
                    payment, error in {}()
                    
                    result(payment?.status)
                    
                }
        })
        
        
        _view.addSubview(paymentView)
    }
}
