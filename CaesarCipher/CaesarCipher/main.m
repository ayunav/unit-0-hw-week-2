//
//  main.m
//  CaesarCipher
//
//  Created by Ayuna Vogel 🇷🇺🇺🇸 {{ in 💛 with 🚕 city }} on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.


//we want to know if two distinct looking ciphers correspond to the same input message. Write a method called codeBreaker, which accepts two cipher strings as paramaters and returns a boolean value which tells us whether they are actually the same input message encoded using two different offsets. hint: the maximum offset is 25

#import <Foundation/Foundation.h>

@interface CaesarCipher : NSObject

- (NSString *)encode:(NSString *)string offset:(int)offset;
- (NSString *)decode:(NSString *)string offset:(int)offset;
- (BOOL)codeBreaker:(NSString *)message1 sameAs:(NSString *)message2;

@end

@implementation CaesarCipher

- (NSString *)encode:(NSString *)string offset:(int)offset {
    if (offset > 25) {
        NSAssert(offset < 26, @"offset is out of range. 1 - 25");
    }
    NSString *str = [string lowercaseString];
    unsigned long count = [string length];
    unichar result[count];
    unichar buffer[count];
    [str getCharacters:buffer range:NSMakeRange(0, count)];
    
    char allchars[] = "abcdefghijklmnopqrstuvwxyz";

    for (int i = 0; i < count; i++) {
        if (buffer[i] == ' ' || ispunct(buffer[i])) {
            result[i] = buffer[i];
            continue;
        }
        
        char *e = strchr(allchars, buffer[i]);
        int idx= (int)(e - allchars);
        int new_idx = (idx + offset) % strlen(allchars);

        result[i] = allchars[new_idx];
    }

    return [NSString stringWithCharacters:result length:count];
}

- (NSString *)decode:(NSString *)string offset:(int)offset {
    return [self encode:string offset: (26 - offset)];
}

- (BOOL)codeBreaker:(NSString *)message1 sameAs:(NSString *)message2 {
    if (message1.length != message2.length) {
        NSLog(@"These words are not same because they have different length.");
        return NO;
    }
    else {
        for (int i = 1; i < 25; i++) {
            if ([message1 isEqualToString:[self encode:message2 offset:i]]) {
                NSLog(@"The encoded strings represent the same word.");
                return YES;
            }
        }
        NSLog(@"These are different words of the same length.");
        return NO;
    }
    return 0;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        CaesarCipher *msgCipher = [[CaesarCipher alloc]init];
        
        NSString *msg1 = @"new";
        NSString *encodedString1 = [msgCipher encode:msg1 offset:5];
        NSLog(@"First string encoded, cipher is %@", encodedString1);

        NSString *decodedString1 = [msgCipher decode:encodedString1 offset:5];
        NSLog(@"First string decoded, the word is %@", decodedString1);
        
        NSLog(@"\n");

        NSString *msg2 = @"york";
        NSString *encodedString2 = [msgCipher encode:msg2 offset:18];
        NSLog(@"Second string encoded, cipher is %@", encodedString2);
        
        NSString *decodedString2 = [msgCipher decode:encodedString2 offset:18];
        NSLog(@"Second string decoded, the word is %@", decodedString2);
        
        NSLog(@"\n");
        
        NSLog(@"Do the first and second ciphers represent the same word?");
        BOOL inputsAreSame = [msgCipher codeBreaker:encodedString1 sameAs:encodedString2];
        NSLog(@"\n");
        
        NSString *msg3 = @"city";
        NSString *encodedString3 = [msgCipher encode:msg3 offset:2];
        NSLog(@"Third string encoded, the code is %@", encodedString3);
        NSString *decodedString3 = [msgCipher decode:encodedString3 offset:2];
        NSLog(@"Third string decoded, the word is %@", decodedString3);
        NSLog(@"\n");
        NSLog(@"Do the second and third ciphers represent the same word?");
        BOOL inputsAreSame2 = [msgCipher codeBreaker:encodedString2 sameAs:encodedString3];
        NSLog(@"\n");
        
        NSString *msg4 = @"city";
        NSString *encodedString4 = [msgCipher encode:msg4 offset:7];
        NSLog(@"The code for the fourth encoded string is %@", encodedString4);
        NSString *decodedString4 = [msgCipher decode:encodedString4 offset:7];
        NSLog(@"Fourth string decoded, the word is %@", decodedString4);
        NSLog(@"\n");
        NSLog(@"Do third and fourth strings encode the same word?");
        BOOL inputsAreSame3 = [msgCipher codeBreaker:encodedString3 sameAs:encodedString4];
    }
}