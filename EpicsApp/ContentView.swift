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
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            OnboardView()
            ResultsView(showStory: $showStory)
            
            if showStory {
                
                StoryView()
                    .transition(.scale)
                    .transition(.opacity)
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
            
            //MyFeedView()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
