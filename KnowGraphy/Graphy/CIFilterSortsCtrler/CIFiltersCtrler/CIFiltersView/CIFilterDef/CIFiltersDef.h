#import <Foundation/Foundation.h>
//模糊处理
#define kCIFilterSort_CICategoryBlur                @"CICategoryBlur"
/*
 名称：盒形卷积
 属性：kCIFilter_inputRadius
*/
#define kCIFilter_CIBoxBlur                         @"CIBoxBlur"
/*
 名称：盘形卷积
 属性：kCIFilter_inputRadius
*/
#define kCIFilter_CIDiscBlur                        @"CIDiscBlur"
/*
 名称：高斯模糊
 属性：kCIFilter_inputRadius
*/
#define kCIFilter_CIGaussianBlur                    @"CIGaussianBlur"
/*黑白反显
 名称：属性：kCIFilter_inputRadius，kCIFilter_inputMask
 要求：mask大小与原图大小相同
*/
#define kCIFilter_CIMaskedVariableBlur              @"CIMaskedVariableBlur"
/*
 名称：中值降噪
 属性：无
*/
#define kCIFilter_CIMedianFilter                    @"CIMedianFilter"
/*
 名称：动感相机
 属性：kCIFilter_inputRadius，kCIFilter_inputAngle
*/
#define kCIFilter_CIMotionBlur                      @"CIMotionBlur"
/*
 名称：差值降噪
*/
#define kCIFilter_CINoiseReduction                  @"CINoiseReduction"
/*
 名称：变焦摄影
 属性：kCIFilter_inputCenter，kCIFilter_inputAmount
*/
#define kCIFilter_CIZoomBlur                        @"CIZoomBlur"

//色彩调整
#define kCIFilterSort_CICategoryColorAdjustment     @"CICategoryColorAdjustment"
/*
 名称：区间变色
 属性：kCIFilter_inputMinComponents, KCIFilter_inputMaxComponents
*/
#define kCIFilter_CIColorClamp                      @"CIColorClamp"
/*
 名称：显示控制
 属性：kCIFilter_inputSaturation，kCIFilter_inputBrightness，kCIFilter_inputContrast
*/
#define kCIFilter_CIColorControls                   @"CIColorControls"
/*
 名称：矩阵变换
 属性：kCIFilter_inputRVector,kCIFilter_inputGVector,kCIFilter_inputBVector,kCIFilter_inputAVector,kCIFilter_inputBiasVector
*/
#define kCIFilter_CIColorMatrix                     @"CIColorMatrix"
/*
 名称：多阶变换
 属性：kCIFilter_inputRedCoefficients,kCIFilter_inputGreenCoefficients,kCIFilter_inputBlueCoefficients,kCIFilter_inputAlphaCoefficients
*/
#define kCIFilter_CIColorPolynomial                 @"CIColorPolynomial"
/*
 名称：曝光调整
 属性：kCIFilter_inputEV
*/
#define kCIFilter_CIExposureAdjust                  @"CIExposureAdjust"
/*
 名称：灰度平滑
 属性：kCIFilter_inputPower
*/
#define kCIFilter_CIGammaAdjust                     @"CIGammaAdjust"
/*
 名称：色调旋转
 属性：kCIFilter_inputAngle
*/
#define kCIFilter_CIHueAdjust                       @"CIHueAdjust"
/*
 名称：线性标化
 属性：无
*/
#define kCIFilter_CILinearToSRGBToneCurve           @"CILinearToSRGBToneCurve"
/*
 名称：标准线化
 属性：无
*/
#define kCIFilter_CISRGBToneCurveToLinear           @"CISRGBToneCurveToLinear"
/*
 名称：色温调整
 属性：kCIFilter_inputNeutral,kCIFilter_inputTargetNeutral
*/
#define kCIFilter_CITemperatureAndTint              @"CITemperatureAndTint"
/*
 名称：色调曲线
 属性：kCIFilter_inputPoint0,kCIFilter_inputPoint1,kCIFilter_inputPoint2,kCIFilter_inputPoint3,kCIFilter_inputPoint4
*/
#define kCIFilter_CIToneCurve                       @"CIToneCurve"
/*
 名称：色值抖动
 属性：kCIFilter_inputAmount
*/
#define kCIFilter_CIVibrance                        @"CIVibrance"
/*
 名称：白平衡化
 属性：kCIFilter_inputColor
*/
#define kCIFilter_CIWhitePointAdjust                @"CIWhitePointAdjust"

