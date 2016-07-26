//
//  ChordToScale.m
//  Music App
//
//  Created by Tapan Srivastava on 7/26/14.
//  Copyright (c) 2014 Tapan Srivastava. All rights reserved.
//

#import "ChordToScale.h"
#import "Chord.h"
@implementation ChordToScale
{
    BOOL doesExist;
}
#pragma mark - Initializing Dictionary

- (id) initWithDictionary
{
    self = [super init];
    //Creates an array of possible chord types in all keys (included both C# and Db, etc.) as well as the scales corresponding to them and the chromatic scale corresponding to numerical scale
    
    if (self) {
        //the keyArray and valueArray will create a dictionary in which any chord can be looked up. However, this dictionary will not handle patterns of diatonic chords, that will be handled by the diatonicKey/Object arrays and diatonicDictionary
        
        //TERRY AND JARED: this entire method creates a static table that I use in the methods that follow. The initWithDictionary method does not do anything algorithmically, however, so you can scroll to the bottom of this method. 
        NSArray *keyArray = [NSArray arrayWithObjects:
                             @"Cmaj7", @"C-7", @"Cmaj", @"C-", @"C7", @"C9", @"C11", @"C13", @"C6", @"Cø", @"Co",
                             @"C#maj7", @"C#-7", @"C#maj", @"C#-", @"C#7", @"C#9", @"C#11", @"C#13", @"C#6", @"C#ø", @"C#o",
                             @"Dbmaj7", @"Db-7", @"Dbmaj", @"Db-", @"Db7", @"Db9", @"Db11", @"Db13", @"Db6", @"Dbø", @"Dbo",
                             @"Dmaj7", @"D-7", @"Dmaj", @"D-", @"D7", @"D9", @"D11", @"D13", @"D6", @"Dø", @"Do",
                             @"D#maj7", @"D#-7", @"D#maj", @"D#-", @"D#7", @"D#9", @"D#11", @"D#13", @"D#6", @"D#ø", @"D#o",
                             @"Ebmaj7", @"Eb-7", @"Ebmaj", @"Eb-", @"Eb7", @"Eb9", @"Eb11", @"Eb13", @"Eb6", @"Ebø", @"Ebo",
                             @"Emaj7", @"E-7", @"Emaj", @"E-", @"E7", @"E9", @"E11", @"E13", @"E6", @"Eø", @"Eo",
                             @"E#maj7", @"E#-7", @"E#maj", @"E#-", @"E#7", @"E#9", @"E#11", @"E#13", @"E#6", @"E#ø", @"E#o",
                             @"Fbmaj7", @"Fb-7", @"Fbmaj", @"Fb-", @"Fb7", @"Fb9", @"Fb11", @"Fb13", @"Fb6", @"Fbø", @"Fbo",
                             @"Fmaj7", @"F-7", @"Fmaj", @"F-", @"F7", @"F9", @"F11", @"F13", @"F6", @"Fø", @"Fo",
                             @"F#maj7", @"F#-7", @"F#maj", @"F#-", @"F#7", @"F#9", @"F#11", @"F#13", @"F#6", @"F#ø", @"F#o",
                             @"Gbmaj7", @"Gb-7", @"Gbmaj", @"Gb-", @"Gb7", @"Gb9", @"Gb11", @"Gb13", @"Gb6", @"Gbø", @"Gbo",
                             @"Gmaj7", @"G-7", @"Gmaj", @"G-", @"G7", @"G9", @"G11", @"G13", @"G6", @"Gø", @"Go",
                             @"G#maj7", @"G#-7", @"G#maj", @"G#-", @"G#7", @"G#9", @"G#11", @"G#13", @"G#6", @"G#ø", @"G#o",
                             @"Abmaj7", @"Ab-7", @"Abmaj", @"Ab-", @"Ab7", @"Ab9", @"Ab11", @"Ab13", @"Ab6", @"Abø", @"Abo",
                             @"Amaj7", @"A-7", @"Amaj", @"A-", @"A7", @"A9", @"A11", @"A13", @"A6", @"Aø", @"Ao",
                             @"A#maj7", @"A#-7", @"A#maj", @"A#-", @"A#7", @"A#9", @"A#11", @"A#13", @"A#6", @"A#ø", @"A#o",
                             @"Bbmaj7", @"Bb-7", @"Bbmaj", @"Bb-", @"Bb7", @"Bb9", @"Bb11", @"Bb13", @"Bb6", @"Bbø", @"Bbo",
                             @"Bmaj7", @"B-7", @"Bmaj", @"B-", @"B7", @"B9", @"B11", @"B13", @"B6", @"Bø", @"Bo",
                             @"B#maj7", @"B#-7", @"B#maj", @"B#-", @"B#7", @"B#9", @"B#11", @"B#13", @"B#6", @"B#ø", @"B#o",
                             @"Cbmaj7", @"Cb-7", @"Cbmaj", @"Cb-", @"Cb7", @"Cb9", @"Cb11", @"Cb13", @"Cb6", @"Cbø", @"Cbo",
                             
                             @"C7b9", //Added chords: 7b9
                             
                             @"C#7b9",
                             
                             @"Db7b9",
                             
                             @"D7b9",
                             
                             @"D#7b9",
                             
                             @"Eb7b9",
                             
                             @"E7b9",
                             
                             @"E#7b9",
                             
                             @"Fb7b9",
                             
                             @"F7b9",
                             
                             @"F#7b9",
                             
                             @"Gb7b9",
                             
                             @"G7b9",
                             
                             @"G#7b9",
                             
                             @"Ab7b9",
                             
                             @"A7b9",
                             
                             @"A#7b9",
                             
                             @"Bb7b9",
                             
                             @"B7b9",
                             
                             @"B#7b9",
                             
                             @"Cb7b9",
                             
                             
                             
                             @"C7b5", //Added Chords- 7b5
                             
                             @"C#7b5",
                             
                             @"Db7b5",
                             
                             @"D7b5",
                             
                             @"D#7b5",
                             
                             @"Eb7b5",
                             
                             @"E7b5",
                             
                             @"E#7b5",
                             
                             @"Fb7b5",
                             
                             @"F7b5",
                             
                             @"F#7b5",
                             
                             @"Gb7b5",
                             
                             @"G7b5",
                             
                             @"G#7b5",
                             
                             @"Ab7b5",
                             
                             @"A7b5",
                             
                             @"A#7b5",
                             
                             @"Bb7b5",
                             
                             @"B7b5",
                             
                             @"B#7b5",
                             
                             @"Cb7b5", nil];
        
        
        
        //Array of corresponding scales.
        NSArray *valueArray = [NSArray arrayWithObjects:
                               @"C major scale", @"C minor 7 arpeggio 1 b3 5 b7", @"C major scale", @"C minor arpeggio: 1 b3 5", @"C minor blues scale, C major blues scale, C pentatonic, C dominant arpeggio: 1 3 5 b7", @"C minor blues scale, C major blues scale, C pentatonic, C dominant arpeggio: 1 3 5 b7", @"C minor blues scale, C major blues scale, C pentatonic, C dominant arpeggio: 1 3 5 b7", @"C minor blues scale, C major blues scale, C pentatonic, C dominant arpeggio: 1 3 5 b7", @"C major scale", @"C half diminished arpeggio: 1 b3 b5 b7", @"C diminished scale",
                               
                               
                               @"C# major scale",  @"C# minor 7 arpeggio 1 b3 5 b7", @"C# major scale", @"C# minor arpeggio: 1 b3 5", @"C# minor blues scale, C# major blues scale, C# pentatonic, C# dominant arpeggio: 1 3 5 b7", @"C# minor blues scale, C# major blues scale, C# pentatonic, C# dominant arpeggio: 1 3 5 b7", @"C# minor blues scale, C# major blues scale, C# pentatonic, C# dominant arpeggio: 1 3 5 b7", @"C# minor blues scale, C# major blues scale, C# pentatonic, C# dominant arpeggio: 1 3 5 b7", @"C# major scale", @"C# half diminished arpeggio: 1 b3 b5 b7", @"C# diminished scale",
                               
                               @"Db major scale",  @"Db minor 7 arpeggio 1 b3 5 b7", @"Db major scale", @"Db minor arpeggio: 1 b3 5", @"Db minor blues scale, Db major blues scale, Db pentatonic, Db dominant arpeggio: 1 3 5 b7", @"Db minor blues scale, Db major blues scale, Db pentatonic, Db dominant arpeggio: 1 3 5 b7", @"Db minor blues scale, Db major blues scale, Db pentatonic, Db dominant arpeggio: 1 3 5 b7", @"Db minor blues scale, Db major blues scale, Db pentatonic, Db dominant arpeggio: 1 3 5 b7", @"Db major scale", @"Db half diminished arpeggio: 1 b3 b5 b7", @"Db diminished scale",
                               
                               @"D major scale",  @"D minor 7 arpeggio 1 b3 5 b7", @"D major scale", @"D minor arpeggio: 1 b3 5", @"D minor blues scale, D major blues scale, D pentatonic, D dominant arpeggio: 1 3 5 b7", @"D minor blues scale, D major blues scale, D pentatonic, D dominant arpeggio: 1 3 5 b7", @"D minor blues scale, D major blues scale, D pentatonic, D dominant arpeggio: 1 3 5 b7", @"D minor blues scale, D major blues scale, D pentatonic, D dominant arpeggio: 1 3 5 b7", @"D major scale", @"D half diminished arpeggio: 1 b3 b5 b7", @"D diminished scale",
                               
                               @"D# major scale", @"D# minor 7 arpeggio 1 b3 5 b7", @"D# major scale", @"D# minor arpeggio: 1 b3 5", @"D# minor blues scale, D# major blues scale, D# pentatonic, D# dominant arpeggio: 1 3 5 b7", @"D# minor blues scale, D# major blues scale, D# pentatonic, D# dominant arpeggio: 1 3 5 b7", @"D# minor blues scale, D# major blues scale, D# pentatonic, D# dominant arpeggio: 1 3 5 b7", @"D# minor blues scale, D# major blues scale, D# pentatonic, D# dominant arpeggio: 1 3 5 b7", @"D# major scale", @"D# half diminished arpeggio: 1 b3 b5 b7", @"D# diminished scale",
                               
                               @"Eb major scale", @"Eb minor 7 arpeggio 1 b3 5 b7", @"Eb major scale", @"Eb minor arpeggio: 1 b3 5", @"Eb minor blues scale, Eb major blues scale, Eb pentatonic, Eb dominant arpeggio: 1 3 5 b7", @"Eb minor blues scale, Eb major blues scale, Eb pentatonic, Eb dominant arpeggio: 1 3 5 b7", @"Eb minor blues scale, Eb major blues scale, Eb pentatonic, Eb dominant arpeggio: 1 3 5 b7", @"Eb minor blues scale, Eb major blues scale, Eb pentatonic, Eb dominant arpeggio: 1 3 5 b7", @"Eb major scale", @"Eb half diminished arpeggio: 1 b3 b5 b7", @"Eb diminished scale",
                               
                               @"E major scale", @"E minor 7 arpeggio 1 b3 5 b7", @"E major scale", @"E minor arpeggio: 1 b3 5", @"E minor blues scale, E major blues scale, E pentatonic, E dominant arpeggio: 1 3 5 b7", @"E minor blues scale, E major blues scale, E pentatonic, E dominant arpeggio: 1 3 5 b7", @"E minor blues scale, E major blues scale, E pentatonic, E dominant arpeggio: 1 3 5 b7", @"E minor blues scale, E major blues scale, E pentatonic, E dominant arpeggio: 1 3 5 b7", @"E major scale", @"E half diminished arpeggio: 1 b3 b5 b7", @"E diminished scale",
                               
                               @"E# major scale", @"E# minor 7 arpeggio 1 b3 5 b7", @"E# major scale", @"E# minor arpeggio: 1 b3 5", @"E# minor blues scale, E# major blues scale, E# pentatonic, E# dominant arpeggio: 1 3 5 b7", @"E# minor blues scale, E# major blues scale, E# pentatonic, E# dominant arpeggio: 1 3 5 b7", @"E# minor blues scale, E# major blues scale, E# pentatonic, E# dominant arpeggio: 1 3 5 b7", @"E# minor blues scale, E# major blues scale, E# pentatonic, E# dominant arpeggio: 1 3 5 b7", @"E# major scale", @"E#  half diminished arpeggio: 1 b3 b5 b7", @"E#  diminished scale",
                               
                               @"Fb major scale", @"Fb minor 7 arpeggio 1 b3 5 b7", @"Fb major scale", @"Fb minor arpeggio: 1 b3 5", @"Fb minor blues scale, Fb major blues scale, Fb pentatonic, Fb dominant arpeggio: 1 3 5 b7", @"Fb minor blues scale, Fb major blues scale, Fb pentatonic, Fb dominant arpeggio: 1 3 5 b7", @"Fb minor blues scale, Fb major blues scale, Fb pentatonic, Fb dominant arpeggio: 1 3 5 b7", @"Fb minor blues scale, Fb major blues scale, Fb pentatonic, Fb dominant arpeggio: 1 3 5 b7", @"Fb major scale", @"Fb  half diminished arpeggio: 1 b3 b5 b7", @"Fb  diminished scale 1",
                               
                               @"F major scale", @"F minor 7 arpeggio 1 b3 5 b7", @"F major scale", @"F minor arpeggio: 1 b3 5", @"F minor blues scale, F major blues scale, F pentatonic, F dominant arpeggio: 1 3 5 b7", @"F minor blues scale, F major blues scale, F pentatonic, F dominant arpeggio: 1 3 5 b7", @"F minor blues scale, F major blues scale, F pentatonic, F dominant arpeggio: 1 3 5 b7", @"F minor blues scale, F major blues scale, F pentatonic, F dominant arpeggio: 1 3 5 b7", @"F major scale", @"F half diminished arpeggio: 1 b3 b5 b7", @"F diminished scale",
                               
                               @"F# major scale", @"F# minor 7 arpeggio 1 b3 5 b7", @"F# major scale", @"F# minor arpeggio: 1 b3 5", @"F# minor blues scale, F# major blues scale, F# pentatonic, F# dominant arpeggio: 1 3 5 b7", @"F# minor blues scale, F# major blues scale, F# pentatonic, F# dominant arpeggio: 1 3 5 b7", @"F# minor blues scale, F# major blues scale, F# pentatonic, F# dominant arpeggio: 1 3 5 b7", @"F# minor blues scale, F# major blues scale, F# pentatonic, F# dominant arpeggio: 1 3 5 b7", @"F# major scale", @"F# half diminished arpeggio: 1 b3 b5 b7", @"F# diminished scale",
                               
                               @"Gb major scale", @"Gb minor 7 arpeggio 1 b3 5 b7", @"Gb major scale", @"Gb minor arpeggio: 1 b3 5", @"Gb minor blues scale, Gb major blues scale, Gb pentatonic, Gb dominant arpeggio: 1 3 5 b7", @"Gb minor blues scale, Gb major blues scale, Gb pentatonic, Gb dominant arpeggio: 1 3 5 b7", @"Gb minor blues scale, Gb major blues scale, Gb pentatonic, Gb dominant arpeggio: 1 3 5 b7", @"Gb minor blues scale, Gb major blues scale, Gb pentatonic, Gb dominant arpeggio: 1 3 5 b7", @"Gb major scale", @"Gb half diminished arpeggio: 1 b3 b5 b7", @"Gb diminished scale",
                               
                               @"G major scale", @"G minor 7 arpeggio 1 b3 5 b7", @"G major scale", @"G minor arpeggio: 1 b3 5", @"G minor blues scale, G major blues scale, G pentatonic, G dominant arpeggio: 1 3 5 b7", @"G minor blues scale, G major blues scale, G pentatonic, G dominant arpeggio: 1 3 5 b7", @"G minor blues scale, G major blues scale, G pentatonic, G dominant arpeggio: 1 3 5 b7", @"G minor blues scale, G major blues scale, G pentatonic, G dominant arpeggio: 1 3 5 b7", @"G major scale", @"G half diminished arpeggio: 1 b3 b5 b7", @"G diminished scale",
                               
                               @"G# major scale", @"G# minor 7 arpeggio 1 b3 5 b7", @"G# major scale", @"G# minor arpeggio: 1 b3 5", @"G# minor blues scale, G# major blues scale, G# pentatonic, G# dominant arpeggio: 1 3 5 b7", @"G# minor blues scale, G# major blues scale, G# pentatonic, G# dominant arpeggio: 1 3 5 b7", @"G# minor blues scale, G# major blues scale, G# pentatonic, G# dominant arpeggio: 1 3 5 b7", @"G# minor blues scale, G# major blues scale, G# pentatonic, G# dominant arpeggio: 1 3 5 b7", @"G# major scale", @"G# half diminished arpeggio: 1 b3 b5 b7", @"G# diminished scale",
                               
                               @"Ab major scale", @"Ab minor 7 arpeggio 1 b3 5 b7", @"Ab major scale", @"Ab minor arpeggio: 1 b3 5", @"Ab minor blues scale, Ab major blues scale, Ab pentatonic, Ab dominant arpeggio: 1 3 5 b7", @"Ab minor blues scale, Ab major blues scale, Ab pentatonic, Ab dominant arpeggio: 1 3 5 b7", @"Ab minor blues scale, Ab major blues scale, Ab pentatonic, Ab dominant arpeggio: 1 3 5 b7", @"Ab minor blues scale, Ab major blues scale, Ab pentatonic, Ab dominant arpeggio: 1 3 5 b7", @"Ab major scale", @"Ab half diminished arpeggio: 1 b3 b5 b7", @"Ab diminished scale",
                               
                               @"A major scale", @"A minor 7 arpeggio 1 b3 5 b7", @"A major scale", @"A minor arpeggio: 1 b3 5", @"A minor blues scale, A major blues scale, A pentatonic, A dominant arpeggio: 1 3 5 b7", @"A minor blues scale, A major blues scale, A pentatonic, A dominant arpeggio: 1 3 5 b7", @"A minor blues scale, A major blues scale, A pentatonic, A dominant arpeggio: 1 3 5 b7", @"A minor blues scale, A major blues scale, A pentatonic, A dominant arpeggio: 1 3 5 b7", @"A major scale", @"A half diminished arpeggio: 1 b3 b5 b7", @"A diminished scale",
                               
                               @"A# major scale", @"A# minor 7 arpeggio 1 b3 5 b7", @"A# major scale", @"A# minor arpeggio: 1 b3 5", @"A# minor blues scale, A# major blues scale, A# pentatonic, A# dominant arpeggio: 1 3 5 b7", @"A# minor blues scale, A# major blues scale, A# pentatonic, A# dominant arpeggio: 1 3 5 b7", @"A# minor blues scale, A# major blues scale, A# pentatonic, A# dominant arpeggio: 1 3 5 b7", @"A# minor blues scale, A# major blues scale, A# pentatonic, A# dominant arpeggio: 1 3 5 b7", @"A# major scale", @"A# half diminished arpeggio: 1 b3 b5 b7", @"A# diminished scale",
                               
                               @"Bb major scale", @"Bb minor 7 arpeggio 1 b3 5 b7", @"Bb major scale", @"Bb minor arpeggio: 1 b3 5", @"Bb minor blues scale, Bb major blues scale, Bb pentatonic, Bb dominant arpeggio: 1 3 5 b7", @"Bb minor blues scale, Bb major blues scale, Bb pentatonic, Bb dominant arpeggio: 1 3 5 b7", @"Bb minor blues scale, Bb major blues scale, Bb pentatonic, Bb dominant arpeggio: 1 3 5 b7", @"Bb minor blues scale, Bb major blues scale, Bb pentatonic, Bb dominant arpeggio: 1 3 5 b7", @"Bb major scale", @"Bb half diminished arpeggio: 1 b3 b5 b7", @"Bb diminished scale",
                               
                               @"B major scale", @"B minor 7 arpeggio 1 b3 5 b7", @"B major scale", @"B minor arpeggio: 1 b3 5", @"B minor blues scale, B major blues scale, B pentatonic, B dominant arpeggio: 1 3 5 b7", @"B minor blues scale, B major blues scale, B pentatonic, B dominant arpeggio: 1 3 5 b7", @"B minor blues scale, B major blues scale, B pentatonic, B dominant arpeggio: 1 3 5 b7", @"B minor blues scale, B major blues scale, B pentatonic, B dominant arpeggio: 1 3 5 b7", @"B major scale", @"B half diminished arpeggio: 1 b3 b5 b7", @"B diminished scale",
                               
                               @"B# major scale", @"B# minor 7 arpeggio 1 b3 5 b7", @"B# major scale", @"B# minor arpeggio: 1 b3 5", @"B# minor blues scale, B# major blues scale, B# pentatonic, B# dominant arpeggio: 1 3 5 b7", @"B# minor blues scale, B# major blues scale, B# pentatonic, B# dominant arpeggio: 1 3 5 b7", @"B# minor blues scale, B# major blues scale, B# pentatonic, B# dominant arpeggio: 1 3 5 b7", @"B# minor blues scale, B# major blues scale, B# pentatonic, B# dominant arpeggio: 1 3 5 b7", @"B# major scale", @"B# half diminished arpeggio: 1 b3 b5 b7", @"B# diminished scale",
                               
                               @"Cb major scale", @"Cb minor 7 arpeggio 1 b3 5 b7", @"Cb major scale", @"Cb minor arpeggio: 1 b3 5", @"Cb minor blues scale, Cb major blues scale, Cb pentatonic, Cb dominant arpeggio: 1 3 5 b7", @"Cb minor blues scale, Cb major blues scale, Cb pentatonic, Cb dominant arpeggio: 1 3 5 b7", @"Cb minor blues scale, Cb major blues scale, Cb pentatonic, Cb dominant arpeggio: 1 3 5 b7", @"Cb minor blues scale, Cb major blues scale, Cb pentatonic, Cb dominant arpeggio: 1 3 5 b7", @"Cb major scale", @"Cb half diminished arpeggio: 1 b3 b5 b7", @"Cb diminished scale",
                               
                               
                               
                               
                               @"C minor blues scale, C major blues scale, C pentatonic, C dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"C# minor blues scale, C# major blues scale, C# pentatonic, C# dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"Db minor blues scale, Db major blues scale, Db pentatonic, Db dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"D minor blues scale, D major blues scale, D pentatonic, D dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"D# minor blues scale, D# major blues scale, D# pentatonic, D# dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"Eb minor blues scale, Eb major blues scale, Eb pentatonic, Eb dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"E minor blues scale, E major blues scale, E pentatonic, E dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"F minor blues scale, F major blues scale, F pentatonic, F dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"E minor blues scale, E major blues scale, E pentatonic, E dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"F minor blues scale, F major blues scale, F pentatonic, F dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"F# minor blues scale, F# major blues scale, F# pentatonic, F# dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"Gb minor blues scale, Gb major blues scale, Gb pentatonic, Gb dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"G minor blues scale, G major blues scale, G pentatonic, G dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"G# minor blues scale, G# major blues scale, G# pentatonic, G# dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"Ab minor blues scale, Ab major blues scale, Ab pentatonic, Ab dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"A minor blues scale, A major blues scale, A pentatonic, A dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"A# minor blues scale, A# major blues scale, A# pentatonic, A# dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"Bb minor blues scale, Bb major blues scale, Bb pentatonic, Bb dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"B minor blues scale, B major blues scale, B pentatonic, B dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"C minor blues scale, C major blues scale, C pentatonic, C dominant arpeggio: 1 3 5 b7 b9",
                               
                               @"B minor blues scale, B major blues scale, B pentatonic, B dominant arpeggio: 1 3 5 b7 b9",
                               
                               
                               @"C half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"C# half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"Db half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"D half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"D# half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"Eb half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"E half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"F half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"E half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"F half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"F# half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"Gb half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"G half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"G# half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"Ab half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"A half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"A# half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"Bb half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"B half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"C half diminished arpeggio: 1 b3 b5 b7",
                               
                               @"B half diminished arpeggio: 1 b3 b5 b7", nil];
        
        
        NSArray *diatonicKeys = [NSArray arrayWithObjects:
                                 @"C V I",
                                 @"C# V I",
                                 @"Db V I",
                                 @"D V I",
                                 @"D# V I",
                                 @"Eb V I",
                                 @"E V I",
                                 @"E# V I",
                                 @"Fb V I",
                                 @"F V I",
                                 @"F# V I",
                                 @"Gb V I",
                                 @"G V I",
                                 @"G# V I",
                                 @"Ab V I",
                                 @"A V I",
                                 @"A# V I",
                                 @"Bb V I",
                                 @"B V I",
                                 @"B# V I",
                                 @"Cb V I",
                                 
                                 @"C II V",
                                 @"C# II V",
                                 @"Db II V",
                                 @"D II V",
                                 @"D# II V",
                                 @"Eb II V",
                                 @"E II V",
                                 @"E# II V",
                                 @"Fb II V",
                                 @"F II V",
                                 @"F# II V",
                                 @"Gb II V",
                                 @"G II V",
                                 @"G# II V",
                                 @"Ab II V",
                                 @"A II V",
                                 @"A# II V",
                                 @"Bb II V",
                                 @"B II V",
                                 @"B# II V",
                                 @"Cb II V",
                                 
                                 @"C II V I",
                                 @"C# II V I",
                                 @"Db II V I",
                                 @"D II V I",
                                 @"D# II V I",
                                 @"Eb II V I",
                                 @"E II V I",
                                 @"E# II V I",
                                 @"Fb II V I",
                                 @"F II V I",
                                 @"F# II V I",
                                 @"Gb II V I",
                                 @"G II V I",
                                 @"G# II V I",
                                 @"Ab II V I",
                                 @"A II V I",
                                 @"A# II V I",
                                 @"Bb II V I",
                                 @"B II V I",
                                 @"B# II V I",
                                 @"Cb II V I",
                                 
                                 @"C I IV II V",
                                 @"C# I IV II V",
                                 @"Db I IV II V",
                                 @"D I IV II V",
                                 @"D# I IV II V",
                                 @"Eb I IV II V",
                                 @"E I IV II V",
                                 @"E# I IV II V",
                                 @"Fb I IV II V",
                                 @"F I IV II V",
                                 @"F# I IV II V",
                                 @"Gb I IV II V",
                                 @"G I IV II V",
                                 @"G# I IV II V",
                                 @"Ab I IV II V",
                                 @"A I IV II V",
                                 @"A# I IV II V",
                                 @"Bb I IV II V",
                                 @"B I IV II V",
                                 @"B# I IV II V",
                                 @"Cb I IV II V",
                                 
                                 
                                 @"C I II III IV",
                                 @"C# I II III IV",
                                 @"Db I II III IV",
                                 @"D I II III IV",
                                 @"D# I II III IV",
                                 @"Eb I II III IV",
                                 @"E I II III IV",
                                 @"E# I II III IV",
                                 @"Fb I II III IV",
                                 @"F I II III IV",
                                 @"F# I II III IV",
                                 @"Gb I II III IV",
                                 @"G I II III IV",
                                 @"G# I II III IV",
                                 @"Ab I II III IV",
                                 @"A I II III IV",
                                 @"A# I II III IV",
                                 @"Bb I II III IV",
                                 @"B I II III IV",
                                 @"B# I II III IV",
                                 @"Cb I II III IV",
                                 
                                 
                                 @"C IV III II I",
                                 @"C# IV III II I",
                                 @"Db IV III II I",
                                 @"D IV III II I",
                                 @"D# IV III II I",
                                 @"Eb IV III II I",
                                 @"E IV III II I",
                                 @"E# IV III II I",
                                 @"Fb IV III II I",
                                 @"F IV III II I",
                                 @"F# IV III II I",
                                 @"Gb IV III II I",
                                 @"G IV III II I",
                                 @"G# IV III II I",
                                 @"Ab IV III II I",
                                 @"A IV III II I",
                                 @"A# IV III II I",
                                 @"Bb IV III II I",
                                 @"B IV III II I",
                                 @"B# IV III II I",
                                 @"Cb IV III II I",
                                 
                                 @"C VI II V I",
                                 @"C# VI II V I",
                                 @"Db VI II V I",
                                 @"D VI II V I",
                                 @"D# VI II V I",
                                 @"Eb VI II V I",
                                 @"E VI II V I",
                                 @"E# VI II V I",
                                 @"Fb VI II V I",
                                 @"F VI II V I",
                                 @"F# VI II V I",
                                 @"Gb VI II V I",
                                 @"G VI II V I",
                                 @"G# VI II V I",
                                 @"Ab VI II V I",
                                 @"A VI II V I",
                                 @"A# VI II V I",
                                 @"Bb VI II V I",
                                 @"B VI II V I",
                                 @"B# VI II V I",
                                 @"Cb VI II V I",
                                 
                                 
                                 @"C III VI II V",
                                 @"C# III VI II V",
                                 @"Db III VI II V",
                                 @"D III VI II V",
                                 @"D# III VI II V",
                                 @"Eb III VI II V",
                                 @"E III VI II V",
                                 @"E# III VI II V",
                                 @"Fb III VI II V",
                                 @"F III VI II V",
                                 @"F# III VI II V",
                                 @"Gb III VI II V",
                                 @"G III VI II V",
                                 @"G# III VI II V",
                                 @"Ab III VI II V",
                                 @"A III VI II V",
                                 @"A# III VI II V",
                                 @"Bb III VI II V",
                                 @"B III VI II V",
                                 @"B# III VI II V",
                                 @"Cb III VI II V",
                                 
                                 
                                 @"C VII III VI",
                                 @"C# VII III VI",
                                 @"Db VII III VI",
                                 @"D VII III VI",
                                 @"D# VII III VI",
                                 @"Eb VII III VI",
                                 @"E VII III VI",
                                 @"E# VII III VI",
                                 @"Fb VII III VI",
                                 @"F VII III VI",
                                 @"F# VII III VI",
                                 @"Gb VII III VI",
                                 @"G VII III VI",
                                 @"G# VII III VI",
                                 @"Ab VII III VI",
                                 @"A VII III VI",
                                 @"A# VII III VI",
                                 @"Bb VII III VI",
                                 @"B VII III VI",
                                 @"B# VII III VI",
                                 @"Cb VII III VI",
                                 
                                 @"C I VI II V",
                                 @"C# I VI II V",
                                 @"Db I VI II V",
                                 @"D I VI II V",
                                 @"D# I VI II V",
                                 @"Eb I VI II V",
                                 @"E I VI II V",
                                 @"E# I VI II V",
                                 @"Fb I VI II V",
                                 @"F I VI II V",
                                 @"F# I VI II V",
                                 @"Gb I VI II V",
                                 @"G I VI II V",
                                 @"G# I VI II V",
                                 @"Ab I VI II V",
                                 @"A I VI II V",
                                 @"A# I VI II V",
                                 @"Bb I VI II V",
                                 @"B I VI II V",
                                 @"B# I VI II V",
                                 @"Cb I VI II V", nil];
        
        
        NSArray *diatonicValues = [NSArray arrayWithObjects:
                                   
                                   @"C major scale",
                                   @"C# major scale",
                                   @"Db major scale",
                                   @"D major scale",
                                   @"Eb major scale",
                                   @"Eb major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"F# major scale",
                                   @"Gb major scale",
                                   @"G major scale",
                                   @"G# major scale",
                                   @"Ab major scale",
                                   @"A major scale",
                                   @"A# major scale",
                                   @"Bb major scale",
                                   @"B major scale",
                                   @"C major scale",
                                   @"B major scale",
                                   
                                   
                                   @"Bb or A# major scale",
                                   @"B major scale",
                                   @"B major scale",
                                   @"C major scale",
                                   @"C# or Db major scale",
                                   @"C# or Db major scale",
                                   @"D major scale",
                                   @"Eb major scale",
                                   @"Eb major scale",
                                   @"Eb major scale",
                                   @"E major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"F# or Gb major scale",
                                   @"F# or Gb major scale",
                                   @"G major scale",
                                   @"G# or Ab major scale",
                                   @"G# or Ab major scale",
                                   @"A major scale",
                                   @"Bb or A# major scale",
                                   @"A major scale",
                                   
                                   @"C major scale",
                                   @"C# major scale",
                                   @"Db major scale",
                                   @"D major scale",
                                   @"Eb major scale",
                                   @"Eb major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"F# major scale",
                                   @"Gb major scale",
                                   @"G major scale",
                                   @"G# major scale",
                                   @"Ab major scale",
                                   @"A major scale",
                                   @"A# major scale",
                                   @"Bb major scale",
                                   @"B major scale",
                                   @"C major scale",
                                   @"B major scale",
                                   
                                   @"C major scale",
                                   @"C# major scale",
                                   @"Db major scale",
                                   @"D major scale",
                                   @"Eb major scale",
                                   @"Eb major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"F# major scale",
                                   @"Gb major scale",
                                   @"G major scale",
                                   @"G# major scale",
                                   @"Ab major scale",
                                   @"A major scale",
                                   @"A# major scale",
                                   @"Bb major scale",
                                   @"B major scale",
                                   @"C major scale",
                                   @"B major scale",
                                   
                                   @"C major scale",
                                   @"C# major scale",
                                   @"Db major scale",
                                   @"D major scale",
                                   @"Eb major scale",
                                   @"Eb major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"F# major scale",
                                   @"Gb major scale",
                                   @"G major scale",
                                   @"G# major scale",
                                   @"Ab major scale",
                                   @"A major scale",
                                   @"A# major scale",
                                   @"Bb major scale",
                                   @"B major scale",
                                   @"C major scale",
                                   @"B major scale",
                                   
                                   
                                   @"C major scale",
                                   @"C# major scale",
                                   @"Db major scale",
                                   @"D major scale",
                                   @"Eb major scale",
                                   @"Eb major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"F# major scale",
                                   @"Gb major scale",
                                   @"G major scale",
                                   @"G# major scale",
                                   @"Ab major scale",
                                   @"A major scale",
                                   @"A# major scale",
                                   @"Bb major scale",
                                   @"B major scale",
                                   @"C major scale",
                                   @"B major scale",
                                   
                                   
                                   @"C major scale",
                                   @"C# major scale",
                                   @"Db major scale",
                                   @"D major scale",
                                   @"Eb major scale",
                                   @"Eb major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"F# major scale",
                                   @"Gb major scale",
                                   @"G major scale",
                                   @"G# major scale",
                                   @"Ab major scale",
                                   @"A major scale",
                                   @"A# major scale",
                                   @"Bb major scale",
                                   @"B major scale",
                                   @"C major scale",
                                   @"B major scale",
                                   
                                   @"C major scale",
                                   @"C# major scale",
                                   @"Db major scale",
                                   @"D major scale",
                                   @"Eb major scale",
                                   @"Eb major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"F# major scale",
                                   @"Gb major scale",
                                   @"G major scale",
                                   @"G# major scale",
                                   @"Ab major scale",
                                   @"A major scale",
                                   @"A# major scale",
                                   @"Bb major scale",
                                   @"B major scale",
                                   @"C major scale",
                                   @"B major scale",
                                   
                                   
                                   @"Eb major scale or C harmonic minor",
                                   @"E major scale or C# harmonic minor",
                                   @"E major scale or Db harmonic minor",
                                   @"F major scale or D harmonic minor",
                                   @"Gb major scale or Eb harmonic minor",
                                   @"Gb major scale or Eb harmonic minor",
                                   @"G major scale or E harmonic minor",
                                   @"Ab major scale or F harmonic minor",
                                   @"G major scale or E harmonic minor",
                                   @"Ab major scale or F harmonic minor",
                                   @"A major scale or F# harmonic minor",
                                   @"A major scale or Gb harmonic minor",
                                   @"Bb major scale or G harmonic minor",
                                   @"B major scale or G# harmonic minor",
                                   @"B major scale or Ab harmonic minor",
                                   @"C major scale or A harmonic minor",
                                   @"Db major scale or A# harmonic minor",
                                   @"Db major scale or Bb harmonic minor",
                                   @"D major scale or B harmonic minor",
                                   @"Eb major scale or C harmonic minor",
                                   @"D major scale or B harmonic minor",
                                   
                                   @"C major scale",
                                   @"C# major scale",
                                   @"Db major scale",
                                   @"D major scale",
                                   @"Eb major scale",
                                   @"Eb major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"E major scale",
                                   @"F major scale",
                                   @"F# major scale",
                                   @"Gb major scale",
                                   @"G major scale",
                                   @"G# major scale",
                                   @"Ab major scale",
                                   @"A major scale",
                                   @"A# major scale",
                                   @"Bb major scale",
                                   @"B major scale",
                                   @"C major scale",
                                   @"B major scale", nil];
        
        //this static table corresponds each note to a float value. Because each diatonic pattern has a constant difference between its notes, this static table is used to check if the notes fit the diatonic pattern being tested for.
        NSArray *chromaticKeys = [NSArray arrayWithObjects:@"C", @"C#", @"D", @"D#", @"E", @"F", @"F#",  @"G",  @"G#",  @"A", @"A#", @"B", nil];
        NSArray *chromaticObjects = [NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.5], [NSNumber numberWithFloat:2.0], [NSNumber numberWithFloat:2.5], [NSNumber numberWithFloat:3.0], [NSNumber numberWithFloat:3.5], [NSNumber numberWithFloat:4.0], [NSNumber numberWithFloat:4.5],
                                     [NSNumber numberWithFloat:5.0], [NSNumber numberWithFloat:5.5], [NSNumber numberWithFloat:6.0], [NSNumber numberWithFloat:6.5], nil];
        
        //initialize and create each table
        self.chordToScale = [NSDictionary dictionaryWithObjects:valueArray forKeys:keyArray];
        self.diatonicDictionary = [NSDictionary dictionaryWithObjects:diatonicValues forKeys:diatonicKeys];
        self.chromaticDictionary = [NSDictionary dictionaryWithObjects:chromaticObjects forKeys:chromaticKeys];
        return self;
    }
    
    else {
        return 0;
    }
}
//modified initialization method
+ (id) createChangesWithDictionary

