//
//  ChordList.m
//  Chord Analyzer
//
//  Created by Tapan Srivastava on 2/19/16.
//  Copyright © 2016 Tapan Srivastava. All rights reserved.
//

#import "ChordList.h"

@implementation ChordList

-(id) init
{
    self = [super init];
    
    if (self) {
        self.chordList = [NSMutableArray array];
    }
    
    return self;
}


@end