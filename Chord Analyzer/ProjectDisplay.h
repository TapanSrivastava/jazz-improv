//
//  ProjectDisplay.h
//  Music App
//
//  Created by Tapan Srivastava on 8/11/14.
//  Copyright (c) 2014 Tapan Srivastava. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectDisplay : UITableViewController

@property (nonatomic, strong) NSString *inputList;
@property (nonatomic, strong) NSDictionary *projectChordDictionary;
@property (nonatomic, strong) NSMutableArray *projectNames;
@property (nonatomic, strong) NSMutableArray *projectValues;

@end