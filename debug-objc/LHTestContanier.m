//
//  LHTestContanier.m
//  debug-objc
//
//  Created by lihui on 2018/3/24.
//

#import "LHTestContanier.h"

#import "Dog.h"
#import "Dog+Kind.h"

@implementation LHTestContanier

- (void)beginTest {
    Dog *dog = [[Dog alloc] init];
    NSLog(@"%@", [dog name]);
    dog.brother = [Dog new];
    [dog run];
}

@end
