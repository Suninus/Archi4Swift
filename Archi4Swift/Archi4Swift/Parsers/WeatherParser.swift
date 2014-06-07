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
        
        if let dic = jsonData as? NSDictionary {
            
            var weatherInfo = WeatherInfo()
            weatherInfo.city = dic["weatherinfo"]?["city"]? as String
            weatherInfo.week = dic["weatherinfo"]?["week"]? as String
            weatherInfo.weather = dic["weatherinfo"]?["weather1"]? as String
            
            return weatherInfo
        }

        return nil
    }
}