//色彩效果
/**/
#define kCIFilterSort_CICategoryColorEffect         @"CICategoryColorEffect"
/**/
#define kCIFilter_CIColorCrossPolynomial            @"CIColorCrossPolynomial"
/**/
#define kCIFilter_CIColorCube                       @"CIColorCube"
/**/
#define kCIFilter_CIColorCubeWithColorSpace         @"CIColorCubeWithColorSpace"
/**/
#define kCIFilter_CIColorInvert                     @"CIColorInvert"
/**/
#define kCIFilter_CIColorMap                        @"CIColorMap"
/**/
#define kCIFilter_CIColorMonochrome                 @"CIColorMonochrome"
/**/
#define kCIFilter_CIColorPosterize                  @"CIColorPosterize"
/**/
#define kCIFilter_CIFalseColor                      @"CIFalseColor"
/**/
#define kCIFilter_CIMaskToAlpha                     @"CIMaskToAlpha"
/**/
#define kCIFilter_CIMaximumComponent                @"CIMaximumComponent"
/**/
#define kCIFilter_CIMinimumComponent                @"CIMinimumComponent"
/**/
#define kCIFilter_CIPhotoEffectChrome               @"CIPhotoEffectChrome"
/**/
#define kCIFilter_CIPhotoEffectFade                 @"CIPhotoEffectFade"
/**/
#define kCIFilter_CIPhotoEffectInstant              @"CIPhotoEffectInstant"
/**/
#define kCIFilter_CIPhotoEffectMono                 @"CIPhotoEffectMono"
/**/
#define kCIFilter_CIPhotoEffectNoir                 @"CIPhotoEffectNoir"
/**/
#define kCIFilter_CIPhotoEffectProcess              @"CIPhotoEffectProcess"
/**/
#define kCIFilter_CIPhotoEffectTonal                @"CIPhotoEffectTonal"
/**/
#define kCIFilter_CIPhotoEffectTransfer             @"CIPhotoEffectTransfer"
/**/
#define kCIFilter_CISepiaTone                       @"CISepiaTone"
/**/
#define kCIFilter_CIVignette                        @"CIVignette"
/**/
#define kCIFilter_CIVignetteEffect                  @"CIVignetteEffect"

