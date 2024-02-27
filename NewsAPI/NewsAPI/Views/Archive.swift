//
//  Archive.swift
//  NewsAPI
//
//  Created by Rakymzhan Zhabagin on 26.02.2024.
//

import SwiftUI
import CoreData

struct Archive: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var news: FetchedResults<Article>

    var body: some View {
        NavigationView {
            List {
                ForEach(news) { news in
                    let url = news.url ?? "google.com"
                    NavigationLink(destination: webView(url: url)
                        .navigationBarTitle("", displayMode: .inline)) {
                        HStack(spacing: 15) {
                            URLImage(urlString: news.urlToImage)
                            VStack(alignment: .leading, spacing: 10) {
                                let title = news.title ?? "No title"
                                Text(title).fontWeight(.heavy)
                                let description = news.desc ?? "No description"
                                Text(description).lineLimit(3)
                            }
                        }
                        .padding(3)
                    }
                }
                .onDelete(perform: deleteArticle)
            }
            .navigationTitle("Archive")
        }
    }

    private func deleteArticle(offsets: IndexSet) {
        withAnimation {
            offsets.map { index in
                let articleToDelete = news[index]
                managedObjContext.delete(articleToDelete)
            }

            // Saves to our database
            DataController().save(context: managedObjContext)
        }
    }
}

#Preview {
    Archive()
}
