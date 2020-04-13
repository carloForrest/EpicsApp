//
//  StoryView.swift
//  EpicsApp
//
//  Created by Carlo Forrest Dormiendo on 2020-04-10.
//  Copyright © 2020 Carlo Forrest Dormiendo. All rights reserved.
//

import SwiftUI

struct StoryView: View {
    @State var showArticles = false
    @Binding var storyCount: Int
    @Binding var showStory: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            Image("story-player1")
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(storyTitle[storyCount].uppercased())
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .kerning(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        .transition(.opacity)
                        .animation(.easeOut(duration: 0.6))
                    
                    
                    Text(storyBody[storyCount])
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .transition(.opacity)
                        .animation(.easeOut(duration: 0.4))
                }
                .padding(.horizontal, 32)
                .offset(y: -24)
                
                HStack {
                    Button(action: {
                        if self.storyCount > -1 {
                        self.storyCount -= 1
                    } else {
                        self.showStory.toggle()
                    }}) {
                        Image(systemName: "arrow.left")
                        Text("Back")
                    }
                    .foregroundColor(Color.white)
                    
                    Spacer()
                    
                    Button(action: { self.showArticles.toggle() }) {
                        Text("Read More")
                        Image(systemName: "arrow.up")
                    }
                    .sheet(isPresented: $showArticles) {
                        ArticlesList()
                    }
                    .foregroundColor(Color.white)
                    
                    Spacer()
                    
                    Button(action: {
                        if self.storyCount < 5 {
                            self.storyCount += 1
                        } else {
                            self.showStory.toggle()
                        }
                        
                    }) {
                        Text("Next")
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(Color.white)
                }
                .padding(48)
                
            }
            
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(storyCount: .constant(0), showStory: .constant(false))
    }
}

let storyImage = [
    
    "story-lowry1",
    "story-lowry2",
    "story-lowry3",
    "story-lowry4",
    "story-lowry5",
    
]

let storyTitle = [
    
    "Fearless leader",
    "Toronto-bound",
    "Lebronto",
    "New faces",
    "Victory lap",
    
]

let storyBody = [
    
    "Lowry was drafted by the Memphis Grizzlies. He became known for his tenacity, fearlessness, and leadership.",
    "He landed in Toronto following a trade and formed a friendship with teammate DeMar DeRozan.",
    "For several years they played well in the regular season, only to be defeated by LeBron James in the playoffs.",
    "In 2018 DeRozan was traded to the San Antonio Spurs for Kawhi Leonard– an MVP caliber talent.",
    "This season, he’s leading a new, younger Raptors team to the next phase of their future– and possibly another championship."
    
]
