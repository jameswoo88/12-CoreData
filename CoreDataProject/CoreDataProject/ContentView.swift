//
//  ContentView.swift
//  CoreDataProject
//
//  Created by James Chun on 9/3/21.
//

import CoreData
import SwiftUI

//struct Student: Hashable {
//    let name: String
//}

struct ContentView: View {
//    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Wars") var ships: FetchedResults<Ship>
     
//    @Environment(\.managedObjectContext) var moc
//    @State var lastNameFilter = "A"
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Country.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Country.fullName , ascending: false)
    ]) var countries: FetchedResults<Country>
    
    var body: some View {
        //MARK: - One-To-Many relationships with Core Data, SwfitUI, and @FetchRequest
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(header: Text(country.wrappedFullName)) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            
            Button("Add") {
                let candy1 = Candy(context: self.moc)
                candy1.name = "Mars"
                candy1.origin = Country(context: self.moc)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"
                
                let candy2 = Candy(context: self.moc)
                candy2.name = "KitKat"
                candy2.origin = Country(context: self.moc)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"
                
                let candy3 = Candy(context: self.moc)
                candy3.name = "Twix"
                candy3.origin = Country(context: self.moc)
                candy3.origin?.shortName = "UK"
                candy3.origin?.fullName = "United Kingdom"
                
                let candy4 = Candy(context: self.moc)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: self.moc)
                candy4.origin?.shortName = "CH"
                candy4.origin?.fullName = "Switzerland"
                
                try? self.moc.save()
            }
        }
        
        //MARK: - Dynamically filtering @FetchRequest with SwiftUI: handling generic types of fetchedResults in FilteredList.swift
//        VStack {
//            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
//                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//            }
//
//            Button("Add Examples") {
//                let taylor = Singer(context: self.moc)
//                taylor.firstName = "Taylor"
//                taylor.lastName = "Swift"
//
//                let ed = Singer(context: self.moc)
//                ed.firstName = "Ed"
//                ed.lastName = "Sheeran"
//
//                let adele = Singer(context: self.moc)
//                adele.firstName = "Adele"
//                adele.lastName = "Adkins"
//
//                try? self.moc.save()
//            }
//
//            Button("Show A") {
//                self.lastNameFilter = "A"
//            }
//
//            Button("Show S") {
//                self.lastNameFilter = "S"
//            }
//        }
        
        
        //MARK: - Using different predicates to load certain ships, see line 22
//        VStack {
//            List(ships, id: \.self) { ship in
//                Text(ship.name ?? "Unknown ship")
//            }
//        }
//
//        Button("Add Examples") {
//            let ship1 = Ship(context: self.moc)
//            ship1.name = "Enterprise"
//            ship1.universe = "Star Trek"
//
//            let ship2 = Ship(context: self.moc)
//            ship2.name = "Defiant"
//            ship2.universe = "Star Trek"
//
//            let ship3 = Ship(context: self.moc)
//            ship3.name = "Millennium Falcon"
//            ship3.universe = "Star Wars"
//
//            let ship4 = Ship(context: self.moc)
//            ship4.name = "Executor"
//            ship4.universe = "Star Wars"
//
//            try? self.moc.save()
//        }
        
        
        //MARK: - Wizard entity has contstraint: names cannot be the same. We used a merge policy for Swift to remove duplicates (see SceneDelegate line 24)
//        VStack {
//            List(wizards, id: \.self) {
//                Text($0.name ?? "Unknown")
//            }
//
//            Button("Add") {
//                let wizard = Wizard(context: self.moc)
//                wizard.name = "Harry Potter"
//            }
//
//            Button("Save") {
//                do {
//                    try self.moc.save()
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
        
        
        //MARK: - Saving to CORE DATA only when there has been changes in the context
//        Button("Save") {
//            if self.moc.hasChanges {
//                try? self.moc.save()
//            }
//        }
        
//        List(students, id: \.self) {
//            Text("\($0.name)")
//        }
    }//End of body
    
}//End of struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}//End of struct
