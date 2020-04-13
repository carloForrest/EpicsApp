//
//  StoryNavView.swift
//  EpicsApp
//
//  Created by Carlo Forrest Dormiendo on 2020-04-11.
//  Copyright © 2020 Carlo Forrest Dormiendo. All rights reserved.
//

import SwiftUI

struct StoryNavView: View {
    @State var showArticles = false
    @Binding var storyCount: Int
    @Binding var showStory: Bool
    
    var body: some View {
        HStack {
            Button(action: { self.storyCount -= 1 }) {
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

struct StoryNavView_Previews: PreviewProvider {
    static var previews: some View {
        StoryNavView(storyCount: .constant(0), showStory: .constant(false))
    }
}
