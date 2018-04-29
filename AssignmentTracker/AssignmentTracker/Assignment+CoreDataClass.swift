//
//  Assignment+CoreDataClass.swift
//  AssignmentTracker
//
//  Created by Max Taylor on 4/27/18.
//  Copyright © 2018 Max Taylor. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Assignment)
public class Assignment: NSManagedObject {
    var date: Date? {
        get {
            return rawDate as Date?
        }
        set {
            rawDate = newValue as NSDate?
        }
    }
    
    convenience init?(name: String?, subject: String?, date: Date?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Assignment.entity(), insertInto: managedContext)
        
        //self.assignmentName = assignmentName
        //self.subject = subject
        self.date = date
    }
}
