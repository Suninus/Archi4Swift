//
//  ViewExt.swift
//  Archi4Swift
//
//  Created by sunyanfei on 14-6-11.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation
import UIKit

class BindableUILabel : ViewPropertyNotifyer
{
    var view:UILabel!
    
    var text:String! {
        willSet {
            self.view.text = newValue
        }
        didSet {
            self.onPropertyChanged(ViewProperty("text"))
        }
    }
    
    init(view:UILabel) {
        self.view = view
    }
    
    override func setValueOfProperty(value: Any!, _ propertyName: NSString) {
        
        switch propertyName {
        case "text" :
            println("come in set property")
            self.view.text = value as String
        default:
            println("not implement the set value of propertyname:\(propertyName)")
        }
    }
}

class BindableUITable : ViewPropertyNotifyer
{
    var view:UITableView!
    
    var items:Array<AnyObject>!
    
    init(view:UITableView) {
        self.view = view
    }
}

class BindableTextField : ViewPropertyNotifyer
{
    
}
