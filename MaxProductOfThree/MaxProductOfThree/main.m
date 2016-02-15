//
//  main.m
//  MaxProductOfThree
//
//  Created by GuillermoD on 2/15/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *A);
NSMutableArray* genArray(int size);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *ar = genArray(2000000);
        
        NSDate *method2Start = [NSDate date];
        
        // insert code here...
        NSLog(@"-> %d",solution([@[@(-6), @4, @(-2), @(-4), @8, @2] mutableCopy]));
        NSLog(@"-> %d",solution([@[@(-3), @1, @2, @(-2), @5, @6] mutableCopy]));
        NSLog(@"-> %d",solution(ar));
        
        NSDate *method2Finish = [NSDate date];
        NSTimeInterval execution2Time = [method2Finish timeIntervalSinceDate:method2Start];
        NSLog(@"executionTime = %fs", execution2Time);
    }
    return 0;
}


NSMutableArray* genArray(int size) {
    NSMutableArray *ar = [NSMutableArray new];
    for (int i = 0 ; i < size ; i++) {
        int r = -1000 + arc4random() % (1000 - (-1000));
        [ar addObject:[NSNumber numberWithInt:r]];
    }
    
    return ar;
}

int solution(NSMutableArray *A) {
    
    A = [[A sortedArrayUsingSelector: @selector(compare:)] mutableCopy];
    
    int minP = [A[0] intValue];
    int minQ = [A[1] intValue];
    
    A = [[[A reverseObjectEnumerator] allObjects] mutableCopy];

    int maxP = [A[0] intValue];
    int maxQ = [A[1] intValue];
    int maxR = [A[2] intValue];
    
    int a = minP * minQ * maxP;
    int b = maxR * maxQ * maxP;
    
    if (a > b) {
        return a;
    }
    
    return b;
}