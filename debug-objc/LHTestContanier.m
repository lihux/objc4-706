//
//  LHTestContanier.m
//  debug-objc
//
//  Created by lihui on 2018/3/24.
//

#import "LHTestContanier.h"

#import "Dog.h"
#import "Dog+Kind.h"
#import <objc/objc-runtime.h>
#import <objc/runtime.h>

@implementation LHTestContanier

- (void)beginTest {
    Dog *dog = [[Dog alloc] init];
    NSLog(@"%@", [dog name]);
    Dog *brother = [Dog new];
    dog.brother = brother;
    NSLog(@"我的兄弟是：%@", dog.brother.name);
    [dog whatKindOfDogIAm];
    [dog run];
}

@end
