
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, eDrawRectType)
{
    eDrawRectType_def = 0,
    eDrawRectType_original,
    eDrawRectType_direct,
    eDrawRectType_bezier,
    eDrawRectType_curve_original,
    eDrawRectType_curve_direct,
    eDrawRectType_roundrect,
    eDrawRectType_sector,
    eDrawRectType_stateline,
    eDrawRectType_matrix,
    eDrawRectType_watermark,
    eDrawRectType_imagecut,
    eDrawRectType_viewsave
};
@interface DrawRectView : UIView
@property(nonatomic, assign) eDrawRectType type;
@property(nonatomic, retain) UIImageView* tip;
@end
