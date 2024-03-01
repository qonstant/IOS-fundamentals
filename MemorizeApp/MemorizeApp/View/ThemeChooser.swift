//  ThemeChooser.swift
//  MemorizeApp
//
//  Created by Rakymzhan Zhabagin on 29.02.2024.

import SwiftUI

struct ThemeChooser: View {
    @EnvironmentObject var store: MemoryStore

    var body: some View {
        NavigationView {
            List {
                ForEach(store.themes) { theme in
                    ZStack {
                        EmojiThemeRow(theme: theme) {}
                        
                        NavigationLink(destination: EmojiGameView(viewModel: EmojiGame(theme: theme))) {
                            Color.clear
                        }
                        .opacity(0.0)
                        .buttonStyle(PlainButtonStyle())
                    }
                    .listRowBackground(theme.colorCards)
                }
                .listRowInsets(EdgeInsets())
            }
        }
        .navigationBarTitle("Memorize")
    }
}

struct EmojiThemeRow: View {
    let theme: Theme
    let editTheme: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(theme.themeName)
                    .font(.headline)
                    .padding(.bottom, 10)
                HStack(spacing: 70) {
                    Text("\(Image(systemName: "rectangle.on.rectangle")) \(theme.numberCards)")
                        .truncationMode(.tail)
                    Text("Emoji: \(theme.themeArray.joined())")
                        .lineLimit(1)
                }
            }
            Spacer()
        }
        .padding(20)
    }
}

struct ThemeChooser_Previews: PreviewProvider {
    static var previews: some View {
        ThemeChooser()
    }
}
