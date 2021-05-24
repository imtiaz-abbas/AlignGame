//
//  Game.swift
//  AlignGame
//
//  Created by Able on 19/05/21.
//

import Foundation
import CoreGraphics
import Combine

class Game: ObservableObject {
    @Published var xAxisSize: Int = 8
    @Published var yAxisSize: Int = 10
    
    @Published var animatingLevel: Int = 1
    @Published var currentLength = 5
    @Published var currentIndex = 0
    
    @Published var indexDictionary: [Int: Int] = [:]
    @Published var lengthDictionary: [Int: Int] = [:]
    
    @Published var gameOver: Bool = false
    private var goingForward = true
    
    func updateCurrentIndex() {
        goingForward = goingForward ? !(currentIndex == xAxisSize - currentLength) : currentIndex == 0
        currentIndex = goingForward ? currentIndex + 1 : currentIndex - 1
    }
    
    func setAxisLengthBasedOn(_ screenHeight: CGFloat, _ screenWidth: CGFloat) {
        xAxisSize = Int(screenWidth)
        yAxisSize = Int(screenHeight)
        indexDictionary = [0: xAxisSize/2 - 2]
        lengthDictionary = [0: currentLength]
    }
    
    func onTap() {
        let lockedCurrentIndex = currentIndex
        indexDictionary[animatingLevel] = lockedCurrentIndex
        let prevIndex = indexDictionary[animatingLevel - 1] ?? 0
        let indexDifference = lockedCurrentIndex - prevIndex
        lengthDictionary[animatingLevel] = currentLength
        if indexDifference <= 0 {
            currentLength = currentLength + indexDifference
        } else {
            let prevLength = lengthDictionary[animatingLevel - 1] ?? 0
            var lengthDifference = currentLength - prevLength
            if lengthDifference < 0 {
                lengthDifference = lengthDifference * -1
            }
            if !(indexDifference + currentLength < prevLength) {
                currentLength = (currentLength -
                    (lengthDifference > indexDifference ? (lengthDifference - indexDifference) : (indexDifference - lengthDifference)))
            }
        }
        if (currentLength <= 0) {
            gameOver = true
        }
        animatingLevel += 1
    }
    
    func reset() {
        gameOver = false
        animatingLevel = 1
        currentLength = 5
        currentIndex = 0
        indexDictionary = [0: xAxisSize / 2 - 2]
        lengthDictionary = [0: 5]
    }
}
