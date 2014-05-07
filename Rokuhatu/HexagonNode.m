#import "HexagonNode.h"

@implementation HexagonNode

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //半径
        int r = 25;
        
        
        UIView *Hexa = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        Hexa.backgroundColor = [UIColor redColor];
        CAShapeLayer *Layer = [CAShapeLayer alloc]
        
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        for (int i=0; i<6; i++) {
            float x = r * cos(M_PI/3 *i);
            float y = 3/2 * r * sin(M_PI/3*i);
            [path addLineToPoint:CGPointMake(x, y)];
            
           
            
        }
        
        
        
        
        self = Hexa;
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}


@end
