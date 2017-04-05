//
//  ViewController.m
//  afnetworking
//
//  Created by g tokman on 4/5/17.
//  Copyright © 2017 garytokman. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.activityIndicator startAnimating];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:config];
    
    NSURL *baseUrl = [NSURL URLWithString:@"https://api.github.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[baseUrl URLByAppendingPathComponent:@"/users/gtokman"]];
    
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error == nil) {
            Person *person = [[Person alloc]initWithObject:responseObject];
            [self initUIWithPerson:person];
            NSLog(@"Person is: %@", [person personDescription]);
        } else {
            NSLog(@"Error: %@", error.localizedDescription);
        }
        [self.activityIndicator stopAnimating];
    }];
    
    [dataTask resume];
}

- (void)initUIWithPerson:(Person*)person {
    self.nameLabel.text = person.name;
    self.emailLabel.text = [person.email isKindOfClass:[NSString class]] ? person.email : @"None";
    self.companyLabel.text = person.company;
    self.bioLabel.text = person.bio;
    NSURL *url = [NSURL URLWithString:person.imageDownloadUrl];
    [self.imageView setImageWithURL:url placeholderImage:nil];
}

@end
