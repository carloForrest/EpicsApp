//
//  OnboardView.swift
//  EpicsApp
//
//  Created by Carlo Forrest Dormiendo on 2020-03-27.
//  Copyright © 2020 Carlo Forrest Dormiendo. All rights reserved.
//

import SwiftUI

struct OnboardView: View {
    @Binding var stepCounter: Int
    @State var firstPage = true
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Image(onboardImage[stepCounter])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 360, alignment: .center)
                Spacer()
                
                HStack {
                    VStack(alignment: .leading, spacing: 8){
                        Text(onboardTitle[stepCounter])
                            .font(.system(size: 36))
                            .font(.title)
                            .kerning(-1)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9921568627, alpha: 1)))
                            .transition(.opacity)
                            .animation(.easeOut(duration: 0.4))
                        
                        Text(onboardBody[stepCounter])
                            .font(.system(size: 18))
                            .font(.subheadline)
                            .kerning(0.2)
                            .fontWeight(.regular)
                            .foregroundColor(Color(#colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.9098039216, alpha: 1)))
                            .transition(.opacity)
                            .animation(.easeOut(duration: 0.4))
                    }
                }
                .padding(.horizontal, 32)
                Spacer()
                
                HStack {
                    Button(action: { self.stepCounter -= 1 }) {
                        Image(systemName: "arrow.left.circle")
                        Text("Back".uppercased())
                            .font(.subheadline)
                            .kerning(2)
                    }
                    .offset(x: firstPage ? 0 : -300)
                    .foregroundColor(Color(#colorLiteral(red: 0.8684264921, green: 0.8684264921, blue: 1, alpha: 1)))
                    
                    Spacer()
                    
                    Button(action: { self.stepCounter += 1 } ) {
                        Text("Next".uppercased())
                            .font(.subheadline)
                            .kerning(2)
                        Image(systemName: "arrow.right.circle")
                    }
                    .foregroundColor(Color(#colorLiteral(red: 0.8684264921, green: 0.8684264921, blue: 1, alpha: 1)))
                }
                .padding(.horizontal, 48)
            }
        }
    }
}


struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView(stepCounter: .constant(0))
    }
}

let onboardImage = [
    "onboard1",
    "onboard2",
    "onboard3",
    "onboard4",
    "onboard5",
    "onboard5",
    "onboard5"
]

let onboardTitle = [
    
    "Welcome to Epics",
    "Tell us about yourself.",
    "Explore the players we recommend.",
    "Follow a player.",
    "Get started.",
    "Get started.",
    "Get started."
]

let onboardBody = [
    
    "The companion app for aspiring and casual fans that helps you learn about the epic stories of the NBA.",
    "Answer a short quiz so we can get an idea of what kind of player we think you’ll like.",
    "Discover the stories of the players we suggest based on the results of your quiz.",
    "Choose from the players we suggest and get notified about stories, highlights and updates on those players.",
    "Take the quiz and discover your player.",
    "Take the quiz and discover your player.",
    "Take the quiz and discover your player.",
    
]
