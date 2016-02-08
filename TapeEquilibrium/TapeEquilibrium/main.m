//
//  main.m
//  TapeEquilibrium
//
//  Created by Guillermo RD on 8/2/16.
//  Copyright © 2016 GuillermoRD. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *A);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"--> %d",solution([NSMutableArray arrayWithArray:@[@3,@1,@2,@4,@3]]));
    }
    return 0;
}


int solution(NSMutableArray *A) {
    
    long leftSum = 0;
    long solution = LONG_MAX;
    
    for (int i = 0 ; i < [A count] ; i++) {
        if (i+1 < [A count]) {
            leftSum += [A[i] longValue];
            
            long rightSum = 0;
            
            for (NSNumber *rest in [A subarrayWithRange:NSMakeRange([A indexOfObject:A[(i+1)]], [A count] - (i+1))]) {
                rightSum += [rest longValue];
            }
            
            long newSolution = labs(leftSum - rightSum);
            NSLog(@"| %ld - %ld | = %ld",leftSum, rightSum, newSolution);
            
            if (solution > newSolution) {
                solution = newSolution;
            }
        }
    }
    
    return (int)solution;
}