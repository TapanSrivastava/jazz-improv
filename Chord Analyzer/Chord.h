//
//  Chord.h
//  Chord Analyzer
//
//  Created by Tapan Srivastava on 2/19/16.
//  Copyright © 2016 Tapan Srivastava. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chord : NSObject

@property (nonatomic, strong) NSString* chordName;
@property (nonatomic, strong) NSNumber* frequency;
@property (nonatomic, strong) NSString* scales;

@end