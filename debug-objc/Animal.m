//
//  Animal.m
//  debug-objc
//
//  Created by lihui on 2018/3/23.
//

#import "Animal.h"

@implementation Animal

- (void)eat {
    NSLog(@"%@开始吃饭啦~~", [self class]);
}

@end
