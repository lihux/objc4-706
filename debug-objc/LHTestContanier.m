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
@property (nonatomic, weak) Dog *weakDog;

@end


@implementation LHTestContanier

- (void)beginTest {
//    [self testCallClassMethod];
    self.dog = [Dog new];
    self.weakDog = self.dog;
//    [self testRunLoop];
    self.weakDog = nil;
//    [self testWeak];
    NSLog(@"我的世界在下雪");
}

- (void)testWeak {
}

- (void)testRunLoop {
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    NSPort *port = [NSPort port];
    [runLoop addPort:port forMode:NSRunLoopCommonModes];
    CFAbsoluteTime refTime = CFAbsoluteTimeGetCurrent();
    NSLog(@"start time 0.000000");
    NSTimer *timer = [NSTimer timerWithTimeInterval:5.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"timer fire %f",CFAbsoluteTimeGetCurrent() - refTime);
    }];
    //    timer.tolerance = 0.5;
    [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
    [runLoop run];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"before busy %f", CFAbsoluteTimeGetCurrent() - refTime);
        NSInteger j;
        for (long  i = 0; i< 1000000000; i++) {
            j = i*3;
        }
        NSLog(@"after busy %f", CFAbsoluteTimeGetCurrent() - refTime);
    });
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
    self.dog.legs = 5;
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
