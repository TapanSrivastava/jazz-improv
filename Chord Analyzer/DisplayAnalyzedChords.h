//
//  DisplayAnalyzedChords.h
//  Music App
//
//  Created by Tapan Srivastava on 7/26/14.
//  Copyright (c) 2014 Tapan Srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChordList.h"

@interface DisplayAnalyzedChords : UITableViewController

@property (nonatomic, strong) NSString *inputText;
@property (nonatomic, strong) ChordList* chordList;

- (IBAction)save:(id)sender;

@end
