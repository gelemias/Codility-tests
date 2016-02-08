//
//  main.m
//  OddOccurrencesInArray
//
//  Created by GuillermoD on 2/8/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSDictionary.h>

int solution(NSMutableArray *A);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"--> %d",solution([NSMutableArray arrayWithArray:@[@5,@3,@4,@1,@5,@2,@3,@1,@4,@2,@3]]));
    }
    return 0;
}

int solution(NSMutableArray *A) {
    if (![A count] || !([A count] % 2)) {
        return 0;
    }
    
    NSMutableSet *oddList = [NSMutableSet new];
    
    for (NSNumber *value in A) {
        if ([oddList containsObject:value]) {
            [oddList removeObject:value];
        } else {
            [oddList addObject:value];
        }
    }
    
    return [[oddList allObjects][0] intValue];
}