//复合操作
/**/
#define kCIFilterSort_CICategoryCompositeOperation  @"CICategoryCompositeOperation"
/**/
#define kCIFilter_CIAdditionCompositing             @"CIAdditionCompositing"
/**/
#define kCIFilter_CIColorBlendMode                  @"CIColorBlendMode"
/**/
#define kCIFilter_CIColorBurnBlendMode              @"CIColorBurnBlendMode"
/**/
#define kCIFilter_CIColorDodgeBlendMode             @"CIColorDodgeBlendMode"
/**/
#define kCIFilter_CIDarkenBlendMode                 @"CIDarkenBlendMode"
/**/
#define kCIFilter_CIDifferenceBlendMode             @"CIDifferenceBlendMode"
/**/
#define kCIFilter_CIDivideBlendMode                 @"CIDivideBlendMode"
/**/
#define kCIFilter_CIExclusionBlendMode              @"CIExclusionBlendMode"
/**/
#define kCIFilter_CIHardLightBlendMode              @"CIHardLightBlendMode"
/**/
#define kCIFilter_CIHueBlendMode                    @"CIHueBlendMode"
/**/
#define kCIFilter_CILightenBlendMode                @"CILightenBlendMode"
/**/
#define kCIFilter_CILinearBurnBlendMode             @"CILinearBurnBlendMode"
/**/
#define kCIFilter_CILinearDodgeBlendMode            @"CILinearDodgeBlendMode"
/**/
#define kCIFilter_CILuminosityBlendMode             @"CILuminosityBlendMode"
/**/
#define kCIFilter_CIMaximumCompositing              @"CIMaximumCompositing"
/**/
#define kCIFilter_CIMinimumCompositing              @"CIMinimumCompositing"
/**/
#define kCIFilter_CIMultiplyBlendMode               @"CIMultiplyBlendMode"
/**/
#define kCIFilter_CIMultiplyCompositing             @"CIMultiplyCompositing"
/**/
#define kCIFilter_CIOverlayBlendMode                @"CIOverlayBlendMode"
/**/
#define kCIFilter_CIPinLightBlendMode               @"CIPinLightBlendMode"
/**/
#define kCIFilter_CISaturationBlendMode             @"CISaturationBlendMode"
/**/
#define kCIFilter_CIScreenBlendMode                 @"CIScreenBlendMode"
/**/
#define kCIFilter_CISoftLightBlendMode              @"CISoftLightBlendMode"
/**/
#define kCIFilter_CISourceAtopCompositing           @"CISourceAtopCompositing"
/**/
#define kCIFilter_CISourceInCompositing             @"CISourceInCompositing"
/**/
#define kCIFilter_CISourceOutCompositing            @"CISourceOutCompositing"
/**/
#define kCIFilter_CISourceOverCompositing           @"CISourceOverCompositing"
/**/
#define kCIFilter_CISubtractBlendMode               @"CISubtractBlendMode"

//变形效果
/**/
#define kCIFilterSort_CICategoryDistortionEffect    @"CICategoryDistortionEffect"
/**/
#define kCIFilter_CIBumpDistortion                  @"CIBumpDistortion"
/**/
#define kCIFilter_CIBumpDistortionLinear            @"CIBumpDistortionLinear"
/**/
#define kCIFilter_CICircleSplashDistortion          @"CICircleSplashDistortion"
/**/
#define kCIFilter_CICircularWrap                    @"CICircularWrap"
/**/
#define kCIFilter_CIDroste                          @"CIDroste"
/**/
#define kCIFilter_CIDisplacementDistortion          @"CIDisplacementDistortion"
/**/
#define kCIFilter_CIGlassDistortion                 @"CIGlassDistortion"
/**/
#define kCIFilter_CIGlassLozenge                    @"CIGlassLozenge"
/**/
#define kCIFilter_CIHoleDistortion                  @"CIHoleDistortion"
/**/
#define kCIFilter_CILightTunnel                     @"CILightTunnel"
/**/
#define kCIFilter_CIPinchDistortion                 @"CIPinchDistortion"
/**/
#define kCIFilter_CIStretchCrop                     @"CIStretchCrop"
/**/
#define kCIFilter_CITorusLensDistortion             @"CITorusLensDistortion"
/**/
#define kCIFilter_CITwirlDistortion                 @"CITwirlDistortion"
/**/
#define kCIFilter_CIVortexDistortion                @"CIVortexDistortion"

