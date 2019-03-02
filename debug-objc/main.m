//
//  main.m
//  debug-objc
//
//  Created by suchavision on 1/24/17.
//
//

#import <Foundation/Foundation.h>

#import "LHTestContanier.h"

#import "Dog.h"

int isBigEndian() {
    union w {
        int a;
        char b;
    } c;
    c.a = 1;
    return (c.b == 1);
}

void checkCPUEndians() {
    if (isBigEndian() == 1) {
        printf("当前机器的CPU是小端");
    } else {
        printf("当前机器的CPU是大端");
    }
}

int main(int argc, const char * argv[]) {
    checkCPUEndians();
    @autoreleasepool {
        NSLog(@"Hello, World!");
        [[LHTestContanier new] beginTest];
    }
    return 0;
}

