//
//  GameView.swift
//  AlignGame
//
//  Created by Able on 19/05/21.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var game: Game
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            VStack {
                ForEach((0...game.yAxisSize - 1).reversed(), id: \.self) { i in
                    CheckBoxRow(level: i, game: game)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onReceive(timer) { _ in
                game.updateCurrentIndex()
            }
            VStack {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.opacity(0.1))
            .onTapGesture {
                game.onTap()
            }
        }
        
    }
}
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: Game())
    }
}
