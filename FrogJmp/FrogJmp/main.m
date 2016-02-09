//
//  main.m
//  FrogJmp
//
//  Created by GuillermoD on 2/9/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(int X, int Y, int D);
int solution1(int X, int Y, int D);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSDate *methodStart = [NSDate date];
        NSLog(@"--> %d",solution(10, 85, 30));
        NSLog(@"--> %d",solution(5, 6, 1));
        NSLog(@"--> %d",solution(0, 1231285, 2));
        NSLog(@"--> %d",solution(10,1000000000,1));
        NSDate *methodFinish = [NSDate date];
        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"executionTime = %fs", executionTime);

        NSDate *m1 = [NSDate date];
        NSLog(@"--> %d",solution1(10, 85, 30));
        NSLog(@"--> %d",solution1(5, 6, 1));
        NSLog(@"--> %d",solution1(0, 1231285, 2));
        NSLog(@"--> %d",solution1(10,1000000000,1));
        NSDate *m2 = [NSDate date];
        NSTimeInterval ex1 = [m2 timeIntervalSinceDate:m1];
        NSLog(@"executionTime = %fs", ex1);
    }
    return 0;
}

// 55%
int solution(int X, int Y, int D) {

    for (int i=1 ; X < Y ; i++) {
        X += D;
        if (X >= Y) {
            return i;
        }
    }
    
    return 0;
}


int solution1(int X, int Y, int D) {
        
    if (D == 1) {
        return Y - X;
    }
    
    float raw = roundf((((float)Y-(float)X)/(float)D));
    return (int)raw;
}



/*
 
 (10,85,30)
 (50,199,4) 38
 (1,5,2)
 (5,105,3) 34
 (2,11,3)
 (999999999,1000000000,1000000000) 1
 (3,999111321,7) 142730189
 (1283,999925368,2) 499962043
 (5,1000000000,2) 499999998
 
 */
