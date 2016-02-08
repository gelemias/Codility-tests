//
//  main.m
//  CyclicRotation
//
//  Created by GuillermoD on 2/8/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

NSMutableArray * solution(NSMutableArray *A, int K);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"%@",solution([NSMutableArray arrayWithArray:@[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9]], 3));
        NSLog(@"%@",solution([NSMutableArray arrayWithArray:@[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9]], 23));
    }
    return 0;
}

NSMutableArray * solution(NSMutableArray *A, int K) {
    
    if (![A count]) {
        return A;
    }
    
    NSInteger length = [A count];
    NSInteger loc;
    NSInteger subStringLength;
    if (K > length) {
        subStringLength = K % length;
        loc = length - subStringLength;
    } else {
        loc = length - K;
        subStringLength = K;
    }
    
    //NSLog(@"%@",NSStringFromRange((NSRange){ .location = loc, .length = subStringLength }));
    
    NSArray *post = [A subarrayWithRange:(NSRange){ .location = loc, .length = subStringLength }];
    NSArray *pre = [A subarrayWithRange:(NSRange){ .location = 0, .length = loc}];
    return [NSMutableArray arrayWithArray:[post arrayByAddingObjectsFromArray:pre]];
        
}