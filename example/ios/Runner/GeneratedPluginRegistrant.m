//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_zip_archive/FlutterZipArchivePlugin.h>)
#import <flutter_zip_archive/FlutterZipArchivePlugin.h>
#else
@import flutter_zip_archive;
#endif

#if __has_include(<image_picker/ImagePickerPlugin.h>)
#import <image_picker/ImagePickerPlugin.h>
#else
@import image_picker;
#endif

#if __has_include(<path_provider/PathProviderPlugin.h>)
#import <path_provider/PathProviderPlugin.h>
#else
@import path_provider;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterZipArchivePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterZipArchivePlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
}

@end
