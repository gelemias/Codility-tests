## These are two random codility challenges I came across

#### 1. Anagram Palindromes

A string is a palindrome if it has exactly the same sequence of characters when read left-to-right as it has when read right-to-left. For example, the following strings are palindromes:

* "kayak"
* "codilitytilidoc"
* "neveroddoreven"

A string A is an anagram of a string B if A can be obtained from B by rearranging the characters. For example, in each of the following pairs one string is an anagram of the other:

* "mary" and "army"
* "rocketboys" and "octobersky"
* "codility" and "codility"

Write a function:

`int solution(NSString *S);`

that, given a non-empty string S consisting of N characters, returns 1 if S is an anagram of some palindrome and returns 0 otherwise.

Assume that:

* N is an integer within the range [1..100,000];
* string S consists only of lower-case letters (a—z).

For example, given S = "dooernedeevrvn", the function should return 1, because "dooernedeevrvn" is an anagram of the palindrome "neveroddoreven". Given S = "aabcba", the function should return 0, because there is no palindrome such that S is an anagram of it.

Complexity:

* expected worst-case time complexity is 0(N);
* expected worst-case space complexity is 0(1) (not counting the storage required for input arguments).

Copyright 2009-2016 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.

#### 2. K-complementary 

A non-empty zero-indexed array A consisting of N integers is given. A pair of integers (P, Q) is called K-complementary in array A if 0 P, Q < N and A[P] + A[Q] = K.

For example, consider array A such that:

A[0] = 1 A[1] = 8 A[2]= -3

A[3] = 0 A[4] = 1 A[5]= 3

A[6] = -2 A[7] = 4 A[8]= 5

The following pairs are 6-complementary in array A: (0,8), (1,6), (4,8), (5,5), (6,1), (8,0), (8,4). For instance, the pair (4,8) is 6-complementary because A[4] + A[8] = 1 + 5 = 6.

 Write a function:

`int solution(int K, NSMutableArray *A);`

that, given an integer K and a non-empty zero-indexed array A consisting of N integers, returns the number of K-complementary pairs in array A.

For example, given K = 6 and array A such that:

A[0] = 1 A[1] = 8 A[2]= -3

A[3] = 0 A[4] = 1 A[5]= 3

A[6] = -2 A[7] = 4 A[8]= 5

the function should return **7**, as explained above

Assume that:

* N is an integer within the range [1..40,000];
* K is an integer within the range [-2,147,483,648..2,147,483,647];
* each element of array A is an integer within the range [-2,147,483,648..2,147,483,647].

Complexity:

* expected worst-case time complexity is 0(N*log(N));
* expected worst-case space complexity is 0(N), beyond input storage (not counting the storage required for input arguments).

Elements of input arrays can be modified.

Copyright 2009-2016 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
