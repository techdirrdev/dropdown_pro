#import "DropdownProPlugin.h"
#if __has_include(<dropdown_pro/dropdown_pro-Swift.h>)
#import <dropdown_pro/dropdown_pro-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dropdown_pro-Swift.h"
#endif

@implementation DropdownProPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDropdownProPlugin registerWithRegistrar:registrar];
}
@end
