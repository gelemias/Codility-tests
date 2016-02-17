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

int solution(NSString *S) {
    
    if (([S length] % 2) != 0) {
        return 0;
    }
    
    int pile = 0;
    NSString *opener = @"(";
    unichar opn = [opener characterAtIndex:0];
    
    for (int i = 0 ; i < [S length] ; i++) {
        unichar c = [S characterAtIndex:i];

        if (c == opn) {
            pile++;
        } else {
            if (pile == 0) {
               return 0;
            }
            
            pile--;
        }
    }
    
    return (pile == 0) ? 1 : 0;
}