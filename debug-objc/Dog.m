//
//  Dog.m
//  debug-objc
//
//  Created by lihui on 2018/3/23.
//

#import "Dog.h"

#define say(a) printf("\n From lihux: "#a" \n");

@implementation Dog

+ (void)load {
    //do nothing here, just for debug!
    say("Dog Class is loading...")
}

+(void)initialize {
    say("Dog Class is initializing!")
}

+ (void)sayDog {
    say("I'm a doggy!")
}

- (void)run {
    NSLog(@"%@:%@ 开始跑步", [self class], self.name);
}

- (void)setLegs:(NSInteger)legs {
    _legs = legs;
}

@end
