//
//  ViewController.m
//  AudioPlayerDemo
//
//  Created by Krupa-iMac on 07/03/15.
//  Copyright (c) 2015 TheAppGuruz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"sound" ofType:@"mp3"]] error:&error];
    if (error) {
        NSLog(@"Error : %@", [error localizedDescription]);
    } else {
        [audioPlayer prepareToPlay];
    }
}

- (IBAction)btnPlayClicked:(id)sender
{
    [audioPlayer play];
}

- (IBAction)btnStopClicked:(id)sender
{
    if (audioPlayer) {
        [audioPlayer stop];
    }
}

- (IBAction)sliderVolumeChanged:(id)sender
{
    if (audioPlayer) {
        audioPlayer.volume = [(UISlider *)sender value];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
