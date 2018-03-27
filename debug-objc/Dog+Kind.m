//
//  Dog+Kind.m
//  debug-objc
//
//  Created by lihui on 2018/3/23.
//

#import "Dog+Kind.h"

#import <objc/objc-runtime.h>

static char * KDog_Brother_Key = "KDog_Brother_Key";

@implementation Dog (Kind)

+(void)load {
    //Do nothing here...
}


- (Dog *)brother {
    return objc_getAssociatedObject(self, KDog_Brother_Key);
}

- (void)setBrother:(Dog *)brother {
    objc_setAssociatedObject(self, KDog_Brother_Key, brother, OBJC_ASSOCIATION_RETAIN);
}

- (void)whatKindOfDogIAm {
    NSLog(@"金毛狮王");
}

@end
