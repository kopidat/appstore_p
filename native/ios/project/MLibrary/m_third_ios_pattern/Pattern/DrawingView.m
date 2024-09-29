//
//  DrawingView.m
//  MOBILE_KOREA_MAIL.iOS
//
//  Created by kang on 2017. 9. 14..
//
//

#import "DrawingView.h"

@interface DrawingView ()
@property (nonatomic, strong) NSArray *pointsArray;
@property (nonatomic, strong) UIColor *lineColor;
@end

@implementation DrawingView

- (instancetype)initWithPoints:(NSArray *)points {
    if (self = [super init]) {
        _pointsArray = points;
        //        _lineColor = [UIColor blueColor];
        _lineColor = [UIColor colorWithRed:204.0/255.0f green:204.0/255.0f blue:204.0/255.0f alpha:0.5f];
        [self setClearsContextBeforeDrawing:YES];
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)markInvalid {
    self.lineColor = [UIColor colorWithRed:230.0/255.0f green:95.0/255.0f blue:63.0/255.0f alpha:0.5f];
    [self setNeedsDisplay];
}

- (void)reset {
    self.pointsArray = @[];
    self.lineColor = [UIColor colorWithRed:204.0/255.0f green:204.0/255.0f blue:204.0/255.0f alpha:0.5f];
    [self setNeedsDisplay];
}

- (void)updatePointsWithArray:(NSArray *)newPoints {
    self.pointsArray = newPoints;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (self.pointsArray.count > 1) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineJoinStyle = kCGLineJoinRound;
        [path setLineWidth:5.5];
        CGPoint origin = [[self.pointsArray firstObject] CGPointValue];
        [path moveToPoint:origin];
        
        for (NSValue *pointValue in self.pointsArray) {
            CGPoint next = [pointValue CGPointValue];
            [path addLineToPoint:next];
        }
        
        [self.lineColor setStroke];
        [path stroke];
    }
}

@end
