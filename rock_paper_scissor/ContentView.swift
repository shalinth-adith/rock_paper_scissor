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
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var showingScore = false
    @State private var questionsCount = 0
    @State private var checkAnswer: Bool = false
    @State private var scoreTitle : String = ""
    @State private var showFinalScore: Bool = false
    @State private var scoreMessage : String = ""
    
    var body: some View {
        ZStack{
            Color.indigo
                .ignoresSafeArea()
            VStack {
                Text("Rock Paper Scissor")
                    .titleStyle()
                Spacer()
                Text("Questions  : \(questionsCount)")
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
                            .font(.title)

                            .padding(10)
                            .foregroundStyle(.black)
                            .background(.ultraThinMaterial)
                            .clipShape(.rect(cornerRadius:20))

                        
                    }
                    Spacer()
                    
                }
                Text("Score : \(score)" )
                    .foregroundStyle(.black)
                    .font(.title.bold())
                
                
                
            }
            .padding()
            
        }
        
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestions)
        } message: {
            Text("Your score is: \(scoreMessage)")
        }
        .alert("Game Over", isPresented: $showFinalScore) {
            Button("Restart", action: resetGame)
        } message: {
            Text("Your final score is: \(score) out of 10")
        }
    }

        
    
    func ansTapped(_ playerChoice: Int) {
        questionsCount = questionsCount + 1
            let winMatrix = [
                0: 2, // Rock beats Scissors
                1: 0, // Paper beats Rock
                2: 1  // Scissors beats Paper
            ]
            let correctChoice: Int
               if shouldWin {
                   correctChoice = winMatrix.first(where: { $0.value == correctAnswer })!.key
               } else {
                   correctChoice  = winMatrix[correctAnswer]!
               }
            if playerChoice == correctChoice {
                score += 1
                scoreTitle = "Correct "
            }else{
                scoreTitle = "Wrong "
            }

            if questionsCount == 10 {
                showFinalScore = true
            }else{
                showingScore = true
            }
        }
        func askQuestions() {
            answers.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
        func resetGame() {
        score = 0
        questionsCount = 0
        showFinalScore = false
        askQuestions()
    }
    
}

#Preview {
    ContentView()
}
