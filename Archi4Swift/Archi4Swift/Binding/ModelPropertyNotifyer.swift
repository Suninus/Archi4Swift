//
//  ModelProperty.swift
//  Archi4Swift
//
//  Created by sunyanfei on 14-6-11.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation

class ModelProperty
{
    var propertyName:String!
    
    init(_ propertyName:String) {
        self.propertyName = propertyName
    }
}

class ModelPropertyNotifyer
{
    var propertyChanged:(ModelPropertyNotifyer,ModelProperty) -> () = { _,_  in }
    
    init() {
        
    }
    
    func onPropertyChanged(property:ModelProperty) {
        propertyChanged(self,property)
    }
}

class ModelPropertyListener
{
    
}