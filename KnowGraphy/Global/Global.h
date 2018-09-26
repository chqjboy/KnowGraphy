
#import <UIKit/UIKit.h>
#define TestApplication [UIApplication sharedApplication]
#define TestDelegate TestApplication.delegate
#define TestWindow TestApplication.keyWindow
@interface Global : NSObject
+(CGFloat)getScaleSize:(CGFloat)size;
+(void)addTapEventWithTarget:(id)target View:(UIView*)view andAction:(SEL)action;
+(void)registNotifyWithObserver:(id)obj selector:(SEL)select message:(NSString*)message;
+(void)releaseNotifyWithObserver:(id)obj;
+(void)postNotifyWithMessage:(NSString*)msg andObj:(NSObject*)obj;
+(void)showCancelAlertWithTitle:(NSString*)title andMessage:(NSString*)message andDelegate:(id)delegate andCancelBtn:(NSString*)cancel;
+(UIInterfaceOrientation)getWindowOrientation;
+(UIInterfaceOrientationMask)getWindowOrientationMask;
+(void)setWindowOrientation:(UIInterfaceOrientation)orientation;
+(CGSize)sizeForText:(NSString*)text font:(UIFont*)font maxWidth:(CGFloat)maxWidth style:(NSParagraphStyle*)style;
+(UIImage*)createImageWithColor:(UIColor*)color;
@end
