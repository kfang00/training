//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Kayla Fang on 10/2/20.
//  Copyright © 2020 Kayla Fang. All rights reserved.
//

import SwiftUI
import CoreData

//struct FilteredList: View {
//    var fetchRequest: FetchRequest<Singer>
//    var singers: FetchedResults<Singer> { fetchRequest.wrappedValue }
//
//    var body: some View {
//        List(fetchRequest.wrappedValue, id: \.self) { singer in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//        }
//    }
//
//    init(filter: String) {
//        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
//    }
//}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }

    init(filterKey: String, filterValue: String, sortArray: [NSSortDescriptor], predicate: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortArray, predicate: NSPredicate(format: "%K \(predicate) %@", filterKey, filterValue))
        self.content = content
    }
}
