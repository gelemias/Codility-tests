//
//  main.m
//  EquiLeader
//
//  Created by GuillermoD on 2/18/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *A);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"-> %d",solution([@[@4, @3, @4, @4, @4, @2] mutableCopy]));
        NSLog(@"-> %d",solution([@[@1, @1, @4, @4] mutableCopy]));
        NSLog(@"-> %d",solution([@[@4, @3, @4, @4, @2, @2] mutableCopy]));
    }
    return 0;
}

int solution(NSMutableArray *A) {
    int equi_leaders = 0;

    
    int maxVal = [A[0] intValue];
    int maxCount = -1;
    int reptCount = -1;
    
    NSCountedSet *cs = [[NSCountedSet alloc] initWithArray:A];
    for (NSNumber *num in cs) {
        int count = (int)[cs countForObject:num];
        if ((count > maxCount) && (count > [A count]/2)) {
            maxCount = count;
        } else if (count == maxCount) {
            reptCount = count;
        }
    }
    
    if (maxCount == reptCount) {
        return 0;
    }
    
    int leftDomCount = 0;
    
    for (int i = 0 ; i < [A count] ; i++){
        if([A[i] intValue] == maxVal) {
            leftDomCount++;
        };
        
        if(leftDomCount > ( i + 1 ) / 2 &&
           (maxCount - leftDomCount) > (([A count] - i) - 1) / 2) {
            equi_leaders++;
        }
    }
    
    return equi_leaders;
}