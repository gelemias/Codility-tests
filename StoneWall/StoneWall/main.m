//
//  main.m
//  StoneWall
//
//  Created by GuillermoD on 2/18/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *H);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"-> %d",solution([@[@8, @8, @5, @7, @9, @8, @7, @4, @8] mutableCopy]));
    }
    return 0;
}

int solution(NSMutableArray *H) {
    int count = 0;
    NSMutableArray* stack = [NSMutableArray new];
    
    for(int i = 0 ; i < [H count] ; i++) {
        if ([stack count] == 0) {
            [stack addObject:H[i]];
        }
        else {
            int val = [H[i] intValue];
            int lastVal = [[stack lastObject] intValue];
            
            if (val < lastVal) {
                while([stack count] > 0 && [[stack lastObject] intValue] > val) {
                    [stack removeLastObject];
                    count++;
                }
                
                if ([stack count] > 0) {
                    lastVal = [[stack lastObject] intValue];
                    if (lastVal != val) {
                        [stack addObject:H[i]];
                    }
                }
                else{
                    [stack addObject:H[i]];
                }
            }
            else if (val > lastVal) {
                [stack addObject:H[i]];
            }
            
        }
    }
    
    return (int)(count + [stack count]);
}