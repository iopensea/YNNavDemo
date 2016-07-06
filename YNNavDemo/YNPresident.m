//
//  YNPresident.m
//  YNNavDemo
//
//  Created by apple on 16/7/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "YNPresident.h"

static NSString * const kPresidentNumberKey = @"President";
static NSString * const kPresidentNameKey   = @"Name";
static NSString * const kPresidentFromKey   = @"FromYear";
static NSString * const kPresidentToKey     = @"ToYear";
static NSString * const kPresidentPartyKey  = @"party";

@implementation YNPresident

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.number forKey:kPresidentToKey];
    [aCoder encodeObject:self.name forKey:kPresidentNameKey];
    [aCoder encodeObject:self.fromYear forKey:kPresidentFromKey];
    [aCoder encodeObject:self.toYear forKey:kPresidentToKey];
    [aCoder encodeObject:self.party forKey:kPresidentPartyKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.number = [aDecoder decodeIntegerForKey:kPresidentNumberKey];
        self.name = [aDecoder decodeObjectForKey:kPresidentNameKey];
        self.fromYear = [aDecoder decodeObjectForKey:kPresidentFromKey];
        self.toYear = [aDecoder decodeObjectForKey:kPresidentToKey];
        self.party = [aDecoder decodeObjectForKey:kPresidentPartyKey];
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    YNPresident *copy = [[YNPresident alloc]init];
    copy.number = self.number;
    copy.name = self.name;
    copy.fromYear = self.fromYear;
    copy.toYear = self.toYear;
    copy.party = self.party;
    
    return copy;
}

@end
