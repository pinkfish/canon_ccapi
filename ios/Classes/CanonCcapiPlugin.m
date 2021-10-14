#import "CanonCcapiPlugin.h"
#if __has_include(<canon_ccapi/canon_ccapi-Swift.h>)
#import <canon_ccapi/canon_ccapi-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "canon_ccapi-Swift.h"
#endif

@implementation CanonCcapiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCanonCcapiPlugin registerWithRegistrar:registrar];
}
@end