{
    return [[self alloc] initWithDictionary];
}

//this is the method called by the viewController classes. it takes in a chordList object that contains an array of the inputted chords, adds them into a seperate array and that array is then inputted into the pattern methods to check if that specific pattern appears within the list of chords.
- (ChordList*)analyze:(ChordList*)chordList
{
    NSMutableArray *array = [NSMutableArray array];
    
    if (chordList.chordList.count > 0){

        for (int i = 0; i < chordList.chordList.count; i++) { //put the individual chords into the array
            Chord* chord = chordList.chordList[i];
            
            [array addObject:chord.chordName];
            NSString *valueString = [self.chordToScale objectForKey:chord.chordName];
            if (!valueString){ //error check
                valueString = @"Invalid Chord";
            }
            chord.scales = valueString;

            [chordList.chordList replaceObjectAtIndex:i withObject:chord];
        }
        
        //each method, e.g. twoFiveOne, tests for that specific pattern. The bools ensure that there is no double counting, as a One Six Two Five contains a Two Five. Only if all 3 return false will the program spend time testing the twoFive or fiveOne.
        BOOL test1 = [self twoFiveOne:array withChordList:chordList];
        BOOL test2 = [self oneSixTwoFive:array withChordList:chordList];
        BOOL test3 = [self oneFourTwoFive:array withChordList:chordList];
        
        if (!test1 && !test2 && !test3) {
            [self twoFive:array withChordList:chordList];
            [self fiveOne:array withChordList:chordList];
        }
        
        [self oneTwoThreeFour:array withChordList:chordList];
        [self fourThreeTwoOne:array withChordList:chordList];
        [self minorTwoFiveOne:array withChordList:chordList];
        
    }
    
    return chordList;
}

