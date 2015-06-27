//
//  main.m
//  Person
//
//  Created by Ayuna Vogel 🇷🇺🇺🇸 {{ in 💛 with 🚕 city }} on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person: NSObject

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setCity:(NSString *)city;
- (NSString *)city;

- (void)setPhoneNumber:(NSString *)phoneNumber;
- (NSString *)phoneNumber;

-(BOOL)checkSameCity:(Person *)otherPerson;

-(Person *)registerChild;

-(void)claimChild:(Person *)claimedChild;

-(void)setChild:(Person *)myNewChild;

-(Person *)child;

@end

@implementation Person {
    NSString *_name;
    NSString *_phoneNumber;
    NSString *_city;
    Person *_child;
}

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)name {
    return _name;
}

- (void)setCity:(NSString *)city {
    _city = city;
}

- (NSString *)city {
    return _city;
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    _phoneNumber = phoneNumber;
}

- (NSString *)phoneNumber {
    return _phoneNumber;
}

-(void)setChild:(Person *)myNewChild {
    _child = myNewChild;
}

-(Person *)child {
    return _child;
}

-(BOOL)checkSameCity:(Person *)otherPerson {
    NSString *otherPersonCity = [otherPerson city];
    BOOL isEqual = [_city isEqualToString:otherPersonCity];
    return isEqual;
}

-(Person *)registerChild {
    Person *child = [[Person alloc] init];
    [child setCity:_city];
    [child setPhoneNumber:_phoneNumber];
    [child setName:@"Bob"];
    return child;
}

-(void)claimChild:(Person *)claimedChild {
    _child = claimedChild;
    [claimedChild setCity:_city];
    [claimedChild setPhoneNumber:_phoneNumber];
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *aPerson = [[Person alloc] init];
        [aPerson setName:@"Mary"];
        [aPerson setCity:@"New York"];
        [aPerson setPhoneNumber:@"3333333333"];
        
        Person *otherPerson = [[Person alloc] init];
        [otherPerson setName:@"Kate"];
        [otherPerson setCity:@"New Orleans"];
        
        NSLog(@"Do Mary and Kate live in the same city? %d", [otherPerson checkSameCity:aPerson]);
        
        Person *child = [aPerson registerChild];
        NSLog(@"%@'s city is %@ and phone number is %@, same as Mary's", [child name], [child city], [child phoneNumber]);
        
        // scenario: adoption. Orange is the New Black, season 3.
        Person *biologicalMother = [[Person alloc] init];
        [biologicalMother setName:@"Dayanara Diaz"];
        [biologicalMother setCity:@"Litchfield"];
        [biologicalMother setPhoneNumber:@"123"];
        Person *newborn = [biologicalMother registerChild];
        NSLog(@"Dayanara's baby's city is %@ and phone number is %@", [newborn city], [newborn phoneNumber]);
        
        Person *adoptedMother = [[Person alloc] init];
        [adoptedMother setName:@"Delia Mendez (Pornstache's mother)"];
        [adoptedMother setCity:@"New York"];
        [adoptedMother setPhoneNumber:@"456"];
        [adoptedMother claimChild:newborn];
        NSLog(@"After Daya's mother lied to Delia Mendez, Pornstache's mother, that the baby was born dead, Caesar pickes up Dayanara's newborn from the hospital. Caesar gets arrested at the end of Season 3 (sorry for spoiler alert!), and the child is taken by the authorities. What's going to happen to the baby? Hopefully, Delia will find the child (?), and the baby's new city will be %@ and the phone number will be %@. Can't wait for Season 4! They are filiming an episode right by my house on Tuesday!!", [newborn city], [newborn phoneNumber]);
        
    }
    return 0;
}
