//
//  QuizView.swift
//  EpicsApp
//
//  Created by Carlo Forrest Dormiendo on 2020-04-11.
//  Copyright © 2020 Carlo Forrest Dormiendo. All rights reserved.
//

import SwiftUI

struct QuizView: View {
    @Binding var tapCount: Int
    @State var show = false
    
    var body: some View {
        
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)            
            
            VStack {
                //PageHeader
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("What do you value more?")
                                .font(.system(size: 32))
                                .font(.title)
                                .kerning(-1)
                                .fontWeight(.bold)
                                .foregroundColor(Color(#colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9921568627, alpha: 1)))
                            Text("Tell us about you.")
                                .font(.system(size: 18))
                                .font(.headline)
                                .kerning(0.5)
                                .fontWeight(.regular)
                                .foregroundColor(Color(#colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.9098039216, alpha: 1)))
                        }
                        .padding(.top, 48)
                        .padding(.bottom, 32)
                        .padding(.horizontal, 24)
                        Spacer()
                    }
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundColor(Color(#colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.7882352941, alpha: 1)))
                        .frame(maxWidth: CGFloat(tapCount*80), minHeight: 2, maxHeight: 2)
                        .shadow(color: Color(#colorLiteral(red: 0.4509803922, green: 0.3843137255, blue: 0.968627451, alpha: 1)).opacity(0.25), radius: 6, x: 0, y: 0)
                        .animation(.spring())
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2705882353, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                )
                
                ScrollView(.vertical, showsIndicators: false)  {
                    VStack(spacing: 16) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(0 ..< (20 - tapCount*2)) { item in
                                    GeometryReader { geometry in
                                        HStack {
                                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2705882353, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                        }
                                        .background(Color.white)
                                        .cornerRadius(4)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 2 * CGFloat(self.tapCount))
                                                .stroke(Color(#colorLiteral(red: 0.3882352941, green: 0.3882352941, blue: 0.9843137255, alpha: 0.5)), lineWidth: 2)
                                        )
                                    }
                                    .frame(width: 50 + CGFloat(self.tapCount*25), height: 80 + CGFloat(self.tapCount*50))
                                }
                            }
                            .offset(x: show ? -30 : 0, y: 0)
                            .animation(Animation.linear(duration: 20).repeatForever(autoreverses: true))
                            .onAppear {self.show = true}
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(0 ..< (20 - tapCount*2)) { item in
                                    GeometryReader { geometry in
                                        HStack {
                                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2705882353, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                        }
                                        .background(Color.white)
                                        .cornerRadius(4)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 2 * CGFloat(self.tapCount))
                                                .stroke(Color(#colorLiteral(red: 0.3882352941, green: 0.3882352941, blue: 0.9843137255, alpha: 0.5)), lineWidth: 2)
                                        )
                                    }
                                    .frame(width: 50 + CGFloat(self.tapCount*25), height: 80 + CGFloat(self.tapCount*50))
                                }
                            }
                            .offset(x: show ? 0 : -80, y: 0)
                            .animation(Animation.linear(duration: 20).repeatForever(autoreverses: true))
                            .onAppear {self.show = true}
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(0 ..< (20 - tapCount*2)) { item in
                                    GeometryReader { geometry in
                                        HStack {
                                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2705882353, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                        }
                                        .background(Color.white)
                                        .cornerRadius(4)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 2 * CGFloat(self.tapCount))
                                                .stroke(Color(#colorLiteral(red: 0.3882352941, green: 0.3882352941, blue: 0.9843137255, alpha: 0.5)), lineWidth: 2)
                                        )
                                    }
                                    .frame(width: 50 + CGFloat(self.tapCount*25), height: 80 + CGFloat(self.tapCount*50))
                                }
                            }
                            .offset(x: show ? -100 : 0, y: 0)
                            .animation(Animation.linear(duration: 20).repeatForever(autoreverses: true))
                            .onAppear {self.show = true}
                        }
                    }
                    
                    
                }
                .padding(.top, 24)
                
                Spacer()
                
                VStack {
                    Button(action: { self.tapCount += 1 }) {
                        Text(answersOne[tapCount])
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 320, height: 84, alignment: .center)
                    .background(Color(#colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.7882352941, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                    Spacer()
                    
                    Button(action: { self.tapCount += 1 }) {
                        Text(answersTwo[tapCount])
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 320, height: 84, alignment: .center)
                    .background(Color(#colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.7882352941, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                }
                .frame(height: 180, alignment: .center)
                .padding(12)
                .background(Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 4))
                
            }
        }
    }
    
    
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(tapCount: .constant(0))
    }
}

let answersOne = [
    "Youth", "Versatility", "Confidence", "Expressiveness", "Leadership", "0"
]

let answersTwo = [
    "Experience", "Specialization", "Humility", "Calmness", "Following", "0"
]
