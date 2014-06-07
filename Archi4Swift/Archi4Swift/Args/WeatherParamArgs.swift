//
//  WeatherParamArgs.swift
//  L11HelloiOS
//
//  Created by sunyanfei on 14-6-6.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation

class WeatherParamArgs : ParamArgs
{
    var _cityId:NSString
    
    init(cityId:NSString) {
        _cityId = cityId
    }
    
    override var url:String! { get { return "http://m.weather.com.cn/data/\(_cityId).html" } }
}