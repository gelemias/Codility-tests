//
//  main.m
//  Fish
//
//  Created by GuillermoD on 2/16/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *A, NSMutableArray *B);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"-> %d",solution([@[] mutableCopy], [@[] mutableCopy]));
        NSLog(@"-> %d",solution([@[@1, @1, @1] mutableCopy], [@[@1, @1, @1] mutableCopy]));
        NSLog(@"-> %d",solution([@[@4, @3, @2, @1, @5] mutableCopy], [@[@0, @1, @0, @0, @0] mutableCopy]));
        NSLog(@"-> %d",solution([@[@4, @3, @2, @1, @5] mutableCopy], [@[@1, @0, @1, @1, @0] mutableCopy]));
    }
    return 0;
}

int solution(NSMutableArray *A, NSMutableArray *B) {
    
    NSMutableArray *upStream = [NSMutableArray new];    //0
    NSMutableArray *downStream = [NSMutableArray new];  //1
    
    for (int i = 0; i < [A count]; i++) {
        if ([B[i] intValue] == 0) {
            [upStream addObject:A[i]];
            
            while ([downStream count] > 0) {
                if ([[upStream lastObject] intValue] > [[downStream lastObject] intValue]) {
                    [downStream removeLastObject];
                } else {
                    [upStream removeLastObject];
                    break;
                }
            }
            
        } else if ([B[i] intValue] == 1) {
            [downStream addObject:A[i]];
        }
    }
    
    return (int)([downStream count] + [upStream count]);
}