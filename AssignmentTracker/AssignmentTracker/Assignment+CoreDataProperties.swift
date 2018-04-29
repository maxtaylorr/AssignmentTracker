//
//  Assignment+CoreDataProperties.swift
//  AssignmentTracker
//
//  Created by Max Taylor on 4/27/18.
//  Copyright © 2018 Max Taylor. All rights reserved.
//
//

import Foundation
import CoreData


extension Assignment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Assignment> {
        return NSFetchRequest<Assignment>(entityName: "Assignment")
    }

    @NSManaged public var assignmentName: String?
    @NSManaged public var subject: String?
    @NSManaged public var rawDate: NSDate?

}
