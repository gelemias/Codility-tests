//
//  main.m
//  PermCheck
//
//  Created by GuillermoD on 2/12/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *A);
NSSet* getList();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *a1 = [getList(100, 10000000) allObjects];
        NSDate *methodStart = [NSDate date];
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@4, @1, @3, @2, @5, @7, @9, @6, @8]]));            //YES
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@4, @3, @5, @7, @9, @6, @8]]));                    //YES
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@4, @1, @3, @2, @5, @7, @9, @6, @8, @11, @10]]));  //YES
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@4, @1, @5, @7, @9, @6, @8]]));                    //NO
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@1, @2, @3]]));                                    //YES
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@4, @1]]));                                        //NO
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@4, @2, @3]]));                                    //YES
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@7, @1, @6, @8]]));                                //NO
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@4]]));                                            //YES
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@4, @6, @5, @7, @9, @6, @8]]));                    //NO
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@4, @3, @5, @7, @9, @6, @3]]));                    //NO
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:a1]));                                               //YES
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@4, @4]]));                                        //NO
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@1000000000]]));                                   //NO
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@1]]));                                            //YES
        
        NSDate *methodFinish = [NSDate date];
        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"executionTime = %fs", executionTime);
    }
    return 0;
}

NSSet* getList(int from, int to) {
    NSMutableSet *set = [NSMutableSet new];
    for (int i = from ; i <= to ; i++) {
        [set addObject:@(i)];
    }
    
    return set;
}

int solution(NSMutableArray *A) {
    
    int max = -1;
    int min = INT_MAX;
    long long count = 0;
    
    NSMutableSet *passed = [NSMutableSet new];
    
    for (NSNumber *num in A) {
        if ([passed containsObject:num]) {
            return 0;
        } else {
            [passed addObject:num];
        }
        
        if ([num intValue] > max) {
            max = [num intValue];
        }
        
        if ([num intValue] < min) {
            min = [num intValue];
        }
        
        count += [num intValue];
    }
    
    if (min != 1) {
        return 0;
    }
    
    long long aCount = 0;
    for (int i = min ; i <= max ; i++) {
        aCount += i;
        if (aCount > count) {
            return 0;
        }
    }
    
    return (count == aCount) ? 1 : 0;
}