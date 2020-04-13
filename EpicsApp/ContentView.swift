//
//  ContentView.swift
//  EpicsApp
//
//  Created by Carlo Forrest Dormiendo on 2020-03-22.
//  Copyright © 2020 Carlo Forrest Dormiendo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showStory = false
    @State var showFeed = false
    @State var showQuiz = false
    @State var tapCount = 0
    @State var stepCounter = 0
    @State var storyCount = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            
            OnboardView(stepCounter: $stepCounter)
            
            //QuizView(tapCount: $tapCount)
            
            if stepCounter == 5 {
                QuizView(tapCount: $tapCount)
                    .transition(.opacity)
                    .animation(.easeOut(duration: 0.4))
            }
            
            if tapCount == 5 {
                ResultsView(showStory: $showStory, showFeed: $showFeed)
                    .transition(.opacity)
                    .animation(.easeOut(duration: 0.4))
            }
            
            //ResultsView(showStory: $showStory)
            
            if showStory {
                
                StoryView(storyCount: $storyCount, showStory: $showStory)
                    .transition(.scale)
                    .animation(.easeOut(duration: 0.4))
                
                VStack {
                    HStack {
                        Image(systemName: "xmark")
                            .frame(width:36, height: 36)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                    }
                }
                .onTapGesture {
                    self.showStory.toggle()
                }
            }
            
            
            if showFeed {
                
                MyFeedView(showQuiz: $showQuiz)
                    .transition(.opacity)
                    .animation(.easeOut(duration: 0.4))
                
            }
            
            
            
            if showQuiz {
                
                QuizView(tapCount: .constant(0))
                    .transition(.opacity)
                    .animation(.easeOut(duration: 0.4))
                
            }
            
            //MyFeedView()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
