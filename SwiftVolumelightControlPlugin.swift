import Flutter
import UIKit
import AVFoundation
import MediaPlayer

public class SwiftVolumelightControlPlugin: NSObject, FlutterPlugin {
    var volumeView: MPVolumeView?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "samples.flutter.dev/volume", binaryMessenger: registrar.messenger())
        let instance = SwiftVolumelightControlPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "toggleFlashlight":
            if let args = call.arguments as? [String: Any], let isOn = args["isOn"] as? Bool {
                let success = toggleFlashlight(state: isOn)
                result(success)
            } else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "isOn flag not provided", details: nil))
            }
        case "increaseVolume":
            increaseVolume()
            result(nil)
        case "decreaseVolume":
            decreaseVolume()
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func toggleFlashlight(state: Bool) -> Bool {
        guard let device = AVCaptureDevice.default(for: .video), device.hasTorch else {
            return false
        }
        do {
            try device.lockForConfiguration()
            device.torchMode = state ? .on : .off
            device.unlockForConfiguration()
            return true
        } catch {
            print("Flashlight could not be used")
            return false
        }
    }

    private func increaseVolume() {
        if volumeView == nil {
            volumeView = MPVolumeView(frame: .zero)
            if let view = volumeView {
                UIApplication.shared.windows.first?.addSubview(view)
            }
        }

        for view in volumeView!.subviews {
            if let slider = view as? UISlider {
                slider.value += 0.1
            }
        }
    }

    private func decreaseVolume() {
        if volumeView == nil {
            volumeView = MPVolumeView(frame: .zero)
            if let view = volumeView {
                UIApplication.shared.windows.first?.addSubview(view)
            }
        }

        for view in volumeView!.subviews {
            if let slider = view as? UISlider {
                slider.value -= 0.1
            }
        }
    }
}
