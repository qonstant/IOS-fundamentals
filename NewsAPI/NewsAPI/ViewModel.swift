//
//  ViewModel.swift
//  NewsAPI
//
//  Created by Rakymzhan Zhabagin on 26.02.2024.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var news: [News] = []
    
    private var timer: Timer?
    
    init() {
            // Schedule the fetch function to be called every 5 seconds
            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
                self?.fetch()
            }

            // Make sure the timer is added to the current run loop
            RunLoop.current.add(timer!, forMode: .common)
    }
    
    deinit {
            // Invalidate the timer when the ViewModel is deallocated
            timer?.invalidate()
    }
    
    func fetch() {
        
        guard let url = URL(string: "\(APIConstants.url)/\(APIConstants.topHeadlines)?sources=\(APIConstants.Sources.bbcNews)&apiKey=\(APIConstants.apiKey)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // Converting to JSON
            do {
                let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                
                // Filter out articles with title "[Removed]"
                let filteredNews = newsResponse.articles.filter { $0.title != "[Removed]" }

                DispatchQueue.main.async {
                    self?.news = filteredNews
                }
            }
            catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
}
