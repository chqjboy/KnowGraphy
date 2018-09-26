
#import "DrawRectView.h"

@implementation DrawRectView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:COLOR_WHITE];
    self.tip = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/4, frame.size.height/4, frame.size.width/2, frame.size.height/2)];
    [self.tip setBackgroundColor:COLOR_CLEAR];
    [self.tip setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:self.tip];
    return self;
}
-(void)drawRect:(CGRect)rect
{
    [self defDrawRect:rect];
    [self originalDrawRect:rect];
    [self directDrawRect:rect];
    [self bezierDrawRect:rect];
    [self curve_originalDrawRect:rect];
    [self curve_directDrawRect:rect];
    [self roundrectDrawRect:rect];
    [self sectorDrawRect:rect];
    [self statelineDrawRect:rect];
    [self matrixDrawRect:rect];
//    [self watermarkDrawRect:rect];
//    [self imagecutDrawRect:rect];
//    [self viewsaveDrawRect:rect];
}
-(void)setType:(eDrawRectType)type
{
    _type = type;
    if (eDrawRectType_imagecut==type)
    {
        [self imagecutDrawRect:self.bounds];
    }else if(eDrawRectType_watermark==type)
    {
        [self watermarkDrawRect:self.bounds];
    }else if(eDrawRectType_viewsave==type)
    {
        [self viewsaveDrawRect:self.bounds];
    }else
    {
        [self setNeedsDisplay];
    }
}
-(void)defDrawRect:(CGRect)rect
{
    if (self.type!=eDrawRectType_def) return;
}

