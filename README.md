Archi4Swift
===========

A simple architecture of apple new develop language        ----------======[ !? Swift ?! ]======----------

The architecture has many modules in future,but now it only has the HttpEngine and SuperDataSevice.

## HttpEngine

Super clear function name to package the NSURLConnection class. To send http request, such as:

```swift
HttpEngine("http://example.json")
    .fly(.POST, ["key":"value"], ["key":"value"])
    .completed { success, error, result in
        //Your process result code.
}
```

Yeah,it's so simple.

## SuperDataService

It's a business layer service for the ViewController which need the data from the server, it also call the http engine to get data,so why call it super ?
Because it supply the single line fetch data way. In this way, the architeture is pure, the next you will develop only the request args and result parser,
you could't care the how the way of get data from server.  ...... it's simple,such as:

```swift
var args = WeatherParamArgs(cityId:cityId)
var parser = WeatherParser()   

SuperDataService()
	.fetch(args)
	.nextParse(parser)
	.done { success, error, result in
    	if(success) {
        	var info:WeatherInfo = result as WeatherInfo
        	println("weatherinfo city---- \(info.city!) --- week --- \(info.week)")
    	} else {
        	println("error city id : \(cityId)")
    	}
	}
```

## Contributing
- I am happy to receive any pull requests, and you will say any suggestion of swift in here. let's do it!
- Any issue is appreciated.

## Next
- 1.Complete the architecture to the swift grammar
- 2.Binding
- 2.Swift operation queue
- 3.Errorsystem
- 4.Write a project use this architecture

## License
MIT