//
//  ContentView.swift
//  rock_paper_scissor
//
//  Created by shalinth adithyan on 24/05/25.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.black)
            .padding(.top)
            .clipShape(.rect)
            
            
    }
}
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    @State private var answers = ["Rock" , "Paper" , "Scissor"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var questionsCount = 0
    @State private var checkAnswer: Bool = false
    @State private var scoreTitle : String = ""
    @State private var showFinalScore: Bool = false
    
    var body: some View {
        ZStack{
            Color.secondary
                .ignoresSafeArea()
            VStack {
                Text("Rock Paper Scissor")
                    .titleStyle()
                Spacer()
                Text("Your Score : \(score)")
                Text("Questions Asked : \(questionsCount)")
                Spacer()
                //Button(action: {
                  //  self.answers = ["Rock" , "Paper" , "Scissor"].shuffled()
                    //self.correctAnswer = Int.random(in: 0...2)
                    //self.questionsCount += 1
                    
                //})
                ForEach(0..<3){ number in
                    Button{
                        ansTapped(number)
                    }label: {
                        Text(answers[number])
                            .clipShape(.rect(cornerRadius:10))
                            .padding(10)
                            .foregroundStyle(.black)
                            .shadow(radius: 5)
                            .font(.title)
                            .background(.ultraThinMaterial)
                    }
                    Spacer()
                    
                }
                    
                
                
            }
            .padding()
        }
    }
        func ansTapped(_ number: Int) {
            questionsCount = questionsCount + 1
            if number == correctAnswer {
                scoreTitle = "Correct Answer"
                score += 1
            } else {
                scoreTitle = "Wrong"
            }

            if questionsCount == 10 {
                showFinalScore = true
            }
        }
        func askQuestions() {
            answers.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    
}

#Preview {
    ContentView()
}
