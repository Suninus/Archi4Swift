//
//  HomeViewController.swift
//  L11HelloiOS
//
//  Created by sunyanfei on 14-6-5.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController : BaseViewController,UITableViewDelegate,UITableViewDataSource
{
    var weathers = Array<WeatherInfo>()
    
    var tableView:UITableView!
    
    var allIDs = ["101010100", "101010200", "101010300","101010400", "101010500", "101010600", "101010700", "101010800", "101010900", "101011000", "101011100", "101011200", "101011300", "101011400", "101011500","101301203", "101301204", "101301205", "101301206","101301207", "101301208", "101301209", "101301210","101301301", "101301302", "101301303", "101301401","101301402", "101301403", "101301404", "101301405","101310101", "101310102", "101310201", "101310202","101310203", "101310204", "101310205", "101310206", "101310207", "101310208", "101310209", "101310210","101310211", "101310212", "101310213", "101310214","101310215", "101310216", "101310217", "101310218","101310219", "101310220", "101310221", "101310222","101310223", "101320101", "101320102", "101320103",
        "101320104", "101320105", "101330101", "101340101","101340102", "101340201", "101340202", "101340203","101340204", "101340205", "101340301", "101340401","101340501", "101340601", "101340602","101340603","101340701", "101340801", "101340802", "101340901","101340902", "101340903", "101340904"]

    //lifeCycle
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!)  {
        super.init(nibName:nil,bundle:nil)
    }

    override func viewDidLoad() {
        self.title = "首页"

        super.viewDidLoad()
        
        tableView = UITableView(frame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height),style:UITableViewStyle.Plain)
        tableView.backgroundColor = UIColor.clearColor()
        tableView.separatorStyle = .None
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        for v in allIDs {
            self.loadWeatherData(v)
        }
    }

    //view
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }

    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let identifier:String! = "cellId"
        var cell:SimpleTextCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as SimpleTextCell!
        if(cell == nil) {
            cell = SimpleTextCell(style:.Default,reuseIdentifier:identifier)
            cell.selectionStyle = .None
        }
        
        var info:WeatherInfo = weathers[indexPath.row]
        cell.bindInfo(info)
        
        return cell
    }

    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var selectedWeather:WeatherInfo = weathers[indexPath.row]
        self.goToDetail(selectedWeather)
    }

    //data
    func loadWeatherData(cityId:String) {
        var args:WeatherParamArgs! = WeatherParamArgs(cityId:cityId)
        var parser:WeatherParser! = WeatherParser()
        SuperDataService().fetch(args).nextParse(parser).done({(success:Bool,error:NSError?,result:AnyObject?) in
            
            if(success) {
                var info:WeatherInfo = result as WeatherInfo
//                println("weatherinfo city---- \(info.city!) --- week --- \(info.week)")
                self.weathers.append(info)
                self.tableView.reloadData()
            } else {
//                println("error city id : \(cityId)")
            }
        })
    }

    //controller
    func goToDetail(info:WeatherInfo) {
        var detailController:HomeDetailViewController = HomeDetailViewController(nibName: nil,bundle: nil)
        detailController.wInfo = info
        self.navigationController.pushViewController(detailController,animated:true)
    }
}