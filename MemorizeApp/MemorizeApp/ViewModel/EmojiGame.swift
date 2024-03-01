//
//  EmojiGame.swift
//  MemorizeApp
//
//  Created by Rakymzhan Zhabagin on 29.02.2024.
//

import SwiftUI

class EmojiGame: ObservableObject{
    typealias Card = Game<String>.Card
        
        @Published private var model: Game<String>
        var theme: Theme {
            didSet {
                newGame()
            }
        }
        
        init(theme: Theme? = nil) {
            self.theme = theme ?? Theme.themes.randomElement()!
            let emoji = self.theme.themeArray.shuffled()
            let numberOfPairs = min(self.theme.numberCards, emoji.count)
            model = Game(numberOfPairsOfCards: numberOfPairs) { pairIndex in
                emoji[pairIndex]
        }
    }
    
    static func createGame(theme: Theme) -> Game<String> {
        let shuffledArray = theme.themeArray.shuffled()
        return Game<String>(numberOfPairsOfCards: theme.numberCards) { pairIndex in
            shuffledArray[pairIndex]
        }
    }

    func setScore() -> String {
        return String(model.score)
    }

    func newGame() {
        model = EmojiGame.createGame(theme: theme)
    }

    func setColor() -> Color{
            theme.colorCards
    }
    
    func setBorderColor() -> Color{
           return model.isMatchedCard ? Color.green : setColor()
    }
    
    var cards: Array<Card>{
        model.cards
    }
    
    func choose(_ card: Card){
        model.choose(card)
    }

    func shuffle(){
        model.shuffle()
    }
}
