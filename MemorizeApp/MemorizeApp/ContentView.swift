//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Rakymzhan Zhabagin on 28.02.2024.
//

import SwiftUI

//ViewModel

class EmojiMemoryGame: ObservableObject{
    typealias Card = MemoryGame<String>.Card
        
        @Published private var model: MemoryGame<String>
        var theme: Theme {
            didSet {
                newGame()
            }
        }
        
        init(theme: Theme? = nil) {
            self.theme = theme ?? Theme.themes.randomElement()!
            let emoji = self.theme.themeArray.shuffled()
            let numberOfPairs = min(self.theme.numberCards, emoji.count)
            model = MemoryGame(numberOfPairsOfCards: numberOfPairs) { pairIndex in
                emoji[pairIndex]
        }
    }


    
   
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let shuffledArray = theme.themeArray.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberCards) { pairIndex in
            shuffledArray[pairIndex]
        }
    }

    
    
   
    
    func setScore() -> String {
        return String(model.score)
    }

  
   

    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
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
    //MARK: -Intent(s)
    
   
    
    func choose(_ card: Card){
        model.choose(card)
    }

    func shuffle(){
        model.shuffle()
    }
    

}
