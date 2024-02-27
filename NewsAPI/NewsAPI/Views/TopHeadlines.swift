//
//  TopHeadlines.swift
//  NewsAPI
//
//  Created by Rakymzhan Zhabagin on 26.02.2024.
//

import SwiftUI

struct TopHeadlinesView: View {
    @StateObject var viewModel = ViewModel()
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var archivedNews: FetchedResults<Article>

    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.news, id: \.self) { news in
                    NavigationLink(destination: webView(url: news.url)
                        .navigationBarTitle("", displayMode: .inline)) {
                        HStack(spacing: 15) {
                            URLImage(urlString: news.urlToImage)
                            VStack(alignment: .leading, spacing: 10) {
                                Text(news.title).fontWeight(.heavy)
                                Text(news.description).lineLimit(3)
                            }
                        }
                        .padding(3)
                    }

                    Button("Archive") {
                        guard !isArticleArchived(url: news.url) else {
                            // Article already archived, show alert
                            showAlert = true
                            alertMessage = "Article is already in the archive."
                            return
                        }

                        let urlToImage = news.urlToImage ?? "defaultImageUrl"
                        
                        DataController().addArticle(
                            urlToImage: urlToImage,
                            url: news.url,
                            title: news.title,
                            desc: news.description,
                            context: managedObjectContext
                        )

                        // Show alert for successful archiving
                        showAlert = true
                        alertMessage = "Article added to the archive successfully."
                    }
                    .frame(maxWidth: .infinity, alignment: .center) // Center align the button
                    .padding(10)
                }
            }
            .navigationTitle("Top Headlines")
            .onAppear {
                viewModel.fetchTopHeadlines()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Archive"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    // Function to check if the article is already archived
    private func isArticleArchived(url: String?) -> Bool {
        guard let url = url else {
            return false
        }

        let archivedUrls = archivedNews.map { $0.url ?? "" }
        return archivedUrls.contains(url)
    }
}

struct TopHeadlinesView_Previews: PreviewProvider {
    static var previews: some View {
        TopHeadlinesView()
    }
}