#pragma mark - Major Diatonic Progressions
//the comments for twoFiveOne are the same for all diatonic progression methods.
- (BOOL) twoFiveOne : (NSMutableArray*) chordsArray withChordList:(ChordList *)chordList

{
    NSArray *progressions = [NSArray arrayWithObjects:@"-", @"7", @"maj", nil]; //the symbol template
    NSString *string = @" II V I"; //what the name will be when adding from diatonic dictionary
    float result1 = 2.5; //difference
    float result2 = 2.5;//difference
    [self diatonicAnalyzer:progressions fromArray:chordsArray withChordList:chordList withIndex:2 andName:string andDifference:result1 andDifference:result2 andDifference:0]; //0 because there isn't a third comparison to make.
    
    return doesExist; //if there is a II V I in the chords DO NOT test for V I or II V.
}

- (void) fiveOne : (NSMutableArray*) chordsArray withChordList:(ChordList *)chordList

{
    NSArray *progressions = [NSArray arrayWithObjects:@"7", @"maj", nil];
    NSString *string = @" V I";
    float result1 = 2.5;
    [self diatonicAnalyzer:progressions fromArray:chordsArray withChordList:chordList withIndex:1 andName:string andDifference:result1 andDifference:0 andDifference:0];
    
}

- (void) twoFive : (NSMutableArray*) chordsArray withChordList:(ChordList *)chordList

