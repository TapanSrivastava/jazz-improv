//
//  ProjectDisplay.m
//  Music App
//
//  Created by Tapan Srivastava on 8/11/14.
//  Copyright (c) 2014 Tapan Srivastava. All rights reserved.
//

#import "ProjectDisplay.h"
#import "DisplayAnalyzedChords.h"
#import "ChordToScale.h"
#import "ChordList.h"
#import "Chord.h"
@interface ProjectDisplay ()

@end

@implementation ProjectDisplay

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.projectNames = [NSMutableArray arrayWithArray:[defaults objectForKey:@"ChordAnalyzerProjectNames"]];
    self.projectValues = [NSMutableArray arrayWithArray:[defaults objectForKey:@"ChordAnalyzerProjectValues"]];
    
    [self.tableView reloadData];

}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    self.projectNames = [NSMutableArray arrayWithArray:[defaults objectForKey:@"ChordAnalyzerProjectNames"]];
//    self.projectValues = [NSMutableArray arrayWithArray:[defaults objectForKey:@"ChordAnalyzerProjectValues"]];
    return self.projectNames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    

    cell.textLabel.text = [self.projectNames objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView beginUpdates];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Do whatever data deletion you need to do...
        // Delete the row from the data source
        
        [self.projectNames removeObjectAtIndex:indexPath.row];
        [self.projectValues removeObjectAtIndex:indexPath.row];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.projectNames forKey:@"ChordAnalyzerProjectNames"];
        [defaults setObject:self.projectValues forKey:@"ChordAnalyzerProjectValues"];
        [defaults synchronize];
        
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:NO];
    }
    [tableView endUpdates];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
// Using faulty logic. TODO: Rewrite without using NSDictionary as storage mechanism 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([segue.identifier isEqualToString:@"ProjectChordsDisplay"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSString *initialChordInput = [self.projectValues objectAtIndex:indexPath.row];
        
        ChordToScale *tempChord = [ChordToScale createChangesWithDictionary];
        ChordList* chordList = [[ChordList alloc]init];

        NSMutableArray *chordsArray = [NSMutableArray arrayWithArray:[[initialChordInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
        
        for (NSString *string in chordsArray)
        {
            Chord *chord = [[Chord alloc]init];
            chord.chordName = string;//replace back
            [chordList.chordList addObject:chord];
        }
        
        NSMutableArray *array = [NSMutableArray array];
        
        if (chordList.chordList.count > 0){
            
            for (int i = 0; i < chordList.chordList.count; i++) { //put the individual chords into the array
                Chord* chord = chordList.chordList[i];
                
                [array addObject:chord.chordName];
                NSString *valueString = [tempChord.chordToScale objectForKey:chord.chordName];
                if (!valueString){
                    valueString = @"Invalid Chord";
                }
                chord.scales = valueString;
                
                [chordList.chordList replaceObjectAtIndex:i withObject:chord];
            }
            
            
            BOOL test1 = [tempChord twoFiveOne:array withChordList:chordList];
            BOOL test2 = [tempChord oneSixTwoFive:array withChordList:chordList];
            BOOL test3 = [tempChord oneFourTwoFive:array withChordList:chordList];
            
            if (!test1 && !test2 && !test3) {
                [tempChord twoFive:array withChordList:chordList];
                [tempChord fiveOne:array withChordList:chordList];
            }
            
            [tempChord oneTwoThreeFour:array withChordList:chordList];
            [tempChord fourThreeTwoOne:array withChordList:chordList];
            [tempChord minorTwoFiveOne:array withChordList:chordList];
            
        }
        
        DisplayAnalyzedChords *dac = (DisplayAnalyzedChords*) segue.destinationViewController;

        dac.chordList = chordList;
        
    }
    
}

@end
