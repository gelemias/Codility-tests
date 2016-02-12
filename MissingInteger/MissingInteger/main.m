//
//  main.m
//  MissingInteger
//
//  Created by GuillermoD on 2/12/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

NSSet* getList();
int solution(NSMutableArray *A);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *a1 = [getList(1, 9, 7) allObjects];
        NSArray *a2 = [getList(-1235, 219, 127) allObjects];
        NSArray *a3 = [getList(-121, 9123, 722) allObjects];
        NSArray *a4 = [getList(1, 2183647, 7122) allObjects];
        
        NSDate *methodStart = [NSDate date];
        
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@1]]));
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@(-2147483648)]]));
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@(2147483648)]]));

        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:a1]));
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:a2]));
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:a3]));
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:a4]));
        
        NSDate *methodFinish = [NSDate date];
        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"executionTime = %fs", executionTime);
    }
    return 0;
}

NSSet* getList(int from, int to, int miss) {
    NSMutableSet *set = [NSMutableSet new];
    for (int i = from ; i <= to ; i++) {
        if (i != miss) {
            [set addObject:@(i)];
        }
    }
    
    return set;
}

int solution(NSMutableArray *A) {
    
    [A sortUsingSelector:@selector(compare:)];
    
    int min = 1;
    for (NSNumber *n in A) {
        if ([n intValue] == min) {
            min++;
        }
    }
    
    return min;
}