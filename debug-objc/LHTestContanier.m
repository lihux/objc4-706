//
//  LHTestContanier.m
//  debug-objc
//
//  Created by lihui on 2018/3/24.
//

#import "LHTestContanier.h"

#import "Dog.h"
#import "Dog+Kind.h"
#import "WolfDog.h"
#import <objc/objc-runtime.h>
#import <objc/runtime.h>

@implementation LHTestContanier

- (void)beginTest {
    [self testCallClassMethod];
}

- (void)testCallClassMethod {
    [Dog new];
    NSString *easy = @"j";
    NSNumber *a1 = @1, *a2 = @2, *a3 = @3, *a100 = @100;
    NSNumber *xxx = @999999999999999999;
    NSLog(@"打印一下数字a1地址吧:%p", a1);
    NSLog(@"打印一下数字a2地址吧:%p", a2);
    NSLog(@"打印一下数字a3地址吧:%p", a3);
    NSLog(@"打印一下数字a100地址吧:%p", a100);
    NSLog(@"打印一下数字xxx地址吧:%p", xxx);
    [Dog sayDog];
    [Dog new];
}

@end
