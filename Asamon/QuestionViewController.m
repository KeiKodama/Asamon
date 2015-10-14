//
//  QuestionViewController.m
//  Asamon
//
//  Created by Kodama Kei on 2015/10/15.
//  Copyright (c) 2015年 pfd. All rights reserved.
//

#import "QuestionViewController.h"

@interface QuestionViewController ()
@property (weak, nonatomic) IBOutlet UIView *messageView;
@property (weak, nonatomic) IBOutlet UIView *answersView;

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.messageView.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.messageView.layer setBorderWidth:2.0f];
    
    [self.answersView.layer setBorderColor:[UIColor blueColor].CGColor];
    [self.answersView.layer setBorderWidth:2.0f];
    [self.answersView.layer setCornerRadius:25.0f];
    [self.answersView setClipsToBounds:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