{
    NSArray *progressions = [NSArray arrayWithObjects:@"-", @"7", nil];
    NSString *string = @" II V";
    float result1 = 2.5;
    [self diatonicAnalyzer:progressions fromArray:chordsArray withChordList:chordList withIndex:0 andName:string andDifference:result1 andDifference:0 andDifference:0];
    
}

- (BOOL) oneFourTwoFive : (NSMutableArray*) chordsArray withChordList:(ChordList *)chordList

{
    NSArray *progressions = [NSArray arrayWithObjects:@"maj", @"maj", @"-", @"7", nil];
    NSString *string = @" I IV II V";
    float result1 = 2.5;
    float result2 = 4.5;
    float result3 = 2.5;
    [self diatonicAnalyzer:progressions fromArray:chordsArray withChordList:chordList withIndex:0 andName:string andDifference:result1 andDifference:result2 andDifference:result3];
    
    return doesExist;
}
//the following do not have bools because there is no opportunity to double count.
- (void) oneTwoThreeFour : (NSMutableArray*) chordsArray withChordList:(ChordList *)chordList

{
    NSArray *progressions = [NSArray arrayWithObjects:@"maj", @"-", @"-", @"maj", nil];
    NSString *string = @" I II III IV";
    float result1 = 1.0;
    float result3 = 0.5;
    [self diatonicAnalyzer:progressions fromArray:chordsArray withChordList:chordList withIndex:0 andName:string andDifference:result1 andDifference:result1 andDifference:result3];
    
}

