//
//  main.m
//  baseChallenge
//
//  Created by GuillermoD on 2/15/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

//https://codility.com/c/feedback/CRADRX-S8M

#import <Foundation/Foundation.h>

int solution(NSString *S);
int solution2(int K, NSMutableArray *A);
int solution3(int K, NSMutableArray *A);
NSMutableArray* genArray(int size);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDate *methodStart = [NSDate date];
        NSMutableArray *ar1 = genArray(20000);
        
        // insert code here...
        NSLog(@"-> %d", solution(@"kayak"));
        NSLog(@"-> %d", solution(@"oenddonerevver"));

        NSLog(@"-> %d", solution2(0, [@[@0, @0, @0, @0] mutableCopy]));
        NSLog(@"-> %d", solution2(6, [@[@1, @8, @(-3), @0, @1, @3, @(-2), @4, @5] mutableCopy]));
        NSLog(@"-> %d", solution2(3, ar1));

        NSDate *methodFinish = [NSDate date];
        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"executionTime = %fs", executionTime);
        NSDate *method2Start = [NSDate date];
        
        NSLog(@"-> %d", solution3(0, [@[@0, @0, @0, @0] mutableCopy]));
        NSLog(@"-> %d", solution3(6, [@[@1, @8, @(-3), @0, @1, @3, @(-2), @4, @5] mutableCopy]));
        NSLog(@"-> %d", solution3(3, ar1));

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

//#1
int solution(NSString *S) {
    
    NSMutableSet *set = [NSMutableSet new];
    for (int i = 0 ; i < [S length] ; i++) {
        NSString *ch = [S substringWithRange:NSMakeRange(i, 1)];
        if ([set containsObject:ch]) {
            [set removeObject:ch];
        } else {
            [set addObject:ch];
        }
        
    }
    
    return ([set count] <= 1) ? 1 : 0;
}

//#2
int solution3(int K, NSMutableArray *A) {

    NSMutableDictionary *dict = [NSMutableDictionary new];
    
    for (NSNumber *num in A) {
        if ([[dict allKeys] containsObject:num]) {
            int new = [[dict objectForKey:num] intValue];
            new++;
            [dict setObject:@(new) forKey:num];
        } else {
            [dict setObject:@1 forKey:num];
        }
    }
    
    int count = 0;
    for (NSNumber *num in [dict allKeys]) {

        int comp = K - [num intValue];
        int valCount = [[dict objectForKey:@(comp)] intValue];
        count += [[dict objectForKey:num] intValue] * valCount;
    }
    
    return count;
}