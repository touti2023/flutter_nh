package com.dn.flutter_toast;

import android.content.Context;
import android.widget.TextView;
import android.widget.Toast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlutterToastPlugin
 */
public class FlutterToastPlugin implements MethodCallHandler {
    private Context mContext;
    private Toast mToast;

    private FlutterToastPlugin(Context context) {
        this.mContext = context;
    }
    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "com.dn/flutter_toast");
        channel.setMethodCallHandler(new FlutterToastPlugin(registrar.context()));
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("showToast")) {
            String msg = call.argument("msg");
            String duration = call.argument("duration");//long or short
            Number textColor = call.argument("textColor");
            Number textSize = call.argument("textSize");

            mToast = Toast.makeText(mContext, "", Toast.LENGTH_SHORT);
            //set text
            if (msg != null) {
                mToast.setText(msg);
            }
            //set duration
            if (duration != null && duration.equals("long")) {
                mToast.setDuration(Toast.LENGTH_LONG);
            } else {
                mToast.setDuration(Toast.LENGTH_SHORT);
            }
            //set styles
            TextView textView = (TextView) mToast.getView().findViewById(android.R.id.message);
            //set text color
            if (textView != null) {
                textView.setTextColor(textColor.intValue());
            }
            //set text size
            if (textView != null) {
                textView.setTextSize(textSize.floatValue());
            }
            mToast.show();
        } else {
            result.notImplemented();
        }
    }
}
