//
//  CoreDataManager.swift
//  NewsAPI
//
//  Created by Rakymzhan Zhabagin on 27.02.2024.
//

import Foundation

// CRUD
public final class CoreDataManager {
    public static let shared = CoreDataManager()
    private init() {}
    
    private var appDelegate :AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
}
