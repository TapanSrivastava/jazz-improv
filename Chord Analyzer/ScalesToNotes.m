//
//  ScalesToNotes.m
//  Chord Analyzer
//
//  Created by Tapan Srivastava on 2/20/16.
//  Copyright © 2016 Tapan Srivastava. All rights reserved.
//

#import "ScalesToNotes.h"

@implementation ScalesToNotes

-(id) init
{
    self = [super init];
    
    if (self)
    {
        NSArray* keyArray = [NSArray arrayWithObjects:@"C", @"C#", @"Db", @"D", @"D#", @"Eb", @"E", @"E#", @"Fb", @"F", @"F#", @"Gb", @"G", @"G#", @"Ab", @"A", @"A#", @"Bb", @"B", @"B#", @"Cb", nil];
        
        NSArray* valueArray = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.5],[NSNumber numberWithFloat:1.5],[NSNumber numberWithFloat:2.0],[NSNumber numberWithFloat:2.5],[NSNumber numberWithFloat:2.0],[NSNumber numberWithFloat:2.5],[NSNumber numberWithFloat:3.0],[NSNumber numberWithFloat:3.0],[NSNumber numberWithFloat:3.5],[NSNumber numberWithFloat:4.0],[NSNumber numberWithFloat:4.0],[NSNumber numberWithFloat:4.5],[NSNumber numberWithFloat:5.0],[NSNumber numberWithFloat:5.0],[NSNumber numberWithFloat:5.5],[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:5.5],nil];
        
        self.noteToIntegerValue = [NSDictionary dictionaryWithObjects: valueArray forKeys: keyArray];
        
        
    }
    return self;
}

-(NSArray*) majorScale: (NSString*) scaleName
{
    NSMutableArray* notes = [NSMutableArray array];
    NSMutableArray* noteValues = [NSMutableArray array];
    
    NSArray* dividedName = [scaleName componentsSeparatedByString: @" major scale"];
    
    if ([dividedName[0] length] > 1)
    {
        return NULL;
    }
    

    [notes addObject: dividedName[0]];
    
    NSNumber* startingNoteValue = [self.noteToIntegerValue objectForKey:dividedName[0]];
    [noteValues addObject: startingNoteValue];
    
    for (int i = 0; i < 6; i++) {
        NSNumber* currentNoteValue = noteValues[i];

        if (i == 2)
        {
            float nextNoteFloat = currentNoteValue.floatValue + 0.5f;
            if (nextNoteFloat > 5.5f) {
                
                nextNoteFloat = nextNoteFloat - 6.0f;
                
            }
            
            NSNumber* nextNoteValue = [NSNumber numberWithFloat: nextNoteFloat];
            
            NSArray* nextNotes = [self.noteToIntegerValue allKeysForObject: nextNoteValue];
            
            for (NSString* note in nextNotes)
            {
                [notes addObject: note];
            }
            
            [noteValues addObject:nextNoteValue];
            
        }
        
        else
        {
            float nextNoteFloat = currentNoteValue.floatValue + 1.0f;
            
            if (nextNoteFloat > 5.5f)
            {
                nextNoteFloat = nextNoteFloat - 6.0f;
            }
            
            NSNumber* nextNoteValue = [NSNumber numberWithFloat: nextNoteFloat];
            
            NSArray* nextNotes = [self.noteToIntegerValue allKeysForObject: nextNoteValue];
            
            for (NSString* note in nextNotes)
            {
                [notes addObject: note];
            }
            
            [noteValues addObject:nextNoteValue];
            
        }
    }
    
    NSArray* returnArray = [NSArray arrayWithArray: notes];
    return returnArray;
}




@end

/* 
Major Scale
-7 Arpeggio
- Arpeggio
Minor Blues
Major Blues
 Pentatonic
 Dominant Arpeggio
 half diminished Arpeggio
 Diminished Scale
 
*/