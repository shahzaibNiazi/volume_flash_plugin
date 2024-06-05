package com.example.volume_flash_plugin

import android.content.Context
import android.hardware.camera2.CameraAccessException
import android.hardware.camera2.CameraManager
import android.media.AudioManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class VolumeFlashPlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var applicationContext: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "samples.flutter.dev/volume")
    channel.setMethodCallHandler(this)
    applicationContext = flutterPluginBinding.applicationContext
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "toggleFlashlight" -> {
        val isOn = call.argument<Boolean>("isOn") ?: false
        val success = toggleFlashlight(isOn)
        result.success(success)
      }
      "increaseVolume" -> {
        increaseVolume()
        result.success(null)
      }
      "decreaseVolume" -> {
        decreaseVolume()
        result.success(null)
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  private fun toggleFlashlight(state: Boolean): Boolean {
    val cameraManager = applicationContext.getSystemService(Context.CAMERA_SERVICE) as CameraManager
    return try {
      val cameraId = cameraManager.cameraIdList[0]
      cameraManager.setTorchMode(cameraId, state)
      state
    } catch (e: CameraAccessException) {
      e.printStackTrace()
      !state
    }
  }

  private fun increaseVolume() {
    val audioManager = applicationContext.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    audioManager.adjustStreamVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_RAISE, AudioManager.FLAG_SHOW_UI)
  }

  private fun decreaseVolume() {
    val audioManager = applicationContext.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    audioManager.adjustStreamVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_LOWER, AudioManager.FLAG_SHOW_UI)
  }
}
