#import "SkTextFieldCell.h"
@implementation SkTextFieldCell
- (NSRect)drawingRectForBounds:(NSRect)theRect {
    NSRect newRect = [super drawingRectForBounds:theRect];
    if (selectingOrEditing == NO) {
        NSSize textSize = [self cellSizeForBounds:theRect];
        float heightDelta = newRect.size.height - textSize.height;      
        if (heightDelta > 0) {
            newRect.size.height -= heightDelta;
            newRect.origin.y += (heightDelta / 2);
        }
    }
    return newRect;
}

- (void)selectWithFrame:(NSRect)aRect 
                 inView:(NSView *)controlView 
                 editor:(NSText *)textObj 
               delegate:(id)anObject 
                  start:(int)selStart 
                 length:(int)selLength {
	aRect = [self drawingRectForBounds:aRect];
	selectingOrEditing = YES;	
	[super selectWithFrame:aRect 
                    inView:controlView 
                    editor:textObj 
                  delegate:anObject 
                     start:selStart 
                    length:selLength];
	selectingOrEditing = NO;
}

- (void)editWithFrame:(NSRect)aRect 
               inView:(NSView *)controlView 
               editor:(NSText *)textObj 
             delegate:(id)anObject 
                event:(NSEvent *)theEvent {	
	aRect = [self drawingRectForBounds:aRect];
	selectingOrEditing = YES;
	[super editWithFrame:aRect 
                  inView:controlView 
                  editor:textObj 
                delegate:anObject 
                   event:theEvent];
	selectingOrEditing = NO;
}

@end
