//
//  EventSaver.swift
//  Mobile Computing Project App
//
//  Created by Diego Wright on 3/21/17.
//  Copyright © 2017 Robin Stewart. All rights reserved.
//

import Foundation
import CoreData

class DataManager {
    
    // this function will create an event entity with the correct name and attributes
    // name is passed in as a string, and attributes are passed as tupled in a list as follows:
    //      args:[(att1Name, att1Type), (att2Name, att2Type), ... (attNName, attNType)]
    // where att*Name is a string with the name of the attribute e.g. "Pain Scale"
    // and att*Type is a string with the name of the attribute type.
    // Attribute types will be predefined in separate class
    class func saveEventTemplate(name:String, atts:[(String, String)]) -> Int {
        print("Save the event of type \(name)")
        
        return 0
    }
    
    class func saveEventData(eventType: String, data:[(String, String)]) -> Int {
        return 0
    }
    
    class func loadEventsByDate(_ date: Date) -> [AnyObject] {
        return []
    }
}
