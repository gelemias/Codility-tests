//
//  main.m
//  Dominator
//
//  Created by GuillermoD on 2/18/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *A);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"-> %d",solution([@[@3, @4, @3, @2, @3, @(-1), @3, @3] mutableCopy]));
        NSLog(@"-> %d",solution([@[@3, @4, @3, @4, @(-1), @(-1), @7, @1] mutableCopy]));
        NSLog(@"-> %d",solution([@[] mutableCopy]));
        NSLog(@"-> %d",solution([@[@3, @3, @3, @2, @2, @2] mutableCopy]));
        NSLog(@"-> %d",solution([@[@2, @1, @1, @3] mutableCopy]));
    }
    return 0;
}

int solution(NSMutableArray *A) {
    int maxCount = -1;
    int reptCount = -1;
    int indx = -1;
    
    NSCountedSet *cs = [[NSCountedSet alloc] initWithArray:A];
    for (NSNumber *num in cs) {
        int count = (int)[cs countForObject:num];
        if ((count > maxCount) && (count > [A count]/2)) {
            maxCount = count;
            indx = (int)[A indexOfObject:num];
        } else if (count == maxCount) {
            reptCount = count;
        }
    }
    
    return (reptCount != maxCount) ? indx : -1;
}