-(void) fourThreeTwoOne:(NSMutableArray*)chordsArray withChordList:(ChordList *)chordList

{
    NSArray *progressions = [NSArray arrayWithObjects:@"maj", @"-", @"-", @"maj", nil];
    NSString *string = @" IV III II I";
    float result1 = 5.5;
    float result2 = 5.0;
    [self diatonicAnalyzer:progressions fromArray:chordsArray withChordList:chordList withIndex:3 andName:string andDifference:result1 andDifference:result2 andDifference:result2];
}

- (BOOL) oneSixTwoFive : (NSMutableArray*) chordsArray withChordList:(ChordList *)chordList

{
    NSArray *progressions = [NSArray arrayWithObjects:@"maj", @"-", @"-", @"7", nil];
    NSString *string = @" I VI II V";
    float result1 = 4.5;
    float result2 = 2.5;
    float result3 = 2.5;
    [self diatonicAnalyzer:progressions fromArray:chordsArray withChordList:chordList withIndex:0 andName:string andDifference:result1 andDifference:result2 andDifference:result3];
    return doesExist;
}

#pragma mark - Minor Diatonic Progressions
//the same as above except this progression is in a different musical category. programmatically it functions identically

-(void) minorTwoFiveOne:(NSMutableArray*)chordsArray withChordList:(ChordList *)chordList

