/**
 *
 * Todo.txt-Touch-iOS/Classes/TaskViewCell.m
 *
 * Copyright (c) 2009-2011 Gina Trapani, Shawn McGuire
 *
 * LICENSE:
 *
 * This file is part of Todo.txt Touch, an iOS app for managing your todo.txt file (http://todotxt.com).
 *
 * Todo.txt Touch is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation, either version 2 of the License, or (at your option) any
 * later version.
 *
 * Todo.txt Touch is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with Todo.txt Touch.  If not, see
 * <http://www.gnu.org/licenses/>.
 *
 * @author Ricky Hussmmann <ricky[dot]hussmann[at]gmail[dot]com>
 * @license http://www.gnu.org/licenses/gpl.html
 * @copyright 2009-2011 Ricky Hussmann
 *
 * Copyright (c) 2011 Gina Trapani and contributors, http://todotxt.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "TaskViewCell.h"

@implementation TaskViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (BOOL)showLineNumbers {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	// TODO ID label setup
	return [defaults boolForKey:@"show_line_numbers_preference"];	
}


- (void)layoutSubviews
{
	[super layoutSubviews];
	
	UILabel *priority = (UILabel *)[self viewWithTag:2];
	UILabel *text = (UILabel *)[self viewWithTag:3];
	
	CGFloat maxWidth = 999;
	CGFloat maxHeight = 9999;
	CGSize maximumLabelSize = CGSizeMake(maxWidth,maxHeight);
		
	CGSize expectedLabelSize = [[priority text] 
								sizeWithFont:[UIFont fontWithName:@"Helvetica" size:14.0f]
								constrainedToSize:maximumLabelSize 
								lineBreakMode:UILineBreakModeWordWrap]; 

	CGRect frame = text.frame;
	if ([self showLineNumbers]) {
		frame.origin.x = 47;
	}
	else
	{
		frame.origin.x = 29;
	}
	text.frame = frame;
	
	frame = priority.frame;
	frame.origin.y = text.frame.origin.y;
	if ([self showLineNumbers]) {
		frame.origin.x = 30;
	}
	else {
		frame.origin.x = 12;
	}
	
	frame.size.height = expectedLabelSize.height;
	priority.frame = frame;
	
	if ([self showLineNumbers]) {
		CGFloat top = frame.origin.y;
		CGFloat height = frame.size.height;
		
		UILabel *number = (UILabel *)[self viewWithTag:1];
		frame = number.frame;
		frame.origin.y = top;
		frame.origin.x = 4;
		frame.size.height = height;
		number.frame = frame;
	}
}


@end
