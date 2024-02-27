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
    private var currentFetchingMode: FetchingMode = .topHeadlines
    
    enum FetchingMode {
        case topHeadlines
        case everything
    }
    
    init() {
        // Schedule the fetch function to be called every 5 seconds
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            self?.fetchData()
        }

        // Make sure the timer is added to the current run loop
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    deinit {
        // Invalidate the timer when the ViewModel is deallocated
        timer?.invalidate()
    }
    
    func fetchTopHeadlines() {
        currentFetchingMode = .topHeadlines
        fetchData()
    }
    
    func fetchEverything() {
        currentFetchingMode = .everything
        fetchData()
    }
    
    private func fetchData() {
        var endpoint = ""
        switch currentFetchingMode {
        case .topHeadlines:
            endpoint = "\(APIConstants.url)/\(APIConstants.topHeadlines)?sources=\(APIConstants.Sources.bbcNews)&apiKey=\(APIConstants.apiKey)"
        case .everything:
            endpoint = "\(APIConstants.url)/\(APIConstants.everything)?sources=\(APIConstants.Sources.bbcNews)&apiKey=\(APIConstants.apiKey)"
        }
  
        guard let url = URL(string: endpoint) else {
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
