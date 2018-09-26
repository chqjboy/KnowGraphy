
#import <UIKit/UIKit.h>
#import "CIFiltersDef.h"
#import "HScrollMenuBar.h"
typedef NS_ENUM(NSInteger, eFiltersPlayMode)
{
    eFiltersPlayMode_def = 0,
    eFiltersPlayMode_sigle,
    eFiltersPlayMode_list
};
@protocol CIFiltersViewDelegate<NSObject>
-(void)outputMsg:(NSString*)msg;
@end
@interface CIFiltersView : UIView
@property(nonatomic, weak) id<CIFiltersViewDelegate>delegate;
@property(nonatomic, retain) ParamCIFilterSort* sort;
@property(nonatomic, retain) UIImageView* origin;
@property(nonatomic, retain) UIImageView* result;
@property(nonatomic, assign) eFiltersPlayMode mode;
@property(nonatomic, retain) NSTimer* timer;
@property(nonatomic, assign) NSInteger counter;
@property(nonatomic, retain) ParamCIFilter* selFilter;

@property(nonatomic, retain) CIContext* context;
@property(nonatomic, retain) CIImage* outputimage;

+(instancetype)insstanceWithFrame:(CGRect)frame sort:(ParamCIFilterSort*)sort;

-(void)initViews;
-(CIFilter*)filterWithKey:(NSString*)key;
-(UIImage*)imageWithFilterkey:(NSString*)filterkey;
-(void)actDefaultWithFilter:(ParamCIFilter*)filter;
-(void)siglePlay;
-(void)listPlay;
-(void)stopTimer;
@end

@interface CIFilterBlursView : CIFiltersView

@end

@interface CIFilterColorAdjustmentView : CIFiltersView
@end
