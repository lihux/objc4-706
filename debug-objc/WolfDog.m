//
//  WolfDog.m
//  debug-objc
//
//  Created by lihui on 2018/3/23.
//

#import "WolfDog.h"

@implementation WolfDog

- (void)hunting {
    NSLog(@"%@:%@ 开始捕猎了：活捉一只小鲜肉", [self class], self.name);
}

@end
