import Flutter
import UIKit
import Veriff

public class SwiftVeriffFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "roji.io/veriff_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftVeriffFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    if call.method == "startAuthentication" {
      
      if let config = call.arguments as? Dictionary<String,Any>{
        
        let sessionToken = config["sessionToken"] as! String
        let veriffConf = VeriffConfiguration(sessionToken: sessionToken, sessionUrl: "https://magic.veriff.me")!
        let v = Veriff.shared
        
        v.set(configuration: veriffConf)
  //    let yourColor = UIColor.someColor()
  //    let yourImage = UIImage(named: “NavigationBarImageName.png”)
  //    conf.branding = Branding(themeColor: yourColor, navigationBarImage: yourImage)

        v.startAuthentication()
        } else {
        result("Argument Error")
      }

    


      // let arg: Dictionary<String, String> = call.arguments as! Dictionary<String, String>


/*
      let sessionToken = arg["sessionToken"]! as String

      let conf = VeriffConfiguration(sessionToken: sessionToken, sessionUrl: "https://magic.veriff.me")!
      let v = Veriff.shared
      v.set(configuration: conf)
  //    let yourColor = UIColor.someColor()
  //    let yourImage = UIImage(named: “NavigationBarImageName.png”)
  //    conf.branding = Branding(themeColor: yourColor, navigationBarImage: yourImage)

      v.startAuthentication()
*/
      result("") // TODO MAKE ERROR
    } else {
      result(FlutterMethodNotImplemented)
    }


  }
}



extension SwiftVeriffFlutterPlugin: VeriffDelegate {
    public func onSession(result: VeriffResult, sessionToken: String) {
        //  switch result.code {
        //      case .STATUS_DONE:
        //         // code
        //      case .STATUS_ERROR_SESSION:
        //         // code
        //  }
    }
}