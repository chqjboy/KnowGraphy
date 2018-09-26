
#import <UIKit/UIKit.h>
#import "FitLineLabel.h"
@class MenuItem;


@interface ParamMenuItem : NSObject
@property(nonatomic, retain) NSString* key;
@property(nonatomic, retain) NSString* title;
@property(nonatomic, retain) id data;
@property(nonatomic, assign) BOOL select;

+(instancetype)instanceWithData:(NSDictionary*)data;
+(NSArray*)itemsWithArrData:(NSArray*)array;
@end
@protocol MenuItemDelegate<NSObject>
-(void)selectedMenuItem:(MenuItem*)item;
@end

@interface MenuItem : UILabel
@property(nonatomic, weak) id<MenuItemDelegate>delegate;
@property(nonatomic, retain) ParamMenuItem* param;
@property(nonatomic, assign) BOOL select;

-(instancetype)initWithFrame:(CGRect)frame param:(ParamMenuItem*)param;
@end
