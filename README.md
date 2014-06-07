Archi4Swift
===========


A simple architecture of apple new develop language        ----------======[ !? Swift ?! ]======----------


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

这套架构将来会有很多模块，目前来看它只包含了 http 引擎 和 一个 DataService

HttpEngine

对NSURLConnection进行了封装，提供了超级简单和爽口的函数名称，如果你要发送一个http请求，只需要像下面一样：

HttpEngine(url:"http://example.json").fly(.POST,headerArgs: ["key":"value"],bodyArgs: ["key":"value"]).completed({(success:Bool,error:NSError?,result:AnyObject?) -> () in 
	//Your process result code.
})
他是如此的简单

SuperDataSerice

这个一个基于业务逻辑层的面向ViewController 的数据服务层，因为要获取数据，所以他调用了http引擎。那么为什么用Super，因为他提供了一条获取数据的清晰的道路。有了这条路，架构就显得非常纯净、优雅，
将来你要做的只是去写自己的数据请求参数和数据解析，你没有必要关系这个牛逼的东西是怎么从服务端获取数据的。 它是如此的简单。示例：

var args = WeatherParamArgs(cityId:cityId)
var parser = WeatherParser()        
SuperDataService().fetch(args).nextParse(parser).done({ (success:Bool,error:NSError?,result:AnyObject?) in
    if(success) {
        var info:WeatherInfo = result as WeatherInfo
        println("weatherinfo city---- \(info.city!) --- week --- \(info.week)")
    } else {
        println("error city id : \(cityId)")
    }
})

贡献
如果你愿意，欢迎大家共同完成这个开源项目，并提出你想到的任何在Swfit方面牛逼的东西。

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

The architecture has many modules in future,but now it only has the HttpEngine and SuperDataSevice.

HttpEngine

Super clear fucntion name of package the NSURLConnection class. To send http request, such as:

HttpEngine(url:"http://example.json").fly(.POST,headerArgs: ["key":"value"],bodyArgs: ["key":"value"]).completed({(success:Bool,error:NSError?,result:AnyObject?) -> () in 
	//Your process result code.
})

Yeah,it's so simple.

SuperDataSerice

It's a business layer service for the ViewController which need the data from the server, it also call the http engine to get data,so why call it super ?
Because it supply the single line fetch data way. In this way the architeture is pure, the next you will develop only the request args and result parser,
you could't care the how the way of get data from server.  ...... it's simple.

It's a business layer service for the ViewController which need the data from the server, it also call the http engine to get data,so why call it super ?
Because it supply the single line fetch data way. In this way, the architeture is pure, the next you will develop only the request args and result parser,
you could't care the how the way of get data from server.  ...... it's simple,such as:

var args = WeatherParamArgs(cityId:cityId)
var parser = WeatherParser()        
SuperDataService().fetch(args).nextParse(parser).done({ (success:Bool,error:NSError?,result:AnyObject?) in
    if(success) {
        var info:WeatherInfo = result as WeatherInfo
        println("weatherinfo city---- \(info.city!) --- week --- \(info.week)")
    } else {
        println("error city id : \(cityId)")
    }
})

Contributing
I am happy to receive any pull requests, and you will say any suggestion of swift in here. let's do it!

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Next:
1.complete the architecture to the swift grammar
2.swift operation queue
3.errorsystem
4.write a project use this architecture

License
MIT