//
//  ContentView.swift
//  rock_paper_scissor
//
//  Created by shalinth adithyan on 24/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var answers = ["Rock" , "Paper" , "Scissor"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var questionsCount = 0
    
    var body: some View {
        ZStack{
            Color.secondary
            .ignoresSafeArea()
            VStack {
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
