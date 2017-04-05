//
//  Person.m
//  afnetworking
//
//  Created by g tokman on 4/5/17.
//  Copyright © 2017 garytokman. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithObject:(id)object {
    if (self == [super init]) {
        NSDictionary *jsonDictionary = (NSDictionary*)object;
        if (jsonDictionary) {
            self.name = [jsonDictionary objectForKey:@"name"];
            self.imageDownloadUrl = [jsonDictionary objectForKey:@"avatar_url"];
            self.company = [jsonDictionary objectForKey:@"company"];
            self.bio = [jsonDictionary objectForKey:@"bio"];
            self.blog = [jsonDictionary objectForKey:@"blog"];
            self.email = [jsonDictionary objectForKey:@"email"];
        } else {
            return nil;
        }
    }
    
    return self;
}

- (NSString*)personDescription {
    return [NSString
            stringWithFormat:@"Name: %@, Email: %@, Company: %@, Bio: %@, Blog: %@, ImageUrl: %@",
            self.name, self.email, self.company, self.bio, self.blog, self.imageDownloadUrl];
}
@end
