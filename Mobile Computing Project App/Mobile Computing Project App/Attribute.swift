//
//  Attributes.swift
//  Mobile Computing Project App
//
//  Created by Diego Wright on 3/21/17.
//  Copyright © 2017 Robin Stewart. All rights reserved.
//

import Foundation

protocol Attribute {
    // this protocol is simple and sets up the basic needs for a medical event attribute
    var type:String {get set}  // type will be referred to as attributeType in other places
    var inputType:AnyObject {get set} // the input type may be a text box,
}
