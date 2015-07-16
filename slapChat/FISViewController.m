//
//  FISViewController.m
//  slapChat
//
//  Created by Yoseob Lee on 7/16/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import "Message.h"
#import "FISDataStore.h"

@interface FISViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;
@property (nonatomic, strong) FISDataStore *store;

@end

@implementation FISViewController

- (IBAction)saveButtonTapped:(id)sender
{
    Message *newMessage = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.store.managedObjectContext];
    
    newMessage.content = self.messageTextField.text;
    newMessage.createdAt = [NSDate date];
    
    [self.store saveContext];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.store = [FISDataStore sharedDataStore];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapRecognizer];
}

-(void)dismissKeyboard
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
