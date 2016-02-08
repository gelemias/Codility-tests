//
//  main.m
//  codility
//
//  Created by GuillermoD on 2/8/16.
//  Copyright © 2016 Tomtom. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(int N);
int maxValue(NSArray *array);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"%d",solution(529));
    }
    return 0;
}

int solution(int N) {

    NSString *prevBit = @"";
    NSString *bit = @"";
    NSUInteger x = N;
    BOOL isCounting = NO;
    long count = 0;
    NSMutableArray *list = [NSMutableArray new];
    
    do {
        if (bit.length)
            prevBit = bit;
        
        bit = [NSString stringWithFormat: @"%lu", x&1];
        NSLog(@"bit %@ prev %@",bit,prevBit);
        
        // Start counting and onwards
        if (([prevBit isEqualToString:@"1"] && [bit isEqualToString:@"0"])) {
            isCounting = YES;
        } else if (isCounting) {
            count++;
        }
        
        // End count
        if (isCounting && [bit isEqualToString:@"1"] && [prevBit isEqualToString:@"0"]) {
            [list addObject:[NSNumber numberWithLong:count]];
            count = 0;
            isCounting = NO;
        }
        
    } while (x >>= 1);
    
    NSLog(@"%@",list);
    
    return [[list valueForKeyPath:@"@max.intValue"] intValue];
}