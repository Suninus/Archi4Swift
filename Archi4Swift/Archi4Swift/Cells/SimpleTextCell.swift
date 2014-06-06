//
//  SimpleTextCell.swift
//  L11HelloiOS
//
//  Created by sunyanfei on 14-6-6.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation
import UIKit

class SimpleTextCell : UITableViewCell
{
    var info:WeatherInfo!
    var cityLB:UILabel!
    var weekLB:UILabel!
    var weatherLB:UILabel!
    
    init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style,reuseIdentifier: reuseIdentifier)
        
        cityLB = UILabel(frame:CGRectZero)
        cityLB.font = UIFont.systemFontOfSize(12)
        cityLB.textColor = UIColor.redColor()
        self.contentView.addSubview(cityLB)
        
        weekLB = UILabel(frame:CGRectZero)
        weekLB.font = UIFont.systemFontOfSize(12)
        self.contentView.addSubview(weekLB)
        
        weatherLB = UILabel(frame:CGRectZero)
        weatherLB.font = UIFont.systemFontOfSize(12)
        self.contentView.addSubview(weatherLB)
    }
    
    override func layoutSubviews()  {
        cityLB.frame = CGRectMake(25, 0, 100, self.contentView.frame.size.height)
        weekLB.frame = CGRectMake(cityLB.frame.size.width + cityLB.frame.origin.x + 5, 0, 100, self.contentView.frame.size.height)
        weatherLB.frame = CGRectMake(weekLB.frame.size.width + weekLB.frame.origin.x + 5, 0, 100, self.contentView.frame.size.height)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        
    }
    
    func bindInfo(pInfo:WeatherInfo) {
        self.info = pInfo
        
        cityLB.text = self.info.city
        weekLB.text = self.info.week
        weatherLB.text = self.info.weather
    }
}
