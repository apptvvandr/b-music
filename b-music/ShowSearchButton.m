//
//  ShowSearchButton.m
//  LaMusique
//
//  Created by Sergey P on 29.08.13.
//  Copyright (c) 2013 Sergey P. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  1. The above copyright notice and this permission notice shall be included
//     in all copies or substantial portions of the Software.
//
//  2. This Software cannot be used to archive or collect data such as (but not
//     limited to) that of events, news, experiences and activities, for the
//     purpose of any concept relating to diary/journal keeping.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "ShowSearchButton.h"

@implementation ShowSearchButton{
    BOOL _flag;
}

#define kRed 50
#define kGreen 50
#define kBlue 50


#define kRed1 60
#define kGreen1 60
#define kBlue1 60



#define kRedH 48
#define kGreenH 98
#define kBlueH 144


#define kRedH1 36
#define kGreenH1 72
#define kBlueH1 105


- (void)drawRect:(NSRect)dirtyRect
{
    dirtyRect.size.width-=2;
    dirtyRect.size.height-=2;
    
    CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
    
    if (_flag) {
        if ([self.cell isHighlighted]) {
            CGContextSetStrokeColorWithColor(ctx, [NSColor colorWithSRGBRed:kRedH1/255.0 green:kGreenH1/255.0 blue:kBlueH1/255.0 alpha:1].CGColor);
            CGContextSetRGBFillColor (ctx, kRedH1/255.0, kGreenH1/255.0, kBlueH1/255.0, 1);
        }else{
            CGContextSetStrokeColorWithColor(ctx, [NSColor colorWithSRGBRed:kRedH/255.0 green:kGreenH/255.0 blue:kBlueH/255.0 alpha:1].CGColor);
            CGContextSetRGBFillColor (ctx, kRedH/255.0, kGreenH/255.0, kBlueH/255.0, 1);
        }
    }else{
        if ([self.cell isHighlighted]) {
            CGContextSetStrokeColorWithColor(ctx, [NSColor colorWithSRGBRed:kRed/255.0 green:kGreen/255.0 blue:kBlue/255.0 alpha:1].CGColor);
            CGContextSetRGBFillColor (ctx, kRed/255.0, kGreen/255.0, kBlue/255.0, 1);
        }else{
            CGContextSetStrokeColorWithColor(ctx, [NSColor colorWithSRGBRed:kRed1/255.0 green:kGreen1/255.0 blue:kBlue1/255.0 alpha:1].CGColor);
            CGContextSetRGBFillColor (ctx, kRed1/255.0, kGreen1/255.0, kBlue1/255.0, 1);
        }
    }
    
    double px=2;
    double py=2;
    double x1=dirtyRect.size.width-px;
    double y1=dirtyRect.size.height-py;
    double t=2.1;
    
    
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    CGContextAddEllipseInRect(ctx, CGRectMake(t, t, x1*0.6, y1*0.6));
    CGContextSetLineWidth(ctx, t);
    CGContextStrokePath(ctx);
    
    CGContextSetLineWidth(ctx, t);
    CGContextMoveToPoint(ctx, x1*0.6+t/2, y1*0.6+t/2);
    CGContextAddLineToPoint(ctx, x1-t, y1-t);
    
    CGContextStrokePath(ctx);
}

-(void) setFlag:(BOOL)flag{
    _flag=flag;
    [self setNeedsDisplay:YES];
}

@end
