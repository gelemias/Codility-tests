//
//  main.m
//  Distinct
//
//  Created by GuillermoD on 2/15/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *A);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"-> %d",solution([@[@(-23),@12,@12] mutableCopy]));
        NSLog(@"-> %d",solution([@[@2, @1, @1, @2, @3, @1] mutableCopy]));
    }
    return 0;
}

int solution(NSMutableArray *A) {

    NSCountedSet *set = [NSCountedSet setWithArray:A];
    return (int)[set count];
}