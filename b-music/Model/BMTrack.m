//
//  BMTrack.m
//  b-music
//
//  Created by Sergey P on 31.03.16.
//  Copyright © 2016 Sergey Popov. All rights reserved.
//

#import "BMTrack.h"

@implementation BMTrack

- (instancetype)initWithServerResponse:(NSDictionary *)response
{
    self = [super init];
    if (self)
    {
        NSNumber *identfier = nil;
        if ((identfier = [response objectForKey:@"id"]) && [identfier isKindOfClass:[NSNumber class]])
        {
            _identifier = identfier.unsignedIntegerValue;
        }
        
        NSString *artist = nil;
        if ((artist = [response objectForKey:@"artist"]) && [artist isKindOfClass:[NSString class]])
        {
            _artist = artist;
        }
        
        NSString *title = nil;
        if ((title = [response objectForKey:@"title"]) && [title isKindOfClass:[NSString class]])
        {
            _title = title;
        }
    }
    return self;
}

@end
