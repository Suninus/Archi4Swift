//
//  ViewExt.swift
//  Archi4Swift
//
//  Created by sunyanfei on 14-6-11.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation
import UIKit

class BindableUILabel : UILabel
{
    var viewPropertyNotifyer:ViewPropertyNotifyer!
    
    override var text:String! {
        willSet {
            viewPropertyNotifyer.onPropertyChanged(ViewProperty("text"))
        }
    }
    
    init(frame: CGRect) {
        super.init(frame:frame)
        self.viewPropertyNotifyer = ViewPropertyNotifyer(view:self)
    }
}
