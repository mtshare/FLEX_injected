#import <UIKit/UIKit.h>
#include <objc/message.h>
#include <notify.h>
#import <dlfcn.h>
#import "FLEX/Classes/FLEXManager.h"

#define kBundlePath @"/Library/MobileSubstrate/DynamicLibraries/FLEXInjectedBundle.bundle"



__attribute__((visibility("hidden")))


@interface FLEXInjected : NSObject {
    @private
}
@end


@implementation FLEXInjected

+ (instancetype)sharedInstance
{
    static FLEXInjected *_sharedFactory;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedFactory = [[self alloc] init];
    });

    return _sharedFactory;
}


- (id)init
{
    return [super init];
}


-(void)inject
{
	NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.daapps.FLEXInjected.plist"];
	BOOL inAppEnabled = [[settings objectForKey:[NSString stringWithFormat:@"FLEXInjectedEnabled-%@", [NSBundle mainBundle].bundleIdentifier]] boolValue];
    
	if (settings && inAppEnabled) {
        HBLogDebug(@"Openning explorer: %@", [FLEXManager sharedManager]);
        [[FLEXManager sharedManager] showExplorer];
	} 
	
}

@end




%ctor {

    [[NSNotificationCenter defaultCenter] addObserver:[FLEXInjected sharedInstance]
                                             selector:@selector(inject)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];

}