{
    NSArray *progressions = [NSArray arrayWithObjects:@"ø", @"7b9", @"-", nil];
    NSString *string = @" VII III VI";
    float result1 = 2.5;
    float result2 = 2.5;
    [self diatonicAnalyzer:progressions fromArray:chordsArray withChordList:chordList withIndex:2 andName:string andDifference:result1 andDifference:result2 andDifference: 0];
}

#pragma mark - General Diatonic Analyzer
- (void) diatonicAnalyzer:(NSArray*)progression fromArray:(NSMutableArray*)chordsArray withChordList:(ChordList *)chordList withIndex:(int)x andName:(NSString*) name andDifference:(float) result1 andDifference:(float)result2 andDifference:(float) result3

{
    //object declarations/allocations
    NSMutableArray *chordLetters = [NSMutableArray array]; //holds letter names of chords w/o symbol. Used to create the key for the Diatonic Dictionary
    
    NSMutableArray *boolArray = [NSMutableArray array]; //holds whether individual progressions pass the letter check
    
    NSUInteger buffer = progression.count - 1; //Creates a buffer to prevent NSRangeException
    
    //Step 1: identify if there is a diatonic progression and if so put letter names of chords into chordLetters
    
    [self chordSymbolCheck:chordsArray lettersInto:chordLetters withBuffer:buffer andProgression:progression];
    
    //Step 2: check letters.
    
    [self stepTwo:chordLetters intoArray:boolArray withCondition:progression andBuffer:buffer andDifference:result1 andDifference:result2 andDifference:result3];
    
    [self removeObjectUponNo:boolArray withArray:chordLetters arrayWithSymbols:chordsArray andProgression:progression andBuffer:buffer];
    
    NSUInteger y = chordLetters.count;
    
    
    for (NSUInteger i = 0; i + buffer < y; i = i + progression.count) {

        for (int j = 0; j < progression.count; j++) {
            
            Chord* chord = chordList.chordList[i+j];
            NSString* string = [chord.scales stringByAppendingString:@", "];

            string = [string stringByAppendingString:[self.diatonicDictionary objectForKey:[chordLetters[i+x] stringByAppendingString:name]]];
            
            chord.scales = string;
            [chordList.chordList replaceObjectAtIndex:i+j withObject:chord];
        }
    }
    
    
    if ([name isEqualToString:@" II V I"] || [name isEqualToString:@" I IV II V"] || [name isEqualToString:@" I VI II V"]) {
        
        if (chordLetters.count > 0) { //Bool return value used for preventing duplicate tests being done.
            doesExist = YES;
        }
    
        else {
            doesExist = NO;
        }
    }
}

