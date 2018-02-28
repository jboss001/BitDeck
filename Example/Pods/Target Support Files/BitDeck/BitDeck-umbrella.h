#ifdef __OBJC__
#import <UIKit/UIKit.h>
#import "bits.h"
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

FOUNDATION_EXPORT double BitDeckVersionNumber;
FOUNDATION_EXPORT const unsigned char BitDeckVersionString[];

