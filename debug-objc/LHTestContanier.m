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

@interface LHTestContanier ()

@property (nonatomic, strong) Dog *dog;

@end

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
    self.dog = [Dog new];
    [self printAllClasses];
    [self.dog addObserver:self forKeyPath:@"legs" options:NSKeyValueObservingOptionNew context:nil];
    NSLog(@"\n\n再次打印所有的类：\n\n");
    [self printAllClasses];
    [Dog sayDog];
}

- (void)printAllClasses {
    Class *buff;
    int classCount = objc_getClassList(NULL, 0);
    buff = (Class *)malloc(classCount * sizeof(Class));
    objc_getClassList(buff, classCount);
    NSLog(@"%zd", classCount);
    for (int i = 0; i < classCount; i++) {
        Class cls = buff[i];
        NSString *clsName = NSStringFromClass(cls);
        if ([clsName containsString:@"Dog"]) {
            NSLog(@"%@", clsName);
        }
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"legs"]) {
        NSLog(@"");
    }
}

- (void)dealloc {
    [self.dog removeObserver:self forKeyPath:@"legs"];
}

@end
