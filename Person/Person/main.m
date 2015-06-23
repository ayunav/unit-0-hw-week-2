//
//  main.m
//  Person
//
//  Created by Michael Kavouras on 6/21/15.
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
        
        // scenario: adoption.
        Person *biologicalMother = [[Person alloc] init];
        [biologicalMother setName:@"Dayanara"];
        [biologicalMother setCity:@"Litchfield"];
        [biologicalMother setPhoneNumber:@"347"];
        Person *newborn = [biologicalMother registerChild];
        
        Person *adoptedMother = [[Person alloc] init];
        [adoptedMother setName:@"Delia"];
        [adoptedMother setCity:@"Hoboken"];
        [adoptedMother setPhoneNumber:@"911"];
        [adoptedMother claimChild:newborn];
        
        NSLog(@"");
//        Person *aPerson = [[Person alloc] init];
//        [aPerson setName:@"Ayuna"];
//        [aPerson setCity:@"New York"];
//        [aPerson setPhoneNumber:@"3473933326"];
//        Person *aPersonChild = [aPerson registerChild];
//        
//        Person *otherPerson = [[Person alloc] init];
//        [otherPerson setCity:@"New Orleans"];
//        NSLog(@"%d", [otherPerson checkSameCity:aPerson]);
//        
//        Person *child = [[Person alloc] init];
//        [child setName:@"Abc"];
        
    }
    return 0;
}