- (void) chordSymbolCheck :(NSMutableArray*) chordsArray lettersInto: (NSMutableArray*)chordLetters withBuffer: (NSUInteger) buffer andProgression:(NSArray*) progression

{
    for (int i = 0; i + buffer < chordsArray.count; i++) {
        NSMutableArray *chord = [NSMutableArray array];
        for (int j = 0; j < progression.count; j++) {
            NSArray *temp = [chordsArray[i+j] componentsSeparatedByString:progression[j]]; //does chord symbol match progression?
            if (temp.count < 2 ) {
                break; //if not, break and start over
            }
            [chord addObject:[temp objectAtIndex:0]]; //if yes, then add the letter name of the chord, without symbol, to (NSArray*) chord.
            
            if (j+1 == progression.count) { //if all chord symbols match progression and all chords have been tested, then add the chord names
                for (NSString *str in chord) {
                    [chordLetters addObject:str];
                }
            }
        }
    }
}

-(void) stepTwo: (NSMutableArray*)chordLetters intoArray:(NSMutableArray*)boolArray withCondition:(NSArray*)progression andBuffer:(NSUInteger)buffer andDifference:(float) result1 andDifference:(float)result2 andDifference:(float) result3

{
    //will compare one chord to next, if all tests match paramaters then add YES to boolArray. Otherwise, add NO to boolArray.
    
    for (NSUInteger i = 0; i + buffer < chordLetters.count; i = i + progression.count) {
        NSMutableArray *temp = [NSMutableArray array]; //stores the chords that are being tested

        //put chords in one progression into temp
        for (NSUInteger j = i; j < progression.count + i; j++) {
            [temp addObject:[chordLetters objectAtIndex:j]];
        }
        //depending on the length of temp, retrieve the numerical values for each and test if the difference between pair of subsequent chords matches the difference in the progression. if so, add true to the boolArray. otherwise add false.
        if (temp.count == 2)
        {
            NSNumber *number1 = [self.chromaticDictionary objectForKey:temp[0]];
            NSNumber *number2 = [self.chromaticDictionary objectForKey:temp[1]];
            
            float newNumber1 = number1.floatValue;
            float newNumber2 = number2.floatValue;

            while (newNumber1 > newNumber2)
            {
                newNumber2 += 6;
            }
            
            float firstResult = newNumber2 - newNumber1;
            if (firstResult == result1)
            {
                [boolArray addObject:[NSNumber numberWithBool:true]];
            }
            else
            {
                [boolArray addObject:[NSNumber numberWithBool:false]];
                [chordLetters removeAllObjects];

            }
            
        }
        
        else if (temp.count == 3)
        {
            NSNumber *number1 = [self.chromaticDictionary objectForKey:temp[0]];
            NSNumber *number2 = [self.chromaticDictionary objectForKey:temp[1]];
            NSNumber *number3 = [self.chromaticDictionary objectForKey:temp[2]];
            
            float newNumber1 = number1.floatValue;
            float newNumber2 = number2.floatValue;
            float newNumber3 = number3.floatValue;

            while (newNumber1 > newNumber2)
            {
                newNumber2 += 6;
            }
            while (newNumber2 > newNumber3)
            {
                newNumber3 += 6;
            }
            float firstResult = newNumber2 - newNumber1;
            float secondResult = newNumber3 - newNumber2;
            
            if (firstResult == result1 && secondResult == result2)
            {
                [boolArray addObject:[NSNumber numberWithBool:true]];
            }
            else
            {
                [boolArray addObject:[NSNumber numberWithBool:false]];
                [chordLetters removeAllObjects];

            }

        }
        else if (temp.count == 4)
        {
            NSNumber *number1 = [self.chromaticDictionary objectForKey:temp[0]];
            NSNumber *number2 = [self.chromaticDictionary objectForKey:temp[1]];
            NSNumber *number3 = [self.chromaticDictionary objectForKey:temp[2]];
            NSNumber *number4 = [self.chromaticDictionary objectForKey:temp[3]];
            
            float newNumber1 = number1.floatValue;
            float newNumber2 = number2.floatValue;
            float newNumber3 = number3.floatValue;
            float newNumber4 = number4.floatValue;

            while (newNumber1 > newNumber2)
            {
                newNumber2 += 6;
            }
            while (newNumber2 > newNumber3)
            {
                newNumber3 += 6;
            }
            while (newNumber3 > newNumber4)
            {
                newNumber4 += 6;
            }
            
            float firstResult = newNumber2 - newNumber1;
            float secondResult = newNumber3 - newNumber2;
            float thirdResult = newNumber4 - newNumber3;
            
            if (firstResult == result1 && secondResult == result2 && thirdResult == result3)
            {
                [boolArray addObject:[NSNumber numberWithBool:true]];
            }
            else
            {
                [boolArray addObject:[NSNumber numberWithBool:false]];
                [chordLetters removeAllObjects];
            }

        }
        else
        {
            
        }
    }
}

// If the chords failed the test, and a false was added to the boolArray, then this method removes the chords being tested and only keeps those chords that exhibit the pattern.
- (void) removeObjectUponNo:(NSMutableArray*)boolArray withArray:(NSMutableArray*)chordLetters arrayWithSymbols:(NSMutableArray*)chordsArray andProgression:(NSArray*)progression andBuffer: (NSUInteger) buffer

{
    for (NSUInteger i = 0; i + buffer < chordLetters.count; i = i + progression.count) {
        
        for (NSNumber *number in boolArray) {//go through boolArray. if it encounters a NO, then remove objects. otherwise, move pointer to next progression and check for NO in boolArray again.
            if (number.boolValue == NO) {
                for (int j = 0; j < progression.count; j++) {
                    [chordLetters removeObjectAtIndex:i];
                    [chordsArray removeObjectAtIndex:i];
                }
            }
            else {
                i = i + progression.count;
            }
        }
    }
}

@end