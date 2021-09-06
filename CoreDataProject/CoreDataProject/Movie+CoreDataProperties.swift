//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by James Chun on 9/3/21.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var director: String?
    @NSManaged public var title: String?
    @NSManaged public var year: Int16
    
    public var wrappedTitle: String {
        return title ?? "Unknown title"
    }

}//End of extension

extension Movie : Identifiable {

}//End of extension
