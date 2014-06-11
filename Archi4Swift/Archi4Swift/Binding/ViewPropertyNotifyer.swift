//
//  ViewProperty.swift
//  Archi4Swift
//
//  Created by sunyanfei on 14-6-11.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation
import UIKit

class ViewProperty
{
    var pName:String? = nil
    init(_ pName:NSString) {
        self.pName = pName
    }
}

class ViewPropertyNotifyer
{
    var view:UIView!
    var DPChanged:(UIView,ViewProperty) ->() = {  _ ,_  in }
    
    init(view:UIView) {
        self.view = view
    }
    
    func onPropertyChanged(property:ViewProperty) {
        var dpChanged = self.DPChanged;
        dpChanged(self.view,property)
    }
}

class ViewPropertyListener
{
    
}

