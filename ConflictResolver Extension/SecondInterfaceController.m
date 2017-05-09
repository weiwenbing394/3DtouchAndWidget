//
//  SecondInterfaceController.m
//  DaJiaBaoMall
//
//  Created by 大家保 on 2017/5/9.
//  Copyright © 2017年 大家保. All rights reserved.
//

#import "SecondInterfaceController.h"

@interface SecondInterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *changeImage;

@end

@implementation SecondInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
}

- (void)willActivate {
   
    [super willActivate];
}

- (void)didDeactivate {
    
    [super didDeactivate];
}


- (IBAction)changeImageClick {
    [self.changeImage setImageNamed:@"action"];
    [self.changeImage startAnimatingWithImagesInRange:NSMakeRange(0, 3) duration:0.3 repeatCount:3];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSInteger imageNumber=arc4random()%3;
        [self.changeImage setImageNamed:[NSString stringWithFormat:@"action%d",imageNumber]];
    });;
}

@end



