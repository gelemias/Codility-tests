//
//  main.m
//  FrogRiverOne
//
//  Created by GuillermoD on 2/11/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

// Important for codility.
#import <Foundation/NSSet.h>

int solution(int X, NSMutableArray *A);
NSArray* genArray(int count, int value);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *methodStart = [NSDate date];
        NSLog(@"-> %d",solution(1, [NSMutableArray arrayWithArray:@[@1, @3, @1, @4, @2, @3, @5, @4]]));
        NSLog(@"-> %d",solution(4, [NSMutableArray arrayWithArray:@[@1, @3, @1, @4, @2, @3, @5, @4]]));
        NSLog(@"-> %d",solution(5, [NSMutableArray arrayWithArray:@[@1, @3, @1, @4, @2, @3, @5, @4]]));
        NSLog(@"-> %d",solution(6, [NSMutableArray arrayWithArray:@[@1, @3, @1, @4, @2, @3, @5, @4]]));
        NSDate *methodFinish = [NSDate date];
        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"executionTime = %fs", executionTime);
    }
    return 0;
}

int solution(int X, NSMutableArray *A) {

    NSMutableSet *ar = [NSMutableSet new];
    for (int i = 0 ; i < [A count] ; i++) {

        if (([A[i] intValue] <= X) && ![ar containsObject:A[i]]) {
            [ar addObject:A[i]];
        }
        
        if ([ar count] == X) {
            return i;
        }
    }
    
    return -1;
}
