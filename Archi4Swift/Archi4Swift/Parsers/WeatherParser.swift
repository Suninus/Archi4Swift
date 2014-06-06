//
//  WeatherParser.swift
//  L11HelloiOS
//
//  Created by sunyanfei on 14-6-6.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation

class WeatherParser : Parser
{
    
    override func parseJsonData(jsonData: AnyObject!) -> AnyObject? {
        
        var dic:NSDictionary = jsonData as NSDictionary
        var weatherInfoDic:NSDictionary = dic.objectForKey("weatherinfo") as NSDictionary
        
        var weatherInfo:WeatherInfo = WeatherInfo()
        weatherInfo.city = weatherInfoDic.objectForKey("city") as String
        weatherInfo.week = weatherInfoDic.objectForKey("week") as String
        weatherInfo.weather = weatherInfoDic.objectForKey("weather1") as String
        
        return weatherInfo
    }
}