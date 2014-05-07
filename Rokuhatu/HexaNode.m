#import "HexaNode.h"

@interface HexaNode(){
    float Period;
}
@end

@implementation HexaNode

//六角形の半径
#define radius 40
#define HexaCount 98

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(float)RePeriod{
    return Period;
}
-(void)InPeriod :(float)Per{
    Period = Per;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(radius * cos(0), 3/2 * radius * sin(0))];
    for (int i=1; i<6; i++) {
        float x = radius * cos(M_PI/3 *i);
        float y = 3/2 * radius * sin(M_PI/3*i);
        [path addLineToPoint:CGPointMake(x, y)];
        
        
    }
    [path closePath];
    
    float rand = random()%100 * 0.01;
    UIColor *color = [UIColor colorWithHue:rand saturation:1 brightness:1 alpha:0.3];
    
    CAShapeLayer *Layer = [CAShapeLayer layer];
    Layer.name = @"layer";
    Layer.lineWidth = 5;
    Layer.strokeColor = [UIColor whiteColor].CGColor;
    Layer.fillColor = color.CGColor;
    Layer.path = path.CGPath;
    
    //UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 5)];
    //view.backgroundColor = [UIColor whiteColor];
    
    
    
    [self.layer addSublayer:Layer];
}

@end
