//
//  InputViewController.h
//  Music App
//
//  Created by Tapan Srivastava on 7/26/14.
//  Copyright (c) 2014 Tapan Srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChordList.h"
@interface InputViewController : UIViewController

@property (nonatomic, strong) ChordList* chordList;

- (IBAction)analyzeChanges:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *chords;
@end
