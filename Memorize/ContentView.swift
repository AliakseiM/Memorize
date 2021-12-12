//
//  ContentView.swift
//  Memorize
//
//  Created by Алексей Михайловский on 29.11.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    let colorRed = (name: "Red", value: Color.red)
    let colorGray = (name: "Gray", value: Color.gray)
    let colorMint = (name: "Mint", value: Color(hue: 0.496, saturation: 1.0, brightness: 0.855))
    
    @State var cardColor: Color = .gray
    
    var body: some View {
        VStack {
            VStack() {
                HStack() {
                    Button(colorRed.name, action: { cardColor = colorRed.value }).foregroundColor(colorRed.value)
                    Button(colorGray.name, action: { cardColor = colorGray.value }).foregroundColor(colorGray.value)
                    Button(colorMint.name, action: { cardColor = colorMint.value }).foregroundColor(colorMint.value)
                    
                    Spacer()
                    Text("Taps:")
                    Text("\(viewModel.tap)")
                        
                }
                HStack() {
                    Image(systemName: "plus.circle").onTapGesture {
                        viewModel.incrementPairs()
                    }
                    Image(systemName: "minus.circle").onTapGesture {
                        viewModel.decrementPairs()
                    }
                    Spacer()
                    Button("Reset", action: viewModel.reset)
                }
            }.padding(.leading, 5.0).padding(.trailing, 10.0).font(.title2)
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(1/1, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                                viewModel.addTap()
                            }
                    }
                }
            }
            .onTapGesture {
                viewModel.closeAll()
            }
            .foregroundColor(cardColor)
        }
        .padding(.horizontal)
    }
    
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 5.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape .strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        ContentView(viewModel: game)
            
    }
}
