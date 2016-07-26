//
//  ScalesToNotes.h
//  Chord Analyzer
//
//  Created by Tapan Srivastava on 2/20/16.
//  Copyright © 2016 Tapan Srivastava. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScalesToNotes : NSObject

@property (nonatomic, strong) NSDictionary *noteToIntegerValue;

-(NSArray*) majorScale: (NSString*) scaleName;

@end
