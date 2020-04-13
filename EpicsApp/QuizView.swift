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
    
    var body: some View {
        
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)            
            
            VStack {
                //PageHeader
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("What do you value more?")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Text("Tell us about you and the players you like.")
                                .font(.subheadline)
                                .foregroundColor(Color.white)
                        }
                        .padding(.top, 72)
                        .padding(.bottom, 32)
                        .padding(.horizontal, 24)
                        Spacer()
                    }
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/20.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.7882352941, alpha: 1)))
                        .frame(maxWidth: CGFloat(tapCount*80), minHeight: 2, maxHeight: 2)
                        .shadow(color: Color(#colorLiteral(red: 0.4509803922, green: 0.3843137255, blue: 0.968627451, alpha: 1)).opacity(0.25), radius: 6, x: 0, y: 0)
                        .animation(.spring())
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2705882353, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                )
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
