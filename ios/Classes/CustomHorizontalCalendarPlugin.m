#import "CustomHorizontalCalendarPlugin.h"
#import <custom_horizontal_calendar/custom_horizontal_calendar-Swift.h>

@implementation CustomHorizontalCalendarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCustomHorizontalCalendarPlugin registerWithRegistrar:registrar];
}
@end
