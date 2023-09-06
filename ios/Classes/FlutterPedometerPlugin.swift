import Flutter
import UIKit

import CoreMotion

public class FlutterPedometerPlugin: NSObject, FlutterPlugin {

  let pedometer = CMPedometer()

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_pedometer", binaryMessenger: registrar.messenger())
    let instance = FlutterPedometerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    switch call.method {
      case "isStepAvailable":
        result(CMPedometer.isStepCountingAvailable())

      case "getPermissionStatus":
        result(getPermissionStatus(call: call))

      case "getTodayStep":
        getTodayStep(call: call, result: result)

      case "getStep":
        getStep(call: call, result: result)

      default:
        result(FlutterMethodNotImplemented)
    }
  }

  func getPermissionStatus(call: FlutterMethodCall) -> Int {

    let status = CMPedometer.authorizationStatus()

    switch status {
      case CMAuthorizationStatus.notDetermined:
        return 0;
      
      case CMAuthorizationStatus.restricted:
        return 1;
      
      case CMAuthorizationStatus.denied:
        return 2;
      
      case CMAuthorizationStatus.authorized:
        return 3;
      
      default:
        return 0;
    }

  }

  func getTodayStep(call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let arguments = call.arguments as? NSDictionary,
          let from = (arguments["from"] as? NSNumber),
          let to = (arguments["to"] as? NSNumber)
    else {
      result(nil)
      return;
    }

    let dateFrom = Date(timeIntervalSince1970: from.doubleValue / 1000).addingTimeInterval(32400)
    let dateTo = Date(timeIntervalSince1970: to.doubleValue / 1000).addingTimeInterval(32400)

    pedometer.queryPedometerData(from: dateFrom, to: dateTo, withHandler: {(data, error) in
      if (error != nil || data == nil) {

        result(nil)

      } else {

        print("[FLUTTER_PEDOMETER] getTodayStep data: \(data)")

        result(data!.numberOfSteps.intValue)

      }
    
    })
  }

  func getStep(call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let arguments = call.arguments as? NSDictionary,
          let from = (arguments["from"] as? NSNumber),
          let to = (arguments["to"] as? NSNumber)
    else {
      result(nil)
      return;
    }

    let dateFrom = Date(timeIntervalSince1970: from.doubleValue / 1000).addingTimeInterval(32400)
    let dateTo = Date(timeIntervalSince1970: to.doubleValue / 1000).addingTimeInterval(32400)


    pedometer.queryPedometerData(from: dateFrom, to: dateTo, withHandler: {(data, error) in
      if (error != nil || data == nil) {

        result(nil)

      } else {

        print("[FLUTTER_PEDOMETER] getSteps data: \(data)")

        result(data!.numberOfSteps.intValue)

      }
    
    })
  }

  // func dateFormatKR(time: NSNumber) -> Date {
  //   let dateTime = Date(timeIntervalSince1970: time.doubleValue / 1000).addingTimeInterval(32400)

  //   return dateTime;

  //   print("[FLUTTER_PEDOMETER] dateFormatKR time: \(time)")
  //   print("[FLUTTER_PEDOMETER] dateFormatKR dateTime: \(dateTime)")
  //   // print("[FLUTTER_PEDOMETER] locale identifier: \(Locale.current.identifier)")
  //   // print("[FLUTTER_PEDOMETER] timezone: \(TimeZone.current.identifier)")

  //   let dateFormatter = DateFormatter()
  //   dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
  //   dateFormatter.locale = Locale(identifier: Locale.current.identifier)
  //   dateFormatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)

  //   let date = dateFormatter.string(from: dateTime);

  //   print("[FLUTTER_PEDOMETER] dateFormatKR date: \(date)")

  //   return dateFormatter.date(from: date)!

  // }
}
