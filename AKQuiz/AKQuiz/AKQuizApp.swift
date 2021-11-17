//
//  AKQuizApp.swift
//  AKQuiz
//
//  Created by richa.e.srivastava on 14/11/2021.
//

import SwiftUI

@main
struct AKQuizApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(gameManagerVM: GameManagerVM())
        }
    }
}
