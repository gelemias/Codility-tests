//
//  main.m
//  Brackets
//
//  Created by GuillermoD on 2/16/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSString *S);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"%d",solution(@"{[()()]}"));
        NSLog(@"%d",solution(@"()[()()]"));
        NSLog(@"%d",solution(@"()[())]{}"));

    }
    return 0;
}

int solution(NSString *S) {
    NSArray *values = @[@"(", @")", @"[", @"]", @"{", @"}"];
    NSMutableArray *openStrings = [NSMutableArray new];
    
    if (([S length] % 2) != 0) {
        return 0;
    }
    
    for (int i = 0 ; i < [S length] ; i++) {
        NSString *l = [S substringWithRange:NSMakeRange(i, 1)];
        //opener
        if (([values indexOfObject:l] % 2) == 0) {
            [openStrings addObject:l];
        }
        //closer
        else if ([values indexOfObject:[openStrings lastObject]] == [values indexOfObject:l] - 1) {
            [openStrings removeLastObject];
        }
    }
    
    return ([openStrings count] == 0) ? 1 : 0;
}