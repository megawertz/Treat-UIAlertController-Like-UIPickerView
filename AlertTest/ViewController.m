//
//  ViewController.m
//  AlertTest
//
//  Created by Jason Wertz on 8/4/15.
//  Copyright (c) 2015 Jason Wertz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIAlertController *filterView;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;

@property (nonatomic, strong) NSArray *data;

- (IBAction)launchFilter:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *items = @[@"Unfiltered",@"2015",@"2014",@"2013",@"2012",@"2011",@"2010",@"2009",@"2008",@"2007",@"2006",@"2005",@"2004",@"2003",@"2002"];
    
    self.data = items;
    
    int i = 0;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Filter Data" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (NSString *item in items) {
        UIAlertAction* defaultAction = [UIAlertAction
                                  actionWithTitle:item
                                            style:UIAlertActionStyleDefault
                                          handler:^(UIAlertAction * action) {
                                            [self didSelectRowInAlertController:i];
                                          }];
        
        [alert addAction:defaultAction];
        i++;
    }

    self.filterView = alert;

}

-(void)didSelectRowInAlertController:(NSInteger)row {
    self.outputLabel.text = [self.data objectAtIndex:row];
}

- (IBAction)launchFilter:(id)sender {
    [self presentViewController:self.filterView animated:YES completion:nil];
}


@end
