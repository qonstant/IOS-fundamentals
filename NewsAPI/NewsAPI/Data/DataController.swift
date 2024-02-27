//
//  CoreData.swift
//  NewsAPI
//
//  Created by Rakymzhan Zhabagin on 27.02.2024.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ArticleModel")
    
    init() {
        container.loadPersistentStores{desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("Failed to save data")
        }
    }
    
    func addArticle(urlToImage: String, url: String, title: String, desc: String, context: NSManagedObjectContext) {
        let article = Article(context: context)
        article.id = UUID()
        article.desc = desc
        article.title = title
        article.url = url
        article.urlToImage = urlToImage
        
        save(context: context)
    }
    
    func editArticle(article: Article, urlToImage: String, url: String, title: String, desc: String, context: NSManagedObjectContext) {
            article.urlToImage = urlToImage
            article.url = url
            article.title = title
            article.desc = desc
            
            save(context: context)
    }
}
