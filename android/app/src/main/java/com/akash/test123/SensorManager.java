/*
package com.akash.test123;

import android.app.Service;
import android.content.Intent;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.IBinder;

public class SensorManager extends Service implements SensorEventListener {


    double xAccel,yAccel,zAccel;
    double xPreviousAccel,yPreviousAccel,zPreviousAccel;

    boolean firstUpdate = true;
    boolean shakeInitialted = false;
    float shakeThreshold = 12.5f;

    Sensor accelerometer;
    SensorManager sm;

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public void onCreate() {
        super.onCreate();

        sm = (SensorManager)getSystemService(SENSOR_SERVICE);
        accelerometer = sm.getDefaultSensor(android.hardware.Sensor.TYPE_ACCELEROMETER);


    }

    @Override
    public void onSensorChanged(SensorEvent event) {

    }

    @Override
    public void onAccuracyChanged(android.hardware.Sensor sensor, int accuracy) {

    }
}*/
