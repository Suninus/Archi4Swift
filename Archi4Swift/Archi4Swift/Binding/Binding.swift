//
//  Binding.swift
//  Archi4Swift
//
//  Created by sunyanfei on 14-6-11.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation
import UIKit

class Binding
{
    func bind(viewPropertyNotifyer:ViewPropertyNotifyer,_ viewProperty:ViewProperty,_ modelPropertyNotifyer:ModelPropertyNotifyer,_ modelProperty:ModelProperty) {
        
        modelPropertyNotifyer.propertyChanged = { notifyer,property in
            
            
            var modelPropertyName = property.propertyName
            var modelPropertyIndex = 0
            var modelPropertyValue:Any = nil
            
            for var i=0; i < reflect(notifyer).count; ++i {
                
                var str = reflect(notifyer)[i].0 + "----" + reflect(notifyer)[i].1.summary
                println("model reflect str --- \(str)")
                
                if (modelPropertyName == reflect(notifyer)[i].0) {
                    modelPropertyIndex = i
                    break
                }
            }
            modelPropertyValue = reflect(notifyer)[modelPropertyIndex].1.value
            
            var viewPropertyName = viewProperty.propertyName;
            viewPropertyNotifyer.setValueOfProperty(modelPropertyValue,viewPropertyName)
        }
        
        
        viewPropertyNotifyer.DPChanged = { notifyer,property in
            
            var viewPropertyName = property.propertyName
            var viewPropertyIndex = 0
            var viewPropertyValue:Any = nil
            
            for var i=0; i < reflect(viewPropertyNotifyer).count; ++i {
                
                var str = reflect(viewPropertyNotifyer)[i].0 + "----" + reflect(viewPropertyNotifyer)[i].1.summary
                println("view reflect str --- \(str)")
                
                if(viewPropertyName == reflect(viewPropertyNotifyer)[i].0) {
                    viewPropertyIndex = i
                    break
                }
            }
            viewPropertyValue = reflect(notifyer)[viewPropertyIndex].1.value
            
            var modelPropertyName = modelProperty.propertyName
            modelPropertyNotifyer.setValueOfProperty(viewPropertyValue, modelPropertyName)
        }
    }
    
}