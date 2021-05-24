//
//  Controls.swift
//  AlignGame
//
//  Created by Able on 19/05/21.
//

import SwiftUI

struct Controls: View {
    @ObservedObject var game: Game
    
    var body: some View {
        HStack {
            Button(action: {
                game.reset()
            }, label: {
                Text("Restart")
            })
            Spacer()
            Button(action: {}, label: {
                Text("Easy")
            })
        }.padding()
    }
}
