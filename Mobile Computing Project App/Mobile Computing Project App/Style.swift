//
//  Style.swift
//  Mobile Computing Project App
//
//  Created by Zhenyu Zhang on 3/24/17.
//  Copyright © 2017 Robin Stewart. All rights reserved.
//

import Foundation
import UIKit


/*
struct Style{
    
    // MARK: ToDo Table Section Headers
   
    static func whiteTheme(){
        var BackgroundColor = UIColor.white
    }
 
    static func orangeTheme(){
        var BackgroundColor = UIColor.orange
    }
    
    static func blueTheme(){
        var BackgroundColor = UIColor.blue
    }
   
    
    
}
*/
/*
class Config: NSObject {
    // Define keys for the values to store
    fileprivate static let kUserIdKey = "userId"
    fileprivate static let kNameKey = "name"
    
    class func setUserId(_ userId:Int) {
        UserDefaults.standard.set(userId, forKey: kUserIdKey)
        UserDefaults.standard.synchronize()
    }
    class func setName(_ name:String) {
        UserDefaults.standard.set(name, forKey: kNameKey)
        UserDefaults.standard.synchronize()
    }
    
    class func userId() -> Int {
        return UserDefaults.standard.integer(forKey: kUserIdKey)
    }
    class func name() -> String {
        return UserDefaults.standard.object(forKey: kNameKey) as! String
    }
}




class Style: NSObject{
    static let kColorKey1 = "Color1"
    
    class func setColor(_ Color1: String){
        UserDefaults.standard.set(Color1, forKey:kColorKey1)
        UserDefaults.standard.synchronize()
    }
    class func giveColor () -> String{
        return UserDefaults.standard.object(forKey: kColorKey1) as! String
    }
*/
struct Style{
    
    static func whiteTheme(){
        var BackgroundColor = UIColor.white
    }
    
    static func orangeTheme(){
        var BackgroundColor = UIColor.orange
    }
    
    static func blueTheme(){
        var BackgroundColor = UIColor.blue
    }
    
    static let availableThemes = ["white","orange","blue"]
    static func loadTheme(){
        let defaults = UserDefaults.standard
        if let name = defaults.string(forKey: "Theme"){
            // Select the Theme
            if name == "white"		{ whiteTheme()	}
            if name == "orange" 	{ orangeTheme()	}
            if name == "blue" 		{ blueTheme()	}
            
        }else{
            defaults.set("white", forKey: "Theme")
            whiteTheme()
        }
    }
}

/*
struct Style{
   
    // MARK: ToDo Table Section Headers
    static var sectionHeaderTitleFont = UIFont(name: "Helvetica-Bold", size: 20)
    static var sectionHeaderTitleColor = UIColor.whiteColor()
    static var BackgroundColor = UIColor.blackColor()
    static var sectionHeaderBackgroundColorHighlighted = UIColor.grayColor()
    static var sectionHeaderAlpha: CGFloat = 1.0
  
    
}
*/

