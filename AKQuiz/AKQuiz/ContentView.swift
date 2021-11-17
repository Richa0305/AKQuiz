//
//  ContentView.swift
//  AKQuiz
//
//  Created by richa.e.srivastava on 14/11/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameManagerVM: GameManagerVM
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .ignoresSafeArea()
            
            LinearGradient(colors: [.purple.opacity(0.4), .blue.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            if (gameManagerVM.model.quizCompleted) {
                QuizCompletedView(gameManagerVM: gameManagerVM)
            } else {
                VStack {
                    ReusableText(text: "Animal Knowledge Quiz!", size: 30)
                        .padding()
                    
                    ReusableText(text: gameManagerVM.model.quizModel.question, size: 25)
                        .lineLimit(3)
                        .frame(width: UIScreen.main.bounds.size.width - 20, height: 60, alignment: .center)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 15)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        
                        
                        Circle()
                            .trim(from: 0.0, to: min(CGFloat((Double(gameManagerVM.progress) * Double(gameManagerVM.maxProgress))/100),1.0))
                            .stroke(LinearGradient(colors: [.orange, .red],
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomTrailing),
                                    style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                            .rotationEffect(Angle(degrees: 270))
                            .animation(Animation.linear(duration: Double(gameManagerVM.maxProgress)), value: gameManagerVM.progress)
                        
                        ReusableText(text: String(gameManagerVM.progress), size: 30)
                    }.frame(width: 150, height: 150)
                    
                    
                    Spacer()
                    
                    OptionsGridView(gameManagerVM: gameManagerVM)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameManagerVM: GameManagerVM())
    }
}

