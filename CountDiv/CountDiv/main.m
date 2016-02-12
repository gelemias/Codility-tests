//
//  main.m
//  CountDiv
//
//  Created by GuillermoD on 2/12/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(int A, int B, int K);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDate *methodStart = [NSDate date];
        
        NSLog(@"-> %d",solution(0, 0, 11));
        NSLog(@"-> %d",solution(1, 1, 11));
        NSLog(@"-> %d",solution(6, 11, 2));         //3
        NSLog(@"-> %d",solution(0, 0, 2));
        NSLog(@"-> %d",solution(0, 10, 7));
        NSLog(@"-> %d",solution(0, 100, 7));
        NSLog(@"-> %d",solution(0, 10, 2));         //6
        NSLog(@"-> %d",solution(0, 20, 2));         //6
        NSLog(@"-> %d",solution(0, 2000000000, 2)); //2000000001
        NSLog(@"-> %d",solution(INT_MAX, INT_MAX, INT_MAX));
        NSLog(@"-> %d",solution(0, INT_MAX, INT_MAX));
        
        NSDate *methodFinish = [NSDate date];
        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"executionTime = %fs", executionTime);
    }
    return 0;
}

int solution(int A, int B, int K) {
    
    if (A % K == 0) {
        return ((B - A) / K) + 1;
    } else {
        return (B/K - A/K);
    }
}