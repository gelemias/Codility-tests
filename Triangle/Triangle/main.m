//
//  main.m
//  Triangle
//
//  Created by GuillermoD on 2/15/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *A);
NSMutableArray* genArray(int size);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *ar = genArray(200000);
        
        NSDate *method2Start = [NSDate date];
        
        // insert code here...
        NSLog(@"-> %d",solution([@[@10, @2, @5, @1, @8, @20] mutableCopy]));
        NSLog(@"-> %d",solution([@[@10, @50, @5, @1] mutableCopy]));
        NSLog(@"-> %d",solution([@[@10, @50] mutableCopy]));
        NSLog(@"-> %d",solution([@[] mutableCopy]));
        NSLog(@"-> %d",solution([@[@1, @1, @1] mutableCopy]));
        NSLog(@"-> %d",solution([@[@0, @0, @0] mutableCopy]));
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
        int r = arc4random_uniform(74);
        [ar addObject:[NSNumber numberWithInt:r]];
    }
    
    return ar;
}

int solution(NSMutableArray *A) {
    
    if ([A count] < 3) return 0;

    A = [[A sortedArrayUsingSelector: @selector(compare:)] mutableCopy];
    for (int i = 2 ; i < [A count] ; i++ ) {
        long long P = [A[i-2] intValue];
        long long Q = [A[i-1] intValue];
        long long R = [A[i] intValue];
        
        if ((P + Q > R) && (Q + R > P) && (R + P > Q)) {
            return 1;
        }
    }
    
    return 0;
}