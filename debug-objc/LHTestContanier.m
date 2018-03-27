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
    [Dog sayDog];
    [Dog new];
    [Dog new];
}

@end
