#import <MyFramework/MyObjcClass.h>
#import "MyObjcClass_Internal.h"
#import "Common.h"

#include "MyClass.h"

@implementation MyObjcClass

- (void)greet {
    MyClass cppClass;
    cppClass.hello();
    NSLog(@"Hello from MyObjcClass!");
    Common *commonInstance = [Common new];
    [commonInstance greet];
}

- (void)internalMethod {
    NSLog(@"Internal method in MyObjcClass.");
}

@end
