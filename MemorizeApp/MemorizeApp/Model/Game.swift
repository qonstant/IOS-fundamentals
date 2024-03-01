//
//  Game.swift
//  MemorizeApp
//
//  Created by Rakymzhan Zhabagin on 29.02.2024.
//

import Foundation

struct Game<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    var score: Int = 0 //our score
    var isMatchedCard = false
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{ cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set{ cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue)}} }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),!cards[chosenIndex].isFaceUp,!cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score+=2
                    isMatchedCard = true
                }else {
                    if cards[potentialMatchIndex].seenBefore || cards[chosenIndex].seenBefore {
                        score -= 1
                    }
                    cards[potentialMatchIndex].seenBefore = true
                    cards[chosenIndex].seenBefore = true
                }
                cards[chosenIndex].isFaceUp = true
            }else{
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                isMatchedCard = false
            }
        }
        
    }
    
    func index(of card: Card)-> Int?{
        for index in 0..<8{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    
    struct Card: Identifiable{
        var isFaceUp = false{
            didSet{
                if isFaceUp{
                    startUsingBonusTime()
                }else{
                    stopUsingBonusTime()
                }
                
            }
        }
        var isMatched = false{
            didSet{
                stopUsingBonusTime()
            }
           
        }
       
        var seenBefore = false
        let content: CardContent
                let id: Int
                
               // bonus time
                var bonusTimeLimit: TimeInterval = 10
                
                // time counter for cards
                private var faceUpTime: TimeInterval {
                    if let lastFaceUpDate = self.lastFaceUpDate {
                        return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
                    } else {
                        return pastFaceUpTime
                    }
                }
                // the last time when the card was turned up
                var lastFaceUpDate: Date?
                
                var pastFaceUpTime: TimeInterval = 0
                
                var bonusTimeRemaining: TimeInterval {
                    max(0, bonusTimeLimit - faceUpTime)
                }

                var bonusRemaining: Double {
                    (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
                }

                var hasEarnedBonus: Bool {
                    isMatched && bonusTimeRemaining > 0
                }
              
                var isConsumingBonusTime: Bool {
                    isFaceUp && !isMatched && bonusTimeRemaining > 0
                }
                
           
                private mutating func startUsingBonusTime() {
                    if isConsumingBonusTime, lastFaceUpDate == nil {
                        lastFaceUpDate = Date()
                    }
                }
                
                private mutating func stopUsingBonusTime() {
                    pastFaceUpTime = faceUpTime
                    self.lastFaceUpDate = nil
                }
            }
    
       
    }


// Theme 
extension Array{
    var oneAndOnly: Element?{
        if count == 1 {
            return first
        }else{
            return nil
        }
    }
}
