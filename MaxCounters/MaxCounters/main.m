//
//  main.m
//  MaxCounters
//
//  Created by GuillermoD on 2/12/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

NSMutableArray * solution(int N, NSMutableArray *A);
NSMutableArray* getList(int from, int to, int count);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *a1 = [getList(1, 100001, 100000) copy];
        NSArray *a2 = [getList(1, 51, 121340) copy];
        NSArray *a3 = [getList(1, 6, 564560) copy];
        NSArray *a4 = [getList(1, 201, 564560) copy];
        
        NSDate *methodStart = [NSDate date];
        
        // insert code here...
        NSLog(@"-> %@",solution(5, [NSMutableArray arrayWithArray:@[@3, @4, @4, @6, @1, @4, @4]])); // 3,2,2,4,2
        NSLog(@"-> %@",solution(5, [NSMutableArray arrayWithArray:@[@3, @3, @3, @3]]));             // 0,0,4,0,0
        NSLog(@"-> %@",solution(5, [NSMutableArray arrayWithArray:@[@6]]));                         // 1,1,1,1,1
        NSLog(@"-> %@",solution(54, [NSMutableArray arrayWithArray:@[@3, @4, @4, @6, @1, @4, @4]]));
        NSLog(@"-> %@",solution(100000, [NSMutableArray arrayWithArray:a1]));
        NSLog(@"-> %@",solution(50, [NSMutableArray arrayWithArray:a2]));
        NSLog(@"-> %@",solution(5, [NSMutableArray arrayWithArray:a3]));
        NSLog(@"-> %@",solution(200, [NSMutableArray arrayWithArray:a4]));

        NSDate *methodFinish = [NSDate date];
        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"executionTime = %fs", executionTime);
    }
    return 0;
}

NSMutableArray* getList(int from, int to, int count) {
    NSMutableArray *set = [NSMutableArray new];
    for (int i = 0 ; i < count ; i++) {
        [set addObject:@((int)from + arc4random() % (to-from+1))];
    }
    
    return set;
}

NSMutableArray* solution(int N, NSMutableArray *A) {
    
    //initialized to 0
    NSMutableArray *counters = [NSMutableArray new];
    for (int i = 0 ; i < N ; i++) {
        [counters addObject:@0];
    }
    
    int max = 0;
    int newMax = 0;

    for (NSNumber *num in A) {
        
        if ([num intValue] <= N ) {
            
            int c = [counters[[num intValue] - 1] intValue];
            c = (c < max) ? max + 1 : c + 1;
            
            counters[[num intValue] - 1] =  @(c);
            
            if (c > newMax) {
                newMax = c;
            }
        } else {
            
            max = newMax;
        }
    }
    
    for (int i = 0 ; i < N ; i++) {
        if([counters[i] intValue] < max){
            counters[i] = @(max);
        }
    }
    return counters;
}
