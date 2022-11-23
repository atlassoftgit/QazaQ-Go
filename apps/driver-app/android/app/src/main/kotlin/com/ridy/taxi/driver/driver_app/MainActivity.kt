package com.qazaq.taxi.driver

import android.app.NotificationChannel
import android.app.NotificationManager
import android.media.AudioAttributes
import android.net.Uri
import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        MapKitFactory.setApiKey("a0d7251f-ed10-43ce-805c-d0780b633ffd")
        super.onCreate(savedInstanceState)
        createNotificationChannels()
    }

     override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        flutterEngine
                .platformViewsController
                .registry
                .registerViewFactory("<platform-view-type>", NativeViewFactory(flutterEngine.dartExecutor.binaryMessenger))
     GeneratedPluginRegistrant.registerWith(flutterEngine)
    }


    private fun createNotificationChannels() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
            return
        }
        val sound = Uri.parse("android.resource://" + applicationContext.packageName + "/" + R.raw.notification)

        val notificationManager = applicationContext.getSystemService(NOTIFICATION_SERVICE) as NotificationManager

        NotificationChannel("request", "Requests", NotificationManager.IMPORTANCE_HIGH).let {
            it.enableLights(true)
            it.description = "New trip requests notification"
            val audioAttributes = AudioAttributes.Builder()
                    .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                    .setUsage(AudioAttributes.USAGE_NOTIFICATION)
                    .build()
            it.setSound(sound, audioAttributes)
            notificationManager.createNotificationChannel(it)
        }

        NotificationChannel("message", "Message", NotificationManager.IMPORTANCE_HIGH).let {
            it.enableLights(true)
            it.description = "In-App Chat messages"
            val audioAttributes = AudioAttributes.Builder()
                    .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                    .setUsage(AudioAttributes.USAGE_ALARM)
                    .build()
            it.setSound(sound, audioAttributes)
            notificationManager.createNotificationChannel(it)
        }

        NotificationChannel("tripEvents", "Trip Events", NotificationManager.IMPORTANCE_HIGH).let {
            it.enableLights(true)
            it.description = "Updates on trip status"
            val audioAttributes = AudioAttributes.Builder()
                    .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                    .setUsage(AudioAttributes.USAGE_ALARM)
                    .build()
            it.setSound(sound, audioAttributes)
            notificationManager.createNotificationChannel(it)
        }
    }
}
