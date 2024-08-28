#import <MyFramework/MyObjcClass.h>
#import "MyObjcClass_Internal.h"  // If you need internal methods

#include "MyClass.h"

@implementation MyObjcClass

- (void)greet {
    MyClass cppClass;
    cppClass.hello(); // Call C++ method
    NSLog(@"Hello from MyObjcClass!");
}

- (void)internalMethod {
    NSLog(@"Internal method in MyObjcClass.");
}

@end
