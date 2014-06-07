// Playground - noun: a place where people can play

import UIKit


class UserInfo
{
    
}

class INotifyPropertyChanged
{
    
}

class DependencyProperty
{
    
}

class DependencyObject
{
    
}

class MainViewModel : INotifyPropertyChanged
{
    
}

class DataContextViewController : UIViewController
{
    var dataContext:INotifyPropertyChanged!
    
    init(dataContext:INotifyPropertyChanged) {
        super.init(nibName: nil, bundle: nil)
    }
}

extension UILabel
{
    var rxText:NSString! { get { return nil } set{} }
}

class MainViewController : DataContextViewController
{
    var bindLB:UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        bindLB = UILabel(frame:CGRectMake(0, 0, 200, 200))
        
        self.view.addSubview(bindLB)
        
    }
}

