//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by James Chun on 9/3/21.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    
    public var wrappedFirstName: String {
        return firstName ?? "Unknown"
    }
    
    public var wrappedLastName: String {
        return lastName ?? "Unknown"
    }

}//End of extension

extension Singer : Identifiable {

}//End of extension
