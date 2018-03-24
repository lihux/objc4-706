//
//  Animal.h
//  debug-objc
//
//  Created by lihui on 2018/3/23.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

- (void)eat;

@end
