//
//  CGGeometry+FFAdditions.h
//  FFToolkit
//
//  Created by Forrest Ye on 8/8/13.
//  Copyright (c) 2013 Forrest Ye. All rights reserved.
//


static inline CGPoint CGPointOffset(CGPoint p, CGFloat x, CGFloat y) {
  p.x += x; p.y += y; return p;
}
