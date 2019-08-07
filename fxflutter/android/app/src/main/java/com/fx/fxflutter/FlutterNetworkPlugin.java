package com.fx.fxflutter;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 *
 */
public class FlutterNetworkPlugin implements MethodChannel.MethodCallHandler
{
	private static final String CHANNEL_NAME = "com.sankuai.waimai/network";
	
	@Override
	public void onMethodCall( MethodCall methodCall ,
			MethodChannel.Result result )
	{
		switch (methodCall.method) {
			case "post":
				break;
			default:
				result.notImplemented();
				break;
		}
	}
}
