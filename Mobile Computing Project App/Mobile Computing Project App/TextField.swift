//
//  TextField.swift
//  Mobile Computing Project App
//
//  Created by Diego Wright on 3/22/17.
//  Copyright © 2017 Robin Stewart. All rights reserved.
//

import Foundation

class TextField: Attribute {
    var type:String
    var inputType:AnyObject
    
    init(type:String, inputType:AnyObject) {
        self.type = type
        self.inputType = inputType
    }
    
    class func addInputToView(view: AnyObject) {
        
    }
}
