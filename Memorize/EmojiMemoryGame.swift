//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Алексей Михайловский on 1.12.21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["✈️", "🚄", "🚀", "🚁", "🛻", "🚛", "🚜" , "🛵", "🚘", "🚠", "⛴", "🚲", "🚡", "🚃", "⛵️", "🚤", "🛸", "🏍", "🛴", "🚢", "🛶", "🚂", "🛰", "🚌"]
    
    static var pairs = 10
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: pairs) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func incrementPairs() {
        if EmojiMemoryGame.pairs < 24 {
            EmojiMemoryGame.pairs += 1
            model = EmojiMemoryGame.createMemoryGame()
        }
    }
    
    func decrementPairs() {
        if EmojiMemoryGame.pairs > 2 {
            EmojiMemoryGame.pairs -= 1
            model = EmojiMemoryGame.createMemoryGame()
        }
    }
    
    func reset() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
