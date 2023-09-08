package kr.jaehyeon.flutter_pedometer

import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import io.flutter.plugin.common.EventChannel

fun sensorEventListener(events: EventChannel.EventSink): SensorEventListener? {
  return object : SensorEventListener {

    override fun onAccuracyChanged(sensor: Sensor, accuracy: Int) {
      println("[FLUTTER_PEDOMETER] onAccuracyChanged => accuracy: $accuracy")
    }

    override fun onSensorChanged(event: SensorEvent) {
      var stepCount: Int = event.values[0].toInt()

      events.success(stepCount)
    }

  }
}