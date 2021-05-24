//
//  ContentView.swift
//  AlignGame
//
//  Created by Able on 19/05/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: Game = Game()
    init() {
        game.setAxisLengthBasedOn((UIScreen.main.bounds.height - 60) / 35, UIScreen.main.bounds.width / 35)
    }
    var body: some View {
        ZStack {
            VStack {
                GameView(game: game)
                Controls(game: game)
            }
            if (game.gameOver) {
                GameOverDialog(game: game).background(Color.white)
                    .transition(.scale)
            }
        }
    }
}

struct GameOverDialog: View {
  @ObservedObject var game: Game

  var body: some View {
    VStack(spacing: 10) {
        Text("Game Over").foregroundColor(Color.red)
        Button(action: {
            withAnimation {
            game.reset()
            }
        }) {
            Text("Start New Game")
              .bold()
              .padding(10)
              .frame(maxWidth: .infinity)
              .background(
                Color.blue
              )
              .foregroundColor(.white)
              .cornerRadius(12.0)
        }
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color.white)
    .cornerRadius(20)
    .shadow(radius: 10, x: 5, y: 5)
  }
}

struct GameOverDialog_Previews: PreviewProvider {
    static private var game = Game()
      static var previews: some View {
        GameOverDialog(game: game)
      }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
