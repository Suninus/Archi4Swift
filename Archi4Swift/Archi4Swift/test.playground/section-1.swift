// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class ParamArgs
{
    var url: String? { return nil }
    var headers: Dictionary<String,String>? { return nil }
    var bodys: Dictionary<String,String>? { return nil }
}

class WeatherParamArgs : ParamArgs
{
    var _cityId:NSString
    
    init(cityId:NSString) {
        _cityId = cityId
    }
    
    override var url:String! { get { return "http://m.weather.com.cn/data/\(_cityId).html" } }
}

var args1 = ParamArgs()
var args2 = WeatherParamArgs(cityId:"1000001")

args1.url
args2.url

let a = 123,b = 456
a
b

class test {
    
    var str:String? = nil
    
    init() {
        
    }
}