// Playground - noun: a place where people can play

import UIKit

var begin = "---------------------------------------------"

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
        weak var weakSelf = self
        propertyChanged(weakSelf!,property)
    }
    
    func setValueOfProperty(value: Any!, _ propertyName: NSString) {
        
    }
}

class ModelPropertyListener
{
    
}

class ViewProperty
{
    var propertyName:String!
    init(_ pName:NSString) {
        self.propertyName = pName
    }
}

class ViewPropertyNotifyer : NSObject
{
    var DPChanged:(ViewPropertyNotifyer,ViewProperty) ->() = {  _ ,_  in }
    
    func onPropertyChanged(property:ViewProperty) {
        var dpChanged = self.DPChanged;
        weak var weakSelf = self
        dpChanged(weakSelf!,property)
    }
    
    func setValueOfProperty(value: Any!, _ propertyName: NSString) {
        
    }
}

class ViewPropertyListener
{
    
}

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

class BindableUILabel : ViewPropertyNotifyer
{
    var view:UILabel!
    
    var text:String! {
        willSet {
            self.view.text = newValue
        }
        didSet {
            self.onPropertyChanged(ViewProperty("text"))
        }
    }
    
    init(view:UILabel) {
        
        super.init()
        self.view = view
        
        println("init---")
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("didChanged:"), name: UITextFieldTextDidChangeNotification, object: view)

    }
    
    func didChanged(notification:NSNotification) {
        println("observeValueForKeyPath\(notification.object)")
    }
    
    override func setValueOfProperty(value: Any!, _ propertyName: NSString) {
        
        switch propertyName {
            case "text" :
                println("come in set property")
                self.view.text = value as String
            default:
                println("not implement the set value of propertyname:\(propertyName)")
        }
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
    
    override func setValueOfProperty(value: Any!, _ propertyName: NSString) {
        switch propertyName {
            case "name" :
                self.name = value as String
            default:
                break;
        }
    }
}

var user = User()
var userLB = UILabel(frame:CGRectZero)
var userBindLB = BindableUILabel(view:userLB)
var binding = Binding()

binding.bind(userBindLB, ViewProperty("text"), user, ModelProperty("name"))
user.name = "sunyanfei"
userBindLB.view.text

userLB.text = "123"
userBindLB.view.text = "123456"
user.name

var end = "---------------------------------------------"


