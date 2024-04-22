//
//  Emoji_ArtApp.swift
//  Emoji Art
//
//  Created by Rakymzhan Zhabagin on 20/04/24.
//
//

import SwiftUI

@main
struct Emoji_ArtApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: { EmojiArtDocument() }) { config in
            EmojiArtDocumentView(document: config.document)
        }
    }
}
