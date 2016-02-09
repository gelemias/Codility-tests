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
        NSLog(@"--> %d",solution([NSMutableArray arrayWithArray:@[@3,@5]]));

    }
    return 0;
}

int solution(NSMutableArray *A) {
    int min = INT_MAX;
    int right = 0;
    int left = [[A objectAtIndex:0] intValue];
    
    // Avoid ValueForKeyPath is not eficient enough.
    //int rightSum = [[A subarrayWithRange:NSMakeRange(1, [A count] - 1)] valueForKeyPath:@"@sum.self"];
    for (int i=1; i < [A count]; i++) {
        right += [[A objectAtIndex:i] intValue];
    }
    
    for (int i=1; i < [A count]; i++) {
        int absValue = abs(left - right);
        if (min > absValue) {
            min = absValue;
        }
        
        left += [[A objectAtIndex:i] intValue];
        right -= [[A objectAtIndex:i] intValue];
    }

    return min;
}
