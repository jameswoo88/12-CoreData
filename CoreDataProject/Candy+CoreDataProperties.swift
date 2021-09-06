//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by James Chun on 9/5/21.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String {
        name ?? "Unknown Candy"
    }

}//End of extension

extension Candy : Identifiable {

}//End of extension
