//
//  SaveViewController.h
//  Music App
//
//  Created by Tapan Srivastava on 8/6/14.
//  Copyright (c) 2014 Tapan Srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChordList.h"

@interface SaveViewController : UIViewController

@property (nonatomic, strong) NSString *inputText;
@property (nonatomic, strong) ChordList* chordList;

- (IBAction)save:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *projectName;
r;
@end
