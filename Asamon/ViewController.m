//
//  ViewController.m
//  Asamon
//
//  Created by EastPlatform1B on 2015/09/14.
//  Copyright (c) 2015年 pfd. All rights reserved.
//

#import "ViewController.h"
#import "DDXMLDocument.h"
#import "AFHTTPRequestOperationManager.h"
#import "SVProgressHUD.h"
#import "QuestionViewController.h"

static NSString * const URL_GET_QUESTION = @"http://183.182.163.247/asamon/getQuestion.php";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushStart:(id)sender {
    [SVProgressHUD showWithStatus:@"Loading..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.0f * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self getQuestion];
    });
}

- (void)getQuestion {
    
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:URL_GET_QUESTION
      parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
          
          [SVProgressHUD dismiss];
          NSError *parseError = nil;
          DDXMLDocument *doc = [[DDXMLDocument alloc] initWithData:responseObject options:0 error:&parseError];
          
          if (!parseError) {
              NSArray *nodes = [doc nodesForXPath:@"/question/question_id" error:nil];
              DDXMLNode *node = nodes[0];
              NSLog(@"%@", node.stringValue);
              
              QuestionViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"QuestionViewController"];
              
              [self.navigationController pushViewController:controller animated:YES];
          } else {
              NSLog(@"parse error:%@", parseError);
          }
          
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          NSLog(@"error:%@", error);
      }];
    
}

@end
