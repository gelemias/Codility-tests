//
//  main.m
//  PassingCars
//
//  Created by Guillermo RD on 12/2/16.
//  Copyright © 2016 GuillermoRD. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *A);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"-> %d",solution([NSMutableArray arrayWithArray:@[@0, @1, @0, @1, @1]]));
    }
    return 0;
}

int solution(NSMutableArray *A) {
    if ([A count] == 1) {
        return 0;
    }
    
    int passed = 0;
    int count = 0;
    
    for (int i = 0 ; i < [A count] ; i++) {
        if ([A[i] intValue] == 0) {
            count++;
        } else {
            passed += count;
            if (passed > 1000000000) {
                return -1;
            }
        }
    }
    
    return passed;
}