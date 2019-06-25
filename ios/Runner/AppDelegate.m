#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import <Flutter/Flutter.h>
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    
    [self createChannelWithName:@"samples.flutter.io/readUserDefaults" :^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([@"readUserDefaults" isEqualToString:call.method]) {
            
            NSString *value = [[NSUserDefaults standardUserDefaults] valueForKey:[call.arguments valueForKey:@"key"]];
            
            if (value.length > 0) {
                result(value);
            }else{
                result(([FlutterError errorWithCode:@"UNAVAILABLE"
                                            message:@"查询错误"
                                            details:nil]));
            }
        }else{
            result(FlutterMethodNotImplemented);
        }
    }];
    
    [self createChannelWithName:@"samples.flutter.io/setUserDefaults" :^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([@"setUserDefaults" isEqualToString:call.method]) {
            [[NSUserDefaults standardUserDefaults] setValue:[call.arguments valueForKey:@"value"] forKey:[call.arguments valueForKey:@"key"]];
            [[NSUserDefaults standardUserDefaults] synchronize];
            result(@"success");
            
        }else{
            result(FlutterMethodNotImplemented);
        }
    }];
    
    
    
    
  

    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}



-(void)createChannelWithName:(NSString *)name :(FlutterMethodCallHandler _Nullable)handler{
    FlutterViewController *controller = (FlutterViewController * )self.window.rootViewController;
    
    FlutterMethodChannel * appStartStateChannel = [FlutterMethodChannel methodChannelWithName:name binaryMessenger:controller];
    
    [appStartStateChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        handler(call,result);
    }];
}


@end
