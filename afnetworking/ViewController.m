//
//  ViewController.m
//  afnetworking
//
//  Created by g tokman on 4/5/17.
//  Copyright © 2017 garytokman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:config];
    
    NSURL *baseUrl = [NSURL URLWithString:@"https://api.github.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[baseUrl URLByAppendingPathComponent:@"/users/gtokman"]];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error == nil) {
            Person *person = [[Person alloc]initWithObject:responseObject];
            NSLog(@"Person is: %@", [person personDescription]);
        } else {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
    
    [dataTask resume];
}

@end
