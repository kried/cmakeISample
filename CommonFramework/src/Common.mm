#import <CommonFramework/Common.h>
#import "Common_Internal.h"

#include "CommonCClass.h"

@implementation Common

- (void)greet {
    CommonCClass cppClass;
    cppClass.hello();
    NSLog(@"Hello from Common!");
}

- (void)internalMethod {
    NSLog(@"Internal method in Common.");
}

@end
