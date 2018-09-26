
#import "TraceView.h"
#import "Animations.h"
@implementation TraceView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:COLOR_BLACK];
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    
    CGRect rtTitle = rect;
    rtTitle.size.height = ScaleSize(40);
    
    
    CGRect rtExpand = rect;
    rtExpand.size.width = ScaleSize(8);
    rtExpand.size.height = ScaleSize(8);
    rtExpand.origin.x = rtTitle.origin.x+(rtTitle.size.width-rtExpand.size.width)-ScaleSize(12);
    rtExpand.origin.y = rtTitle.origin.y+(rtTitle.size.height-rtExpand.size.height)/2;
    
    
    CGRect rtTrace = rect;
    rtTrace.size.height = rect.size.height-rtTitle.size.height;
    rtTrace.origin.y = rtTitle.origin.y+rtTitle.size.height-rtTrace.size.height;
    [self initTraceWithRect:rtTrace];
    
    [self initTitleWithRect:rtTitle];
    [self initExpandWithRect:rtExpand];
    
    [self expand:NO animation:NO];
}
-(void)initTitleWithRect:(CGRect)rect
{
    self.title = [[UILabel alloc]initWithFrame:rect];
    [self.title setTextColor:COLOR_FT_2];
    [self.title setTextAlignment:NSTextAlignmentCenter];
    [self.title setFont:SystemFont(12)];
    [self.title setBackgroundColor:COLOR_CELL];
    [Global addTapEventWithTarget:self View:self.title andAction:@selector(expandClick)];
    [self addSubview:self.title];
}
-(void)initExpandWithRect:(CGRect)rect
{
    self.expand = [[UIImageView alloc]initWithFrame:rect];
    [self.expand setImage:ImageLoad(@"arrow_bottom")];
    [self addSubview:self.expand];
}
-(void)initTraceWithRect:(CGRect)rect
{
    self.trace = [[TraceTextView alloc]initWithFrame:rect];
    [self.trace setBackgroundColor:RGB(96, 96, 96)];
    [self addSubview:self.trace];
}
-(void)trace:(NSString*)format,...
{
    [self clear];
    va_list ap;
    va_start(ap, format);
    [self.trace appendTrace:format arguments:ap];
    va_end(ap);
}
-(void)appendTrace:(NSString*)format,...
{
    va_list ap;
    va_start(ap, format);
    [self.trace appendTrace:format arguments:ap];
    va_end(ap);
}
-(void)clear
{
    [self.trace clear];
}
-(void)expandClick
{
    [self setIsexpand:!self.isexpand];
}

-(void)setIsexpand:(BOOL)isexpand
{
    _isexpand = isexpand;
    [self expand:isexpand animation:YES];
}
-(void)expand:(BOOL)expand animation:(BOOL)animation
{
    if ([self.delegate respondsToSelector:@selector(traceBeginExpand:)])
    {
        [self.delegate traceBeginExpand:expand];
    }
    __weak typeof(self) weakSelf = self;
    if (expand)
    {
        if (animation)
        {
            [Animations rotate:self.expand andAnimationDuration:0.3 andWait:NO andAngle:-180];
            [Animations moveDown:self.trace andAnimationDuration:0.3 andLength:self.trace.bounds.size.height completion:^(BOOL finished) {
                if ([weakSelf.delegate respondsToSelector:@selector(traceEndExpand:)])
                {
                    [weakSelf.delegate traceEndExpand:expand];
                    CGRect rtFrame = weakSelf.frame;
                    rtFrame.size.height = weakSelf.title.bounds.size.height+weakSelf.trace.bounds.size.height;
                    weakSelf.frame = rtFrame;
                }
            }];
        }else
        {
            CGRect rtTrace = self.trace.frame;
            rtTrace.origin.y = self.title.bounds.size.height;
            self.trace.frame = rtTrace;
            
            CGRect rtFrame = weakSelf.frame;
            rtFrame.size.height = weakSelf.title.bounds.size.height+weakSelf.trace.bounds.size.height;
            weakSelf.frame = rtFrame;
        }
    }else
    {
        if (animation)
        {
            [Animations rotate:self.expand andAnimationDuration:0.3 andWait:NO andAngle:360];
            [Animations moveUp:self.trace andAnimationDuration:0.3 andLength:self.trace.bounds.size.height completion:^(BOOL finished) {
                if ([weakSelf.delegate respondsToSelector:@selector(traceEndExpand:)])
                {
                    [weakSelf.delegate traceEndExpand:expand];
                }
                CGRect rtFrame = weakSelf.frame;
                rtFrame.size.height = weakSelf.title.bounds.size.height;
                weakSelf.frame = rtFrame;
            }];
        }else
        {
            CGRect rtTrace = self.trace.frame;
            rtTrace.origin.y = self.title.bounds.size.height-rtTrace.size.height;
            self.trace.frame = rtTrace;
            
            CGRect rtFrame = weakSelf.frame;
            rtFrame.size.height = weakSelf.title.bounds.size.height;
            weakSelf.frame = rtFrame;
        }
        
    }
}
@end
