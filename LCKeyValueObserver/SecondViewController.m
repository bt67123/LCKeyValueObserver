//
//  SecondViewController.m
//  LCKeyValueObserver
//
//  Created by lcj on 16/8/8.
//  Copyright © 2016年 lcj. All rights reserved.
//

#import "SecondViewController.h"
#import "LabColor.h"
#import "LCKeyValueObserverCenter.h"

@interface SecondViewController ()

@property (nonatomic, strong) LabColor *labColor;
@property (strong, nonatomic) IBOutlet UISlider *lSlider;
@property (strong, nonatomic) IBOutlet UISlider *aSlider;
@property (strong, nonatomic) IBOutlet UISlider *bSlider;
@property (strong, nonatomic) IBOutlet UIView *colorView;

@end

@implementation SecondViewController

- (void)dealloc {
    NSLog(@"SecondViewController dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.labColor = [[LabColor alloc] init];
}

- (void)setLabColor:(LabColor *)labColor {
    _labColor = labColor;
    [[LCKeyValueObserverCenter sharedInstance] lc_addObserveObject:labColor keyPath:@"color" target:self selector:@selector(colorDidChange:)];
    self.lSlider.value = self.labColor.lComponent;
    self.aSlider.value = self.labColor.aComponent;
    self.bSlider.value = self.labColor.bComponent;
}

- (IBAction)updateLComponent:(UISlider *)sender {
    self.labColor.lComponent = sender.value;
}

- (IBAction)updateAComponent:(UISlider *)sender {
    self.labColor.aComponent = sender.value;
}

- (IBAction)updateBComponent:(UISlider *)sender {
    self.labColor.bComponent = sender.value;
}

- (void)colorDidChange:(NSDictionary *)change {
    self.colorView.backgroundColor = self.labColor.color;
}
@end
