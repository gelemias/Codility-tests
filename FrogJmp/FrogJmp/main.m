//
//  main.m
//  FrogJmp
//
//  Created by GuillermoD on 2/9/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(int X, int Y, int D);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSDate *methodStart = [NSDate date];
        NSLog(@"--> %d",solution(10, 85, 30));                      // 3
        NSLog(@"--> %d",solution(5, 6, 1));                         // 1
        NSLog(@"--> %d",solution(0, 1231285, 2));                   // 615643
        NSLog(@"--> %d",solution(10,1000000000,1));                 // 999999990
        NSLog(@"--> %d",solution(50,199,4));                        // 38
        NSLog(@"--> %d",solution(1,5,2));                           // 2
        NSLog(@"--> %d",solution(5,105,3));                         // 34
        NSLog(@"--> %d",solution(2,11,3));                          // 3
        NSLog(@"--> %d",solution(999999999,1000000000,1000000000)); // 1
        NSLog(@"--> %d",solution(3,999111321,7));                   // 142730189
        NSLog(@"--> %d",solution(1283,999925368,2));                // 499962043
        NSLog(@"--> %d",solution(5,1000000000,2));                  // 499999998
        NSDate *methodFinish = [NSDate date];
        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"executionTime = %fs", executionTime);
    }
    return 0;
}

int solution(int X, int Y, int D) {
    
    return ((Y - X)+D-1)/D;
}


// 55%
//int solution(int X, int Y, int D) {
//
//    for (int i=1 ; X < Y ; i++) {
//        X += D;
//        if (X >= Y) {
//            return i;
//        }
//    }
//    
//    return 0;
//}
