//
//  ContentView.swift
//  Memorize
//
//  Created by Алексей Михайловский on 29.11.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(lineWidth: 3)
            
            Text("Hello, world!")
            
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
