//
//  SaveViewController.m
//  Music App
//
//  Created by Tapan Srivastava on 8/6/14.
//  Copyright (c) 2014 Tapan Srivastava. All rights reserved.
//

#import "SaveViewController.h"
#import "DisplayAnalyzedChords.h"
#import "ChordToScale.h"

@interface SaveViewController ()

@end

@implementation SaveViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view.
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)save:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *arrayKey = [NSMutableArray arrayWithArray:[defaults objectForKey:@"ChordAnalyzerProjectNames"]];
    NSMutableArray *arrayValue = [NSMutableArray arrayWithArray:[defaults objectForKey:@"ChordAnalyzerProjectValues"]];
    
    [arrayKey addObject:self.projectName.text];
    [arrayValue addObject:self.inputText];
    
    [defaults setObject:arrayKey forKey:@"ChordAnalyzerProjectNames"];
    [defaults setObject:arrayValue forKey:@"ChordAnalyzerProjectValues"];
    [defaults synchronize];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
@end
