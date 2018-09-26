
#import "NavigationCtrler.h"
#import "HScrollMenuBar.h"
#import "DrawRectView.h"
@interface DrawRectCtrler : NavigationCtrler
<
HScrollMenuBarDelegate
>
@property(nonatomic, retain) HScrollMenuBar* menubar;
@property(nonatomic, retain) DrawRectView* draw;
@end
