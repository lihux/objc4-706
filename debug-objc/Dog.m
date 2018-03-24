//
//  Dog.m
//  debug-objc
//
//  Created by lihui on 2018/3/23.
//

#import "Dog.h"

@implementation Dog

- (void)run {
    NSLog(@"%@:%@ 开始跑步", [self class], self.name);
}

@end
