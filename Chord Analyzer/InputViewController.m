//
//  InputViewController.m
//  Music App
//
//  Created by Tapan Srivastava on 7/26/14.
//  Copyright (c) 2014 Tapan Srivastava. All rights reserved.
//

#import "InputViewController.h"
#import "ChordToScale.h"
#import "DisplayAnalyzedChords.h"
#import "Chord.h"
@interface InputViewController ()

@end


@implementation InputViewController
{
    ChordToScale *chordToScale;
}
#pragma mark - Instance names
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
-(void) viewDidAppear:(BOOL)animated
{
    self.chordList = [[ChordList alloc] init];

}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
}

-(void) viewDidDisappear:(BOOL)animated //clear the input text field and clear all the arrays because the information has been passed into next viewController class
{
    self.chords.text = @"";
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Analyze Methodss
- (IBAction)analyzeChanges:(id)sender
{
    ChordList *temporaryChordList = [[ChordList alloc] init];
    if (self.chords.text.length == 0){
        self.chords.text = @"<empty>";
    }
    
    NSMutableArray *chordStringArray = [NSMutableArray arrayWithArray:[[self.chords.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];

    for (NSString *string in chordStringArray)
    {
        Chord *chord = [[Chord alloc]init];
        chord.chordName = string;//replace back
        [temporaryChordList.chordList addObject:chord];
    }
    
    
    chordToScale = [ChordToScale createChangesWithDictionary];
    self.chordList = [chordToScale analyze:temporaryChordList];

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
 
    if ([segue.identifier isEqualToString:@"Analyze"]) {
        DisplayAnalyzedChords *dac = (DisplayAnalyzedChords*) segue.destinationViewController;
        
        ChordList *chordList = self.chordList;
        
        dac.chordList = chordList;
        
        dac.inputText = self.chords.text;
    }
}


@end