//生成器
/**/
#define kCIFilterSort_CICategoryGenerator           @"CICategoryGenerator"
/**/
#define kCIFilter_CIAztecCodeGenerator              @"CIAztecCodeGenerator"
/**/
#define kCIFilter_CICheckerboardGenerator           @"CICheckerboardGenerator"
/**/
#define kCIFilter_CICode128BarcodeGenerator         @"CICode128BarcodeGenerator"
/**/
#define kCIFilter_CIConstantColorGenerator          @"CIConstantColorGenerator"
/**/
#define kCIFilter_CILenticularHaloGenerator         @"CILenticularHaloGenerator"
/**/
#define kCIFilter_CIPDF417BarcodeGenerator          @"CIPDF417BarcodeGenerator"
/**/
#define kCIFilter_CIQRCodeGenerator                 @"CIQRCodeGenerator"
/**/
#define kCIFilter_CIRandomGenerator                 @"CIRandomGenerator"
/**/
#define kCIFilter_CIStarShineGenerator              @"CIStarShineGenerator"
/**/
#define kCIFilter_CIStripesGenerator                @"CIStripesGenerator"
/**/
#define kCIFilter_CISunbeamsGenerator               @"CISunbeamsGenerator"

//几何调整
/**/
#define kCIFilterSort_CICategoryGeometryAdjustment  @"CICategoryGeometryAdjustment"
/**/
#define kCIFilter_CIAffineTransform                 @"CIAffineTransform"
/**/
#define kCIFilter_CICrop                            @"CICrop"
/**/
#define kCIFilter_CILanczosScaleTransform           @"CILanczosScaleTransform"
/**/
#define kCIFilter_CIPerspectiveCorrection           @"CIPerspectiveCorrection"
/**/
#define kCIFilter_CIPerspectiveTransform            @"CIPerspectiveTransform"
/**/
#define kCIFilter_CIPerspectiveTransformWithExtent  @"CIPerspectiveTransformWithExtent"
/**/
#define kCIFilter_CIStraightenFilter                @"CIStraightenFilter"

//渐变调整
/**/
#define kCIFilterSort_CICategoryGradient            @"CICategoryGradient"
/**/
#define kCIFilter_CIGaussianGradient                @"CIGaussianGradient"
/**/
#define kCIFilter_CILinearGradient                  @"CILinearGradient"
/**/
#define kCIFilter_CIRadialGradient                  @"CIRadialGradient"
/**/
#define kCIFilter_CISmoothLinearGradient            @"CISmoothLinearGradient"

//半色网屏
/**/
#define kCIFilterSort_CICategoryHalftoneEffect      @"CICategoryHalftoneEffect"
/**/
#define kCIFilter_CICircularScreen                  @"CICircularScreen"
/**/
#define kCIFilter_CICMYKHalftone                    @"CICMYKHalftone"
/**/
#define kCIFilter_CIDotScreen                       @"CIDotScreen"
/**/
#define kCIFilter_CIHatchedScreen                   @"CIHatchedScreen"
/**/
#define kCIFilter_CILineScreen                      @"CILineScreen"

//像素弱化
/**/
#define kCIFilterSort_CICategoryReduction           @"CICategoryReduction"
/**/
#define kCIFilter_CIAreaAverage                     @"CIAreaAverage"
/**/
#define kCIFilter_CIAreaHistogram                   @"CIAreaHistogram"
/**/
#define kCIFilter_CIRowAverage                      @"CIRowAverage"
/**/
#define kCIFilter_CIColumnAverage                   @"CIColumnAverage"
/**/
#define kCIFilter_CIHistogramDisplayFilter          @"CIHistogramDisplayFilter"
/**/
#define kCIFilter_CIAreaMaximum                     @"CIAreaMaximum"
/**/
#define kCIFilter_CIAreaMinimum                     @"CIAreaMinimum"
/**/
#define kCIFilter_CIAreaMaximumAlpha                @"CIAreaMaximumAlpha"
/**/
#define kCIFilter_CIAreaMinimumAlpha                @"CIAreaMinimumAlpha"

//图像锐化
/**/
#define kCIFilterSort_CICategorySharpen             @"CICategorySharpen"
/**/
#define kCIFilter_CISharpenLuminance                @"CISharpenLuminance"
/**/
#define kCIFilter_CIUnsharpMask                     @"CIUnsharpMask"

