#import "TextAppearAnimationPlugin.h"
#if __has_include(<text_appear_animation/text_appear_animation-Swift.h>)
#import <text_appear_animation/text_appear_animation-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "text_appear_animation-Swift.h"
#endif

@implementation TextAppearAnimationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTextAppearAnimationPlugin registerWithRegistrar:registrar];
}
@end