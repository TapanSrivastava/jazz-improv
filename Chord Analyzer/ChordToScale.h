//
//  ChordToScale.h
//  Music App
//
//  Created by Tapan Srivastava on 7/26/14.
//  Copyright (c) 2014 Tapan Srivastava. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputViewController.h"
#import "ChordList.h"

@interface ChordToScale : NSObject

@property (nonatomic, strong) NSDictionary *chordToScale;  //Dictionary holding values for individual chords
@property (nonatomic, strong) NSDictionary *diatonicDictionary; //Dictionary holding values for diatonic progressions
@property (nonatomic, strong) NSDictionary *chromaticDictionary; //Corresponds each note to a numerical value, which I can then utilize to find the difference between notes

#pragma mark - Initializing Dictionary

- (id) initWithDictionary; //A way to create the dictionary here and keep the MVC system distinct

+ (id) createChangesWithDictionary;

- (ChordList*)analyze:(ChordList*)chordList;

#pragma mark - Major Diatonic Progressions
//Each have information unique to their specific progression
- (BOOL) twoFiveOne : (NSMutableArray*) chordsArray withChordList:(ChordList*) chordList;

- (void) fiveOne : (NSMutableArray*) chordsArray withChordList:(ChordList*) chordList;

- (void) twoFive : (NSMutableArray*) chordsArray withChordList:(ChordList*) chordList;

- (BOOL) oneFourTwoFive : (NSMutableArray*) chordsArray withChordList:(ChordList*) chordList;

- (void) oneTwoThreeFour : (NSMutableArray*) chordsArray withChordList:(ChordList*) chordList;

- (void) fourThreeTwoOne : (NSMutableArray*) chordsArray withChordList:(ChordList*) chordList;

- (BOOL) oneSixTwoFive : (NSMutableArray*) chordsArray withChordList:(ChordList*) chordList;


#pragma mark - Minor Diatonic Progressions

- (void) minorTwoFiveOne : (NSMutableArray*) chordsArray withChordList:(ChordList*) chordList;


#pragma mark - General Diatonic Analyzer Methods

- (void) diatonicAnalyzer:(NSArray*)progression fromArray:(NSMutableArray*)chordsArray withChordList:(ChordList*)chordList withIndex:(int)x andName:(NSString*)string andDifference:(float)result1 andDifference:(float)result2 andDifference:(float)result3; 

//Is the method that the diatonic progression methods interact with. It then calls supporter methods to ensure that the method doesn't grow too large.

- (void) chordSymbolCheck :(NSMutableArray*) chordsArray lettersInto: (NSMutableArray*)chordLetters withBuffer: (NSUInteger) buffer andProgression:(NSArray*) progression; //tests if the chord symbols match up with template (recieved from progression methods


- (void) stepTwo: (NSMutableArray*)chordLetters intoArray:(NSMutableArray*)boolArray withCondition:(NSArray*)progression andBuffer:(NSUInteger)buffer andDifference:(float) result1 andDifference:(float)result2 andDifference:(float) result3;
//Tests if the difference between the letters matches template


- (void) removeObjectUponNo:(NSMutableArray*)boolArray withArray:(NSMutableArray*)chordLetters arrayWithSymbols:(NSMutableArray*)chordsArray andProgression:(NSArray*)progression andBuffer: (NSUInteger) buffer; //Removes an object from the the final list of chords if the entire analzyation proved false.

@end