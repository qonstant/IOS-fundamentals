//
//  ContentView.swift
//  NewsAPI
//
//  Created by Rakymzhan Zhabagin on 26.02.2024.
//

import SwiftUI
import WebKit

struct URLImage: View {
    let urlString: String?
    
    @State private var data: Data?
    
    var body: some View {
        if let urlString = urlString, let url = URL(string: urlString){
            if let data = data, let uiimage = UIImage(data: data) {
                Image(uiImage: uiimage)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 110, height: 135)
                    .cornerRadius(20)
            } else {
                ProgressView()  // Placeholder (ProgressView) while data is being fetched
                .frame(width: 130, height: 70)
                .cornerRadius(20)
                .onAppear {
                    fetchData(from: url)  // Fetch data when view appears
                }
            }
        } else {
            Image(systemName: "video")  // Placeholder for cases where urlString is nil or cannot be converted to URL
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130, height: 70)
                    .cornerRadius(20)
                    .background(Color.gray)
        }
    }
    private func fetchData(from url: URL) {
            let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                DispatchQueue.main.async {
                    self.data = data  // Update the data state variable on the main thread
                }
            }
            task.resume()
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        TabView {
            Archive()
                .tabItem() {
                    Image(systemName: "archivebox")
                    Text("Archive")
                }
            TopHeadlinesView()
                .tabItem() {
                    Image(systemName: "house")
                    Text("Top Headlines")
                }
            EverythingView()
                .tabItem() {
                    Image(systemName: "doc.text.magnifyingglass")
                    Text("Everything")
                }
        }
    }
}

// For viewing pages
struct webView :UIViewRepresentable {
    
    var url :String
    func makeUIView(context: UIViewRepresentableContext<webView>) -> WKWebView {
        
        let view = WKWebView()
        view.load(URLRequest(url: URL(string: url)!))
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<webView>) {
        
    }
}

#Preview {
    ContentView()
}
