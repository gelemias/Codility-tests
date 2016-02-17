//
//  main.m
//  Nesting
//
//  Created by GuillermoD on 2/17/16.
//  Copyright © 2016 guillermord. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSString *S);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSLog(@"-> %d",solution(@"(()(())())"));
        NSLog(@"-> %d",solution(@""));
        NSLog(@"-> %d",solution(@"((((((((((((((()))))))))))))))"));

        NSLog(@"-> %d",solution(@")("));
        NSLog(@"-> %d",solution(@")()("));
        NSLog(@"-> %d",solution(@")()"));
        NSLog(@"-> %d",solution(@"(()("));
        NSLog(@"-> %d",solution(@"((((((((((((((()))))))))))))))(("));

    }
    return 0;
}

//87%
int solution(NSString *S) {
    
    if (([S length] % 2) != 0) {
        return 0;
    }
    
    NSMutableArray *pile = [NSMutableArray new];
    NSString *opener = @"(";
    
    for (int i = 0 ; i < [S length] ; i++) {
        NSString *val = [S substringWithRange:NSMakeRange(i, 1)];

        if ([val isEqualToString:opener]) {
            [pile addObject:val];
        } else {
            if ([pile count] == 0) {
               return 0;
            }
            
            [pile removeLastObject];
        }
    }
    
    return ([pile count] == 0) ? 1 : 0;
}