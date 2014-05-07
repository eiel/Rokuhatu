#import "ViewController.h"

@interface ViewController (){
    
    NSArray *HexaArray;
}

@end

@implementation ViewController

//六角形の半径
#define radius 40
#define HexaCount 98

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIColor *color = [UIColor redColor];
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    NSLog(@"red: %f, green: %f, blue: %f", red, green, blue);
    
    
    NSTimer *myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                               target:self
                                             selector:@selector(update)
                                             userInfo:nil
                                              repeats:YES];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i=0; i<HexaCount; i++) {
        int x = i%7;
        int y = (int)i/7;
    
        UIView *Hexa = [self createHexa];
        Hexa.tag = [[NSString stringWithFormat:@"%d%d",y,x] intValue];
        NSLog(@"%d",Hexa.tag);
        
        if (i%2) Hexa.center = CGPointMake(x*(radius*3/2), y*1.732/2*radius);
        else Hexa.center = CGPointMake(x*(radius*3/2), y*1.732/2*radius+1.732/2*radius);
        
        
        [array addObject:Hexa];
        [self.view addSubview:Hexa];
        
    }
    HexaArray = array;
    
    /*
     //タッチイベントを起こしたい場合
    for (UIView *v in self.view.subviews) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [v addGestureRecognizer:tap];
    }
     */
    

   
}

-(UIView *)createHexa{
    

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
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 5)];
    //view.backgroundColor = [UIColor whiteColor];
    

    
    [view.layer addSublayer:Layer];
    
    
    return view;
}
//更新
- (void)update{
    static int time;
    
    
    if (time%60) {
        for (int i=1; i<HexaCount; i++) {
            int x = i%7;
            int y = (int)i/7;
            int tag = [[NSString stringWithFormat:@"%d%d",y,x] intValue];
            UIView *hexa = (UIView*)[self.view viewWithTag:tag];
            CAShapeLayer *Layer = [hexa.layer.sublayers objectAtIndex:0];
            
    

            
            for (int i=0; i<HexaCount; i++) {
                UIView *HView = HexaArray[i];
                CGPoint me = hexa.center;
                CGPoint AtHexa = HView.center;
                
                float x = me.x-AtHexa.x;
                float y = me.y-AtHexa.y;
                
                float distans = sqrtf(x*x+y*y);
                
                if (distans<100) {
                    CAShapeLayer *HLayer =[HView.layer.sublayers objectAtIndex:0];
                    CGColorRef Hcolor = HLayer.fillColor;
                    
                    //Layer.fillColor = Hcolor;
                }
            }
            
            
            float rand = random()%100 * 0.01;
            UIColor *color = [UIColor colorWithHue:rand saturation:1 brightness:1 alpha:0.3];
            Layer.fillColor = color.CGColor;
        }

        

        
    }
    
    
    time++;
}




- (void)tap:(UIGestureRecognizer*)gr
{
    NSLog(@"たたった");
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //UITouch *touch = [touches anyObject];
    //CGPoint location = [touch locationInView:self.view];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
