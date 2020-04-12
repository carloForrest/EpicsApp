//
//  StoryView.swift
//  EpicsApp
//
//  Created by Carlo Forrest Dormiendo on 2020-04-10.
//  Copyright © 2020 Carlo Forrest Dormiendo. All rights reserved.
//

import SwiftUI

struct StoryView: View {
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            Image("story-player1")
            
            VStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Headline".uppercased())
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .kerning(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    
                    
                    Text("Lorem ipsum dolor sit amet conquistdatir lamen if oleg ramen turkey legs.")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                .padding(.horizontal, 32)
                .offset(y: -24)
                
                StoryNavView()
                
            }
            
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