//风格添加
/**/
#define kCIFilterSort_CICategoryStylize             @"CICategoryStylize"
/**/
#define kCIFilter_CIBlendWithAlphaMask              @"CIBlendWithAlphaMask"
/**/
#define kCIFilter_CIBlendWithMask                   @"CIBlendWithMask"
/**/
#define kCIFilter_CIBloom                           @"CIBloom"
/**/
#define kCIFilter_CIComicEffect                     @"CIComicEffect"
/**/
#define kCIFilter_CIConvolution3X3                  @"CIConvolution3X3"
/**/
#define kCIFilter_CIConvolution5X5                  @"CIConvolution5X5"
/**/
#define kCIFilter_CIConvolution7X7                  @"CIConvolution7X7"
/**/
#define kCIFilter_CIConvolution9Horizontal          @"CIConvolution9Horizontal"
/**/
#define kCIFilter_CIConvolution9Vertical            @"CIConvolution9Vertical"
/**/
#define kCIFilter_CICrystallize                     @"CICrystallize"
/**/
#define kCIFilter_CIDepthOfField                    @"CIDepthOfField"
/**/
#define kCIFilter_CIEdges                           @"CIEdges"
/**/
#define kCIFilter_CIEdgeWork                        @"CIEdgeWork"
/**/
#define kCIFilter_CIGloom                           @"CIGloom"
/**/
#define kCIFilter_CIHeightFieldFromMask             @"CIHeightFieldFromMask"
/**/
#define kCIFilter_CIHexagonalPixellate              @"CIHexagonalPixellate"
/**/
#define kCIFilter_CIHighlightShadowAdjust           @"CIHighlightShadowAdjust"
/**/
#define kCIFilter_CILineOverlay                     @"CILineOverlay"
/**/
#define kCIFilter_CIPixellate                       @"CIPixellate"
/**/
#define kCIFilter_CIPointillize                     @"CIPointillize"
/**/
#define kCIFilter_CIShadedMaterial                  @"CIShadedMaterial"
/**/
#define kCIFilter_CISpotColor                       @"CISpotColor"
/**/
#define kCIFilter_CISpotLight                       @"CISpotLight"

//网格处理
/**/
#define kCIFilterSort_CICategoryTileEffect          @"CICategoryTileEffect"
/**/
#define kCIFilter_CIAffineClamp                     @"CIAffineClamp"
/**/
#define kCIFilter_CIAffineTile                      @"CIAffineTile"
/**/
#define kCIFilter_CIEightfoldReflectedTile          @"CIEightfoldReflectedTile"
/**/
#define kCIFilter_CIFourfoldReflectedTile           @"CIFourfoldReflectedTile"
/**/
#define kCIFilter_CIFourfoldRotatedTile             @"CIFourfoldRotatedTile"
/**/
#define kCIFilter_CIFourfoldTranslatedTile          @"CIFourfoldTranslatedTile"
/**/
#define kCIFilter_CIGlideReflectedTile              @"CIGlideReflectedTile"
/**/
#define kCIFilter_CIKaleidoscope                    @"CIKaleidoscope"
/**/
#define kCIFilter_CIOpTile                          @"CIOpTile"
/**/
#define kCIFilter_CIParallelogramTile               @"CIParallelogramTile"
/**/
#define kCIFilter_CIPerspectiveTile                 @"CIPerspectiveTile"
/**/
#define kCIFilter_CISixfoldReflectedTile            @"CISixfoldReflectedTile"
/**/
#define kCIFilter_CISixfoldRotatedTile              @"CISixfoldRotatedTile"
/**/
#define kCIFilter_CITriangleKaleidoscope            @"CITriangleKaleidoscope"
/**/
#define kCIFilter_CITriangleTile                    @"CITriangleTile"
/**/
#define kCIFilter_CITwelvefoldReflectedTile         @"CITwelvefoldReflectedTile"

