#import "VeriffFlutterPlugin.h"
#import <veriff_flutter/veriff_flutter-Swift.h>

@implementation VeriffFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftVeriffFlutterPlugin registerWithRegistrar:registrar];
}
@end
