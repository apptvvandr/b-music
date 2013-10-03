//
//  PlayButtonCell.m
//  LaMusique
//
//  Created by Sergey P on 25.08.13.
//  Copyright (c) 2013 Sergey P. All rights reserved.
//

#import "PlayButtonCell.h"

@implementation PlayButtonCell{
    NSTrackingArea * trackingArea;
}

- (void)drawRect:(NSRect)dirtyRect
{
    dirtyRect.size.width-=2;
    dirtyRect.size.height-=2;
    
    double x1=dirtyRect.size.width;
    double y1=dirtyRect.size.height;
    double x0=dirtyRect.origin.x;
    double y0=dirtyRect.origin.y;
    
    double t=2;
    double p=15;
    
    CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
    
    if ([self.cell isHighlighted]) {
        CGContextSetStrokeColorWithColor(ctx, CGColorCreateGenericRGB(120/255.0, 120/255.0, 120/255.0, 1));
        CGContextSetRGBFillColor (ctx, 120/255.0, 120/255.0, 120/255.0, 1);
    }else{
        CGContextSetStrokeColorWithColor(ctx, CGColorCreateGenericRGB(150/255.0, 150/255.0, 150/255.0, 1));
        CGContextSetRGBFillColor (ctx, 150/255.0, 150/255.0, 150/255.0, 1);
    }
    
    CGContextSetAlpha(ctx, 0.5);
    
    CGContextSetLineWidth(ctx, t);
    CGContextStrokeEllipseInRect(ctx, CGRectMake(t/2, t/2, x1-t, y1-t));
    
    if(_pause){
        CGContextFillRect (ctx, CGRectMake (x0+p, y0+p, (x1-p*2)/3, y1-p*2 ));
        CGContextFillRect (ctx, CGRectMake (x0+p+(x1-p*2)*2/3, y0+p, (x1-p*2)/3, y1-p*2 ));
    }else{
        CGContextMoveToPoint(ctx, x0+p, y0+p);
        CGContextAddLineToPoint(ctx, x0+p , y1-p);
        CGContextAddLineToPoint(ctx, x1-p/1.1 , y1/2);
        CGContextClosePath(ctx);
    }
    
    CGContextFillPath(ctx);
}

-(void) setPause:(BOOL)state{
    _pause=state;
    [self setNeedsDisplay:YES];
}

-(void)mouseEntered:(NSEvent *)theEvent {
    [[self animator] setAlphaValue:1.0];
    [self setNeedsDisplay:YES];
}

-(void)mouseExited:(NSEvent *)theEvent
{
    [[self animator] setAlphaValue:0.5];
    [self setNeedsDisplay:YES];
}

-(void)updateTrackingAreas
{
    if(trackingArea != nil) {
        [self removeTrackingArea:trackingArea];
    }
    trackingArea = [ [NSTrackingArea alloc] initWithRect:[self bounds]
                                                 options:(NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways)
                                                   owner:self
                                                userInfo:nil];
    [self addTrackingArea:trackingArea];
}

@end