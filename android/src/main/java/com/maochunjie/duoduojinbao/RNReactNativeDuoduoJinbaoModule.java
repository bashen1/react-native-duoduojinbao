package com.maochunjie.duoduojinbao;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;
import com.xunmeng.duoduojinbao.JinbaoUtil;

public class RNReactNativeDuoduoJinbaoModule extends ReactContextBaseJavaModule {
    private final ReactApplicationContext reactContext;

    public RNReactNativeDuoduoJinbaoModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNReactNativeDuoduoJinbao";
    }

    @ReactMethod
    public void init(final ReadableMap data, final Promise p) {
        JinbaoUtil.init(reactContext, new JinbaoUtil.IOnInitCallback() {
            @Override
            public void onInitEnd(boolean success) {
                WritableMap map = Arguments.createMap();
                if (success) {
                    map.putString("message", "success");
                    map.putInt("code", 1);
                } else {
                    map.putString("message", "failure");
                    map.putInt("code", 0);
                }
                p.resolve(map);
            }
        });
    }

    @ReactMethod
    public void getPati(final ReadableMap data, final Promise p) {
        WritableMap map = Arguments.createMap();
        map.putString("message", JinbaoUtil.getPati());
        map.putInt("code", 1);
        p.resolve(map);
    }

    @ReactMethod
    public void openPDDWithURL(final ReadableMap data, final Promise p) {
        String url = data.getString("url");
        String backUrl = data.getString("backUrl");
        WritableMap map = Arguments.createMap();

        if (url != null && !url.isEmpty()) {
            if (backUrl != null && !backUrl.isEmpty()) {
                JinbaoUtil.openPdd(url, backUrl);
            } else {
                JinbaoUtil.openPdd(url);
            }
            map.putString("message", "");
            map.putInt("code", 1);
            p.resolve(map);
        } else {
            map.putString("message", "url为空");
            map.putInt("code", 0);
            p.resolve(map);
        }
    }
}
