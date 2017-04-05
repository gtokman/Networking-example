//
//  Person.h
//  afnetworking
//
//  Created by g tokman on 4/5/17.
//  Copyright © 2017 garytokman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property NSString *name;
@property (nullable) NSString *company;
@property (nullable) NSString *blog;
@property (nullable) NSString *bio;
@property (nullable) NSString *email;

- (instancetype)initWithObject:(id)object;
- (NSString*)personDescription;
@end

NS_ASSUME_NONNULL_END