-(void)originalDrawRect:(CGRect)rect
{
    if (self.type!=eDrawRectType_original) return;
    
    // 1. 获取当前控件的图形上下文
    // CG:表示这个类在CoreGraphics框架里  Ref:引用
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 2. 描述绘画内容
    //    a. 创建图形路径
    CGMutablePathRef path = CGPathCreateMutable();
    //    b. 创建图形起始点
    CGPathMoveToPoint(path, NULL, 50, 50);
    //    c. 添加图形的终点
    CGPathAddLineToPoint(path, NULL, 200, 50);
    // 3. 把绘画内容添加到图形上下文
    CGContextAddPath(context, path);
    // 4. 设置图形上下文的状态（线宽、颜色等）
    CGContextSetLineWidth(context, 5);
    CGContextSetRGBStrokeColor(context, 0, 1, 0, 1);
    // 5. 渲染图形上下文
    CGContextStrokePath(context);
}
-(void)directDrawRect:(CGRect)rect
{
    if (self.type!=eDrawRectType_direct) return;
    
    // 1. 获取当前控件的图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 2. 描述绘画内容
    // a. 创建图形起始点
    CGContextMoveToPoint(context, 20, 50);
    // b. 添加图形的终点
    CGContextAddLineToPoint(context, 200, 150);
    CGContextAddLineToPoint(context, 200, 55);
    
    // 3. 设置图形上下文的状态（线宽、颜色等）
    CGContextSetLineWidth(context, 5);
    CGContextSetCMYKStrokeColor(context, 0, 1, 1, 0, 1);
    
    // 4. 渲染图形上下文
    CGContextStrokePath(context);
}
-(void)bezierDrawRect:(CGRect)rect
{
    if (self.type!=eDrawRectType_bezier) return;
    
    // 1. 创建贝瑟尔路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 2. 设置起点
    [path moveToPoint:CGPointMake(20, 20)];
    
    // 3. 设置终点
    [path addLineToPoint:CGPointMake(80, 150)];
    
    // 4. 设置路径状态
    // 设置颜色
    [[UIColor redColor] set];
    // 设置线宽
    [path setLineWidth:5];
    
    // 4. 绘制路径
    [path stroke];
    
    // 1. 创建贝瑟尔路径
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    
    // 2. 设置起点
    [path1 moveToPoint:CGPointMake(50, 20)];
    
    // 3. 设置拐点
    [path1 addLineToPoint:CGPointMake(200, 100)];
    
    // 3. 设置终点
    [path1 addLineToPoint:CGPointMake(50, 230)];
    
    // 4. 设置路径状态
    // 设置颜色
    [[UIColor blueColor] set];
    // 设置线宽
    [path1 setLineWidth:15];
    // 设置连接样式
    [path1 setLineJoinStyle:kCGLineJoinRound];
    // 设置顶角样式
    [path1 setLineCapStyle:kCGLineCapRound];
    
    // 4. 绘制路径
    [path1 stroke];
}
-(void)curve_originalDrawRect:(CGRect)rect
{
    if (self.type!=eDrawRectType_curve_original) return;
    
    // 1. 获取当前控件的图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 2. 描述绘画图形内容
    // a. 获取图形路径
    CGMutablePathRef path = CGPathCreateMutable();
    // b. 添加起始点
    CGPathMoveToPoint(path, NULL, 0, 0);
    // C. 添加控制点和终点，控制点(150,150)、终点(0,250)
    CGPathAddQuadCurveToPoint(path, NULL, 250, 150, 0, 250);
    
    // 3. 把绘制图形内容添加到图形上下文
    CGContextAddPath(context, path);
    
    // 4. 设置图形上下文状态
    // 设置颜色
    [[UIColor redColor] set];
    // 设置线宽
    CGContextSetLineWidth(context, 10);
    
    // 5. 渲染图形上下文
    CGContextStrokePath(context);
}
-(void)curve_directDrawRect:(CGRect)rect
{
    if (self.type!=eDrawRectType_curve_direct) return;
    
    // 1. 获取当前控件的图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 2. 描述绘画图形内容
    // a. 创建图形起始点
    CGContextMoveToPoint(context, 0, 0);
    // b. 添加控制点和终点,控制点(300,200)，终点(0,250)
    CGContextAddQuadCurveToPoint(context, 300, 200, 0, 250);
    
    // 3. 设置图形上下文状态
    // 设置颜色
    [[UIColor redColor] set];
    // 设置线宽
    CGContextSetLineWidth(context, 10);
    
    // 4. 渲染图形上下文
    CGContextStrokePath(context);
}
-(void)roundrectDrawRect:(CGRect)rect
{
    if (self.type!=eDrawRectType_roundrect) return;
    
    // RoundedRect: 坐标与宽高
    // cornerRadius: 角半径
    UIBezierPath *oblongPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 100, 150) cornerRadius:100];
    // 颜色
    [[UIColor redColor] set];
    // 填充
    [oblongPath fill];
}
-(void)sectorDrawRect:(CGRect)rect
{
    if (self.type!=eDrawRectType_sector) return;
    
    // 扇形
    // Center：圆心
    // startAngle:弧度
    // clockwise:YES:顺时针 NO：逆时针
    CGPoint center = CGPointMake(100, 100);
    UIBezierPath *sectorPath = [UIBezierPath bezierPathWithArcCenter:center radius:50 startAngle:0 endAngle:M_PI_4 clockwise:YES];
    
    // 从终点连线到圆心
    [sectorPath addLineToPoint:center];
    
    // 颜色
    [[UIColor blueColor] set];
    
    //    // 关闭路径，从终点连线到起始点
    //    [sectorPath closePath];
    //    // 描边
    //    [sectorPath stroke];
    
    // 填充：必须是一个完整的封闭路径,默认就会自动关闭路径
    [sectorPath fill];
}
-(void)statelineDrawRect:(CGRect)rect
{
    if (self.type!=eDrawRectType_stateline) return;
    
    // 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 描述图形内容
    // 第一根线
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    
    [path1 moveToPoint:CGPointMake(50, 10)];
    [path1 addLineToPoint:CGPointMake(50, 150)];
    
    // 把第一根添加到上下文
    CGContextAddPath(context, path1.CGPath);
    
    // 保存一份初始的上下文状态
    CGContextSaveGState(context);
    
    // 设置上下文状态
    [[UIColor redColor] set];
    CGContextSetLineWidth(context, 5);
    
    // 渲染上下文
    CGContextStrokePath(context);
    
    
    // 第二根线
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    
    [path2 moveToPoint:CGPointMake(100, 10)];
    [path2 addLineToPoint:CGPointMake(100, 150)];
    
    // 添加到上下文
    CGContextAddPath(context, path2.CGPath);
    
    // 还原上下文状态
    CGContextRestoreGState(context);
    
    // 渲染上下文
    CGContextStrokePath(context);
}
-(void)matrixDrawRect:(CGRect)rect
{
    if (self.type!=eDrawRectType_matrix) return;
    
    // 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 创建路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 50, 100)];
    
    // 矩阵操作
    // 移动
    CGContextTranslateCTM(context, 100, 100);
    // 缩放
    CGContextScaleCTM(context, 1, 2);
    // 旋转
    CGContextRotateCTM(context, M_PI_4);
    
    // 把路径添加到上下文
    CGContextAddPath(context, path.CGPath);
    
    // 设置颜色
    [[UIColor blueColor] set];
    
    // 渲染上下文
    CGContextStrokePath(context);
}
-(void)watermarkDrawRect:(CGRect)rect
{
    if (self.type!=eDrawRectType_watermark) return;
    
    // 创建图片
    UIImage *logoImage = [UIImage imageNamed:@"image1"];
    
    // 1. 开启位图上下文
    // 注意: 位图上下文跟view无关联，所以不需要在drawRect中获取上下文
    // size: 位图上下文的尺寸（绘制出新图片的尺寸）
    // opaque: 是否透明，YES：不透明  NO：透明，通常设置成透明的上下文
    // scale: 缩放上下文，取值0表示不缩放，通常不需要缩放上下文
    UIGraphicsBeginImageContextWithOptions(logoImage.size, NO, 0);
    
    // 2. 描述绘画内容
    
    // 绘制原生图片
    [logoImage drawAtPoint:CGPointZero];
    
    // 绘制文字
    NSString *logo = @"水印图片";
    // 创建字典属性
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [logo drawAtPoint:CGPointMake(51, 27) withAttributes:dict];
    
    // 绘制图形
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(30, 30, 20, 20)];
    [[UIColor redColor] set];
    [path fill];
    
    // 3. 从上下文获取生成的图片
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    
    [self.layer setContents:(__bridge id)image.CGImage];
    // 4. 关闭位图上下文
    UIGraphicsEndImageContext();
}
-(void)imagecutDrawRect:(CGRect)rect
{
    if (self.type!=eDrawRectType_imagecut) return;
    
    // 创建图片
    UIImage *image = [UIImage imageNamed:@"image2"];
    
    // 1. 开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 2. 设置裁剪区
    // 创建图形路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    // 把图形路径设置为裁剪区
    [path addClip];
    
    // 3. 绘制图形
    [image drawAtPoint:CGPointZero];
    
    // 4. 从位图上下文获取图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    [self.layer setContents:(__bridge id)image.CGImage];
    
    // 5. 关闭上下文
    UIGraphicsEndImageContext();
}
-(void)viewsaveDrawRect:(CGRect)rect
{
    if (self.type!=eDrawRectType_viewsave) return;
    
//    UIImage *image = [UIImage imageNamed:@"image2"];
//    [self.layer setContents:(__bridge id)image.CGImage];
    
    // 1. 开启一个位图上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
    // 2. 获取位图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3. 把屏幕上的图层渲染到图形上下文
    [self.layer renderInContext:ctx];
    
    // 4. 从位图上下文获取图片
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    [self.tip setImage:image];
    // 5. 关闭上下文
    UIGraphicsEndImageContext();
}
@end