//多图过渡
/**/
#define kCIFilterSort_CICategoryTransition          @"CICategoryTransition"
/**/
#define kCIFilter_CIAccordionFoldTransition         @"CIAccordionFoldTransition"
/**/
#define kCIFilter_CIBarsSwipeTransition             @"CIBarsSwipeTransition"
/**/
#define kCIFilter_CICopyMachineTransition           @"CICopyMachineTransition"
/**/
#define kCIFilter_CIDisintegrateWithMaskTransition  @"CIDisintegrateWithMaskTransition"
/**/
#define kCIFilter_CIDissolveTransition              @"CIDissolveTransition"
/**/
#define kCIFilter_CIFlashTransition                 @"CIFlashTransition"
/**/
#define kCIFilter_CIModTransition                   @"CIModTransition"
/**/
#define kCIFilter_CIPageCurlTransition              @"CIPageCurlTransition"
/**/
#define kCIFilter_CIPageCurlWithShadowTransition    @"CIPageCurlWithShadowTransition"
/**/
#define kCIFilter_CIRippleTransition                @"CIRippleTransition"
/**/
#define kCIFilter_CISwipeTransition                 @"CISwipeTransition"

//CIFilter 属性宏定义
#define kCIFilter_inputImage                @"inputImage"
#define kCIFilter_inputMask                 @"inputMask"
#define kCIFilter_inputRadius               @"inputRadius"
#define kCIFilter_inputAngle                @"inputAngle"
#define kCIFilter_inputCenter               @"inputCenter"
#define kCIFilter_inputAmount               @"inputAmount"
#define kCIFilter_inputMinComponents        @"inputMinComponents"
#define kCIFilter_inputMaxComponents        @"inputMaxComponents"
#define kCIFilter_inputSaturation           @"inputSaturation"
#define kCIFilter_inputBrightness           @"inputBrightness"
#define kCIFilter_inputContrast             @"inputContrast"
#define kCIFilter_inputRVector              @"inputRVector"
#define kCIFilter_inputGVector              @"inputGVector"
#define kCIFilter_inputBVector              @"inputBVector"
#define kCIFilter_inputAVector              @"inputAVector"
#define kCIFilter_inputBiasVector           @"inputBiasVector"
#define kCIFilter_inputRedCoefficients      @"inputRedCoefficients"
#define kCIFilter_inputGreenCoefficients    @"inputGreenCoefficients"
#define kCIFilter_inputBlueCoefficients     @"inputBlueCoefficients"
#define kCIFilter_inputAlphaCoefficients    @"inputAlphaCoefficients"
#define kCIFilter_inputEV                   @"inputEV"
#define kCIFilter_inputPower                @"inputPower"
#define kCIFilter_inputNeutral              @"inputNeutral"
#define kCIFilter_inputTargetNeutral        @"inputTargetNeutral"
#define kCIFilter_inputPoint0               @"inputPoint0"
#define kCIFilter_inputPoint1               @"inputPoint1"
#define kCIFilter_inputPoint2               @"inputPoint2"
#define kCIFilter_inputPoint3               @"inputPoint3"
#define kCIFilter_inputPoint4               @"inputPoint4"
#define kCIFilter_inputColor                @"inputColor"


@interface CIFiltersDef : NSObject
+(NSArray*)getFilterSorts;
+(NSArray*)getParamFilterSorts;
+(NSArray*)getFiltersWithSortkey:(NSString*)sortkey;
+(NSArray*)getParamFiltersWithSortkey:(NSString*)sortkey;
@end

@interface ParamCIFilter : NSObject
@property(nonatomic, retain) NSString* key;
@property(nonatomic, retain) NSString* name;
@end

@interface ParamCIFilterSort : NSObject
@property(nonatomic, retain) NSString* key;
@property(nonatomic, retain) NSString* name;
@property(nonatomic, retain) NSArray<ParamCIFilter*>* filters;
@end


