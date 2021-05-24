//
//  CheckBoxRow.swift
//  AlignGame
//
//  Created by Able on 19/05/21.
//

import SwiftUI

struct CheckBoxRow: View {
    var level: Int
    @ObservedObject var game: Game
    
    var body: some View {
        HStack {
            ForEach((0...game.xAxisSize - 1), id: \.self) { i in
                if (game.currentLength > 0 && (level == game.animatingLevel) && (game.currentIndex...(game.currentIndex + game.currentLength - 1)).map({ (x) -> Int in
                    x % game.xAxisSize
                }).contains(i)) {
                    CheckBox(isChecked: true)
                } else if ((game.lengthDictionary[level] ?? 0) > 0 && (level < game.animatingLevel) && ((game.indexDictionary[level] ?? 0)...((game.indexDictionary[level] ?? 0) + (game.lengthDictionary[level] ?? 0) - 1)).map({ (x) -> Int in
                    x % game.xAxisSize
                }).contains(i))  {
                    CheckBox(isChecked: true)
                } else {
                    CheckBox(isChecked: false)
                }
            }
        }
    }
}

struct CheckBox: View {
    @State var isChecked: Bool = false
    var body: some View {
        VStack {
            if isChecked  {
                Rectangle()
                    .frame(width: 14, height: 14)
                    .foregroundColor(Color.blue)
            }
        }.frame(width: 22, height: 22, alignment: .center).border(Color.black, width: 1).padding(.all, 1)
    }
}


struct CheckBoxRow_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxRow(level: 0, game: Game())
    }
}
