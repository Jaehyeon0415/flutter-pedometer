package kr.jaehyeon.flutter_pedometer

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel

import android.hardware.Sensor
import android.hardware.SensorEventListener
import android.hardware.SensorManager

/** FlutterPedometerPlugin */
class FlutterPedometerPlugin: FlutterPlugin {
  private lateinit var stepDetectionChannel: EventChannel
  private lateinit var stepCountChannel: EventChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    stepDetectionChannel = EventChannel(flutterPluginBinding.binaryMessenger, "step_detection")
    stepCountChannel = EventChannel(flutterPluginBinding.binaryMessenger, "step_count")

    val stepDetectionHandler = SensorStreamHandler(flutterPluginBinding, Sensor.TYPE_STEP_DETECTOR)
    val stepCountHandler = SensorStreamHandler(flutterPluginBinding, Sensor.TYPE_STEP_COUNTER)

    stepDetectionChannel.setStreamHandler(stepDetectionHandler)
    stepCountChannel.setStreamHandler(stepCountHandler)

  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    stepDetectionChannel.setStreamHandler(null)
    stepCountChannel.setStreamHandler(null)
  }
}
