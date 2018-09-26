
#import "CIFiltersView.h"
@implementation CIFiltersView
+(instancetype)insstanceWithFrame:(CGRect)frame sort:(ParamCIFilterSort*)sort
{
    Class cls = [self classFromSortkey:sort.key];
    CIFiltersView* instance = [cls alloc];
    instance = [instance initWithFrame:frame sort:sort];
    return instance;
}
+(Class)classFromSortkey:(NSString*)sortkey
{
    if ([sortkey isEqualToString:kCIFilterSort_CICategoryBlur])
    {
        return [CIFilterBlursView class];
    }else if([sortkey isEqualToString:kCIFilterSort_CICategoryColorAdjustment])
    {
        return [CIFilterColorAdjustmentView class];
    }
    return nil;
}
-(instancetype)initWithFrame:(CGRect)frame sort:(ParamCIFilterSort*)sort
{
    self = [super initWithFrame:frame];
    self.sort = sort;
    [self initViews];
    return self;
}
-(void)dealloc
{
    [self stopTimer];
}
-(void)initViews
{
    self.origin = [[UIImageView alloc]init];
    [self.origin.layer setBorderColor:RGB(85, 0, 0).CGColor];
    [self.origin.layer setBorderWidth:2];
    [self.origin setBackgroundColor:RGB(200, 200, 200)];
    [self.origin setContentMode:UIViewContentModeScaleAspectFit];
    [self.origin setImage:ImageLoad(@"filter1")];
    
    [self addSubview:self.origin];
    
    self.result = [[UIImageView alloc]init];
    [self.result.layer setBorderColor:RGB(0, 85, 0).CGColor];
    [self.result.layer setBorderWidth:2];
    [self.result setBackgroundColor:RGB(200, 200, 200)];
    [self.result setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:self.result];
}
-(void)layoutSubviews
{
    CGRect rect = self.bounds;
    
    CGFloat padding = 5;
    CGRect rtOrigin = rect;
    rtOrigin.origin.y = padding;
    rtOrigin.origin.x = padding;
    rtOrigin.size.height = (rect.size.height-3*padding)/2;
    rtOrigin.size.width = rect.size.width-2*rtOrigin.origin.x;
    self.origin.frame = rtOrigin;
    
    CGRect rtResult = rtOrigin;
    rtResult.origin.y = rtOrigin.origin.y+rtOrigin.size.height+padding;
    self.result.frame = rtResult;
}
-(CIFilter*)filterWithKey:(NSString*)key
{
    // 1. 将UIImage转换成CIImage
    CIImage *ciImage = nil;
    if (self.mode==eFiltersPlayMode_def || self.mode==eFiltersPlayMode_sigle || self.outputimage==nil)
    {
        ciImage = [[CIImage alloc] initWithImage:self.origin.image];
        self.outputimage = ciImage;
    }else
    {
        ciImage = self.outputimage;
    }
    
    CIFilter* filter = [CIFilter filterWithName:key];
    [filter setDefaults];
    [filter setValue:ciImage forKey:kCIFilter_inputImage];
    return filter;
}
-(UIImage*)imageWithFilterkey:(NSString*)filterkey
{
    // 2. 创建滤镜
    CIFilter* filter = [self filterWithKey:filterkey];
    
    // 3. 渲染并输出CIImage
    CIImage *outputImage = [filter outputImage];
    self.outputimage = outputImage;
    // 4. 获取绘制上下文
    //CIContext* context = [CIContext contextWithOptions:nil];
    if (!self.context)
    {
        EAGLContext *eaglctx = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
        self.context = [CIContext contextWithEAGLContext:eaglctx];
    }
    // 5. 创建输出CGImage
    CGImageRef cgImage = [self.context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    // 6. 释放CGImage
    CGImageRelease(cgImage);
    
    return image;
}
-(void)actDefaultWithFilter:(ParamCIFilter*)filter
{
    self.mode = eFiltersPlayMode_def;
    self.selFilter = filter;
    [self.result setImage:[self imageWithFilterkey:filter.key]];
    [self outputMsg:[NSString stringWithFormat:@"%@_%@", self.selFilter.name, self.selFilter.key]];
}

-(void)setMode:(eFiltersPlayMode)mode
{
    _mode = mode;
    if (mode==eFiltersPlayMode_def)
    {
        [self stopTimer];
    }else
    {
        [self startTimer];
    }
}
-(void)startTimer
{
    if (self.timer)
    {
        [self stopTimer];
    }
    self.counter = 0;
    self.selFilter = nil;
    self.outputimage = nil;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}
-(void)timerAction
{
    NSLog(@"filter timer action %zd", self.counter);
    if (self.counter==0)
    {
        [self playNextFilter];
    }
    if(self.counter<5)
    {
        self.counter++;
        [self outputMsg:[NSString stringWithFormat:@"%@_%@(%zd)", self.selFilter.name, self.selFilter.key, self.counter]];
    }else if(self.counter>=5)
    {
        if (self.selFilter==self.sort.filters.lastObject)
        {
            [self stopTimer];
            if (self.mode==eFiltersPlayMode_sigle)
            {
                [self outputMsg:@"单个播放结束"];
            }else if(self.mode==eFiltersPlayMode_list)
            {
                [self outputMsg:@"链式播放结束"];
            }
        }
        self.counter = 0;
    }
}
-(void)stopTimer
{
    if (self.timer)
    {
        [self.timer invalidate];
        self.counter = 0;
        self.timer = nil;
    }
}
-(void)siglePlay
{
    self.mode = eFiltersPlayMode_sigle;
}
-(void)listPlay
{
    self.mode = eFiltersPlayMode_list;
}
-(void)playNextFilter
{
    if (self.selFilter==nil)
    {
        self.selFilter = [self.sort.filters firstObject];
    }else if(self.selFilter!=[self.sort.filters lastObject])
    {
        self.selFilter = [self.sort.filters objectAtIndex:[self.sort.filters indexOfObject:self.selFilter]+1];
    }else
    {
        return;
    }
    [self.result setImage:[self imageWithFilterkey:self.selFilter.key]];
}
-(void)outputMsg:(NSString*)msg
{
    if ([self.delegate respondsToSelector:@selector(outputMsg:)])
    {
        [self.delegate outputMsg:msg];
    }
}
@end

@implementation CIFilterBlursView
-(void)initViews
{
    [super initViews];
}
-(CIFilter*)filterWithKey:(NSString *)key
{
    CIFilter* filter = [super filterWithKey:key];
    // 设置相关参数
    if ([key isEqualToString:kCIFilter_CIBoxBlur])
    {
        [filter setValue:@(20.0) forKey:kCIFilter_inputRadius];
    }else if([key isEqualToString:kCIFilter_CIDiscBlur])
    {
        [filter setValue:@(20.0) forKey:kCIFilter_inputRadius];
    }else if([key isEqualToString:kCIFilter_CIGaussianBlur])
    {
        [filter setValue:@(20.0) forKey:kCIFilter_inputRadius];
    }else if([key isEqualToString:kCIFilter_CIMaskedVariableBlur])
    {
        /*
         要求:mask大小与原图大小相同
         */
        
        CIImage* mask = [[CIImage alloc]initWithImage:ImageLoad(@"filter2")];
        [filter setValue:mask forKey:kCIFilter_inputMask];
        [filter setValue:@(100.0) forKey:kCIFilter_inputRadius];
    }else if([key isEqualToString:kCIFilter_CIMedianFilter] ||
             [key isEqualToString:kCIFilter_CINoiseReduction])
    {
        
    }else if([key isEqualToString:kCIFilter_CIMotionBlur])
    {
        [filter setValue:@(20.0) forKey:kCIFilter_inputRadius];
        [filter setValue:@(M_PI_2) forKey:kCIFilter_inputAngle];
    }else if([key isEqualToString:kCIFilter_CIZoomBlur])
    {
        CIVector* center = [[CIVector alloc]initWithX:self.origin.image.size.width/2 Y:self.origin.image.size.height/2];
        [filter setValue:center forKey:kCIFilter_inputCenter];
        [filter setValue:@(10.0) forKey:kCIFilter_inputAmount];
    }
    return filter;
}
@end

@implementation CIFilterColorAdjustmentView
-(void)initViews
{
    [super initViews];
}
-(CIFilter*)filterWithKey:(NSString *)key
{
    CIFilter* filter = [super filterWithKey:key];
    // 设置相关参数
    if ([key isEqualToString:kCIFilter_CIColorClamp])
    {
        CIVector* min = [CIVector vectorWithX:0 Y:0 Z:0 W:0];
        [filter setValue:min forKey:kCIFilter_inputMinComponents];
        CIVector* max = [CIVector vectorWithX:0.5 Y:0.5 Z:0.5 W:1];
        [filter setValue:max forKey:kCIFilter_inputMaxComponents];
    }else if([key isEqualToString:kCIFilter_CIColorControls])
    {
        [filter setValue:@1 forKey:kCIFilter_inputSaturation];
        [filter setValue:@0.8 forKey:kCIFilter_inputBrightness];
        [filter setValue:@0.7 forKey:kCIFilter_inputContrast];
    }
    return filter;
}
@end
