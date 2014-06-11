// Playground - noun: a place where people can play

import UIKit

println("sdf")
println("test---------")
println("test---------")
println("test---------")
println("test---------")
println("test---------")
println("test---------")
println("test---------")

println("test---------")
println("test---------")
println("test---------")
println("test---------")

var e = "sdfs"

class ModelProperty
{
    var propertyName:String!
    
    init(_ propertyName:String) {
        self.propertyName = propertyName
    }
}

class ModelPropertyNotifyer
{
    var propertyChanged:(ModelPropertyNotifyer,ModelProperty) -> () = { _,_  in }
    
    init() {
        
    }
    
    func onPropertyChanged(property:ModelProperty) {
        propertyChanged(self,property)
    }
}

class ModelPropertyListener
{
    
}

class ViewProperty
{
    var propertyName:String? = nil
    init(_ pName:NSString) {
        self.propertyName = pName
    }
}

class ViewPropertyNotifyer
{
    var view:UIView!
    var DPChanged:(UIView,ViewProperty) ->() = {  _ ,_  in }
    
    init(view:UIView) {
        self.view = view
    }
    
    func onPropertyChanged(property:ViewProperty) {
        var dpChanged = self.DPChanged;
        dpChanged(self.view,property)
    }
}

class ViewPropertyListener
{
    
}

class Binding
{
    func bind(viewPropertyNotifyer:ViewPropertyNotifyer,viewProperty:ViewProperty,modelPropertyNotifyer:ModelPropertyNotifyer,modelProperty:ModelProperty) {
        
        var propertyValue:Any = nil
        
        modelPropertyNotifyer.propertyChanged = { notifyer,property in
            
            var modelPropertyName = property.propertyName
            
            var modelPropertyIndex = 0
            
            for var i=0; i < reflect(notifyer).count; ++i {
                
                var str = reflect(notifyer)[i].0 + "----" + reflect(notifyer)[i].1.summary
                println("model reflect str --- \(str)")
                
                if (modelPropertyName == reflect(notifyer)[i].0) {
                    modelPropertyIndex = i
                    break
                }
            }
            propertyValue = reflect(notifyer)[modelPropertyIndex].1.value
            
            var viewPropretyName = viewProperty.propertyName;
            var viewPropertyIndex = 0
            for var i=0; i < reflect(viewPropertyNotifyer.view).count; ++i {
                
                var str = reflect(viewPropertyNotifyer.view)[i].0 + "----" + reflect(viewPropertyNotifyer.view)[i].1.summary
                println("view reflect str --- \(str)")
                
                if(viewPropretyName == reflect(viewPropertyNotifyer.view)[i].0) {
                    viewPropertyIndex = i
                    break
                }
            }
            
//            var view = viewPropertyNotifyer.view
//            reflect(viewPropertyNotifyer)[viewPropertyIndex].1.value = propertyValue
        }
    }
    
}

class BindableUILabel : UILabel
{
    var viewPropertyNotifyer:ViewPropertyNotifyer!
    
    override var text:String! {
        willSet {
            viewPropertyNotifyer.onPropertyChanged(ViewProperty("text"))
        }
    }
    
    init(frame: CGRect) {
        super.init(frame:frame)
        self.viewPropertyNotifyer = ViewPropertyNotifyer(view:self)
    }
}

class User : ModelPropertyNotifyer
{
    var name:String! {
        willSet {

        }
        didSet {
            println("set name ----")
            self.onPropertyChanged(ModelProperty("name"))
        }
    }
    
    init() {
        
    }
}

var user = User()
var userLB = BindableUILabel(frame:CGRectZero)
var binding = Binding()

binding.bind(userLB.viewPropertyNotifyer, viewProperty: ViewProperty("text"), modelPropertyNotifyer: user, modelProperty: ModelProperty("name"))
user.name = "sunyanfei"

println("2fsdfsdfs")


