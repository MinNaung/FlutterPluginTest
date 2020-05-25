#import "FlutternativelogPlugin.h"

@implementation FlutternativelogPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutternativelog"
            binaryMessenger:[registrar messenger]];
  FlutternativelogPlugin* instance = [[FlutternativelogPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if([@"printLog" isEqualToString:call.method]) {
      NSString *msg = call.arguments[@"msg"];
      NSString *tag = call.arguments[@"tag"];

      NSLog(@"%@: %@", tag, msg);

      result(@"Logged Successfully!");

    } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
