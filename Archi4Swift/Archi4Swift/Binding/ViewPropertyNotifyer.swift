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
    var propertyName:String!
    init(_ pName:NSString) {
        self.propertyName = pName
    }
}

class ViewPropertyNotifyer
{
    var DPChanged:(ViewPropertyNotifyer,ViewProperty) ->() = {  _ ,_  in }
    
    func onPropertyChanged(property:ViewProperty) {
        var dpChanged = self.DPChanged;
        weak var weakSelf = self
        dpChanged(weakSelf!,property)
    }
    
    func setValueOfProperty(value: Any!, _ propertyName: NSString) {
        
    }
}

class ViewPropertyListener
{
    
}
