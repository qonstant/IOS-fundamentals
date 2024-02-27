//
//  Article+CoreDataProperties.swift
//  NewsAPI
//
//  Created by Rakymzhan Zhabagin on 27.02.2024.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var title: String?
    @NSManaged public var des: String?
    @NSManaged public var url: String?
    @NSManaged public var urlToImage: String?
    @NSManaged public var id: UUID?

}

extension Article : Identifiable {

}
