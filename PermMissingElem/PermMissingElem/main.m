//
//  main.m
//  PermMissingElem
//
//  Created by GuillermoD on 2/10/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *A);
NSMutableArray * genArray(int num);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSDate *methodStart = [NSDate date];
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[]]));              //1
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@2]]));            //2
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@1]]));            //1
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@1, @2, @3, @5]]));//4
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@2, @3, @1, @5]]));//4
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@3, @1]]));        //2
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@2, @3, @4, @5]]));//1
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@1, @3, @4, @2]]));//5
        
        NSLog(@"\n\n");
        
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:genArray(124)]));    //2
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:genArray(8473)]));   //2
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:genArray(12)]));     //2
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:genArray(10000)]));  //2
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:genArray(149)]));    //2
        NSDate *methodFinish = [NSDate date];
        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"executionTime = %fs", executionTime);
    }
    return 0;
}

NSMutableArray * genArray(int num) {
    NSMutableSet *set = [NSMutableSet new];
    for (int i = 0 ; num > 0 ; i++) {
        if (num == 3) {
            --num;
        } else {
            [set addObject:@(--num)];
        }
    }
    return [NSMutableArray arrayWithArray:[set allObjects]];
}

int solution(NSMutableArray *A) {
    
    unsigned int max = 0;
    unsigned int total = 0;
    for (NSNumber *val in A) {
        if (max < [val intValue]) {
            max = [val intValue];
        }
        
        total += [val intValue];
    }
    
    unsigned int maxTotal = max;
    unsigned int auxMax = max;
    for (int i=1 ; auxMax > 0 ; i++) {
        maxTotal += --auxMax;
    }

    NSLog(@"total %d, maxtotal %d",total, maxTotal);

    if (maxTotal == total) return ++max;
    return maxTotal - total;
}
