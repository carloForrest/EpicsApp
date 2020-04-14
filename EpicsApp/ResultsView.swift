//
//  ResultsView.swift
//  EpicsApp
//
//  Created by Carlo Forrest Dormiendo on 2020-03-24.
//  Copyright © 2020 Carlo Forrest Dormiendo. All rights reserved.
//

import SwiftUI

struct ResultsView: View {
    @Binding var showStory: Bool
    @Binding var showFeed: Bool
    @State var cardState = CGSize.zero
    @State var cardState2 = false
    @State var cardState3 = false
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                //PageHeader
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("These players match you.")
                                .font(.system(size: 28))
                                .font(.title)
                                .kerning(-1)
                                .fontWeight(.bold)
                                .foregroundColor(Color(#colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9921568627, alpha: 1)))
                            Text("Find out more about them.")
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
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/20.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.7882352941, alpha: 1)))
                        .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
                        .shadow(color: Color(#colorLiteral(red: 0.4509803922, green: 0.3843137255, blue: 0.968627451, alpha: 1)).opacity(0.25), radius: 6, x: 0, y: 0)
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2705882353, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                )
                
                
                //Cards
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        VStack{
                            Spacer()
                                .frame(width: 40, height: 360)
                        }
                        ForEach(playerData) { item in
                            GeometryReader { geometry in
                                PlayerCardMiniView(player: item)
                                    .rotation3DEffect(Angle(degrees:
                                        Double(geometry.frame(in: .global).minX - 70) / -10
                                    ), axis: (x: 0, y: 20, z: 0))
                            }
                            .frame(width: 260, height: 400)
                            .offset(x: self.cardState.width)
                            .animation(.spring())
                            .gesture(
                                DragGesture().onChanged { value in
                                    self.cardState = value.translation
                                    if self.cardState2 {
                                        self.cardState.width += -270
                                    } else if self.cardState3 {
                                        self.cardState.width += -532
                                    }
                                }
                                .onEnded { value in
                                    if self.cardState.width < -127 && self.cardState.width > -400 {
                                        self.cardState.width = -270
                                        self.cardState2 = true
                                        
                                    } else if self.cardState.width < -400 {
                                        self.cardState.width = -532
                                        self.cardState3 = true
                                        
                                    } else if self.cardState.width > -127 {
                                        self.cardState.width = 0
                                        self.cardState3 = false
                                        self.cardState2 = false
                                    }
                                }
                            )
                            .onTapGesture {
                                withAnimation {
                                    self.showStory.toggle()
                                }
                            }
                        }
                        
                        VStack{
                            Spacer()
                                .frame(width: 40, height: 360)
                        }
                    }
                    .padding()
                    .offset(x: 0, y: 0)
                }
                
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom) {
                        Text("Interest Score:")
                            .font(.system(size: 18))
                            .font(.headline)
                            .kerning(-1)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9921568627, alpha: 1)))
                        Text(cardState2 ? "87%" : "98%")
                            .font(.system(size: 24))
                            .font(.headline)
                            .kerning(-1)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9921568627, alpha: 1)))
                    }
                    HStack(spacing: 2) {
                        Rectangle()
                            .foregroundColor(Color(#colorLiteral(red: 0.4509803922, green: 0.3843137255, blue: 0.968627451, alpha: 1)))
                            .opacity(0.2)
                        Rectangle()
                            .foregroundColor(Color(#colorLiteral(red: 0.4509803922, green: 0.3843137255, blue: 0.968627451, alpha: 1)))
                            .opacity(0.4)
                        Rectangle()
                            .foregroundColor(Color(#colorLiteral(red: 0.4509803922, green: 0.3843137255, blue: 0.968627451, alpha: 1)))
                            .opacity(0.6)
                        Rectangle()
                            .foregroundColor(Color(#colorLiteral(red: 0.4509803922, green: 0.3843137255, blue: 0.968627451, alpha: 1)))
                            .opacity(0.8)
                        Rectangle()
                            .foregroundColor(Color(#colorLiteral(red: 0.4509803922, green: 0.3843137255, blue: 0.968627451, alpha: 1)))
                            .opacity(1)
                    }
                    .frame(height: 6)
                    .overlay(
                        Circle()
                            .frame(width: 12, height: 12, alignment: .leading)
                            .foregroundColor(Color.white)
                            .offset(x: cardState2 ? 120 : 156)
                            .offset(x: cardState3 ? -30 : 0)
                            .animation(Animation.easeInOut(duration: 0.4).delay(0.2))
                    )
                    
                }
                .padding(.horizontal, 32)
                
                Spacer()
                
                Button(action: { self.showFeed.toggle() }) {

                    //Text("\(cardState.width)")
                    //    .foregroundColor(Color.white)
                    
                    Text(/*@START_MENU_TOKEN@*/"Follow Player"/*@END_MENU_TOKEN@*/.uppercased())
                        .foregroundColor(Color(#colorLiteral(red: 0.8684264921, green: 0.8684264921, blue: 1, alpha: 1)))
                        .kerning(3)
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 12)
                .background(Color(#colorLiteral(red: 0.0758826858, green: 0.0758826858, blue: 0.1180397335, alpha: 1)))
                .cornerRadius(32)
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(Color(#colorLiteral(red: 0.3882352941, green: 0.3882352941, blue: 0.9843137255, alpha: 0.5)), lineWidth: 2)
                )
                
                
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(showStory: .constant(false), showFeed: .constant(false))
    }
}

struct PlayerCardMiniView: View {
    var player: Player
    
    var body: some View {
        VStack(alignment: .leading){
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(player.firstName.uppercased())
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .kerning(1)
                }
                HStack {
                    Text(player.lastName.uppercased())
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(Color.white)
                        .kerning(-1)
                }
                
                HStack {
                    Text(player.att1.uppercased())
                        .font(.system(size: 14, design: .monospaced))
                        .foregroundColor(Color.white)
                        .kerning(3)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3882352941, green: 0.3882352941, blue: 0.9843137255, alpha: 1)),Color(#colorLiteral(red: 0.3215686275, green: 0.3215686275, blue: 0.7058823529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(12)
                
                HStack {
                    Text(player.att2.uppercased())
                        .font(.system(size: 14, design: .monospaced))
                        .foregroundColor(Color.white)
                        .kerning(3)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3882352941, green: 0.3882352941, blue: 0.9843137255, alpha: 1)),Color(#colorLiteral(red: 0.3215686275, green: 0.3215686275, blue: 0.7058823529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(12)
                .padding(.bottom, 8)
                
                HStack {
                    VStack {
                        Text("\(player.ppg)")
                            .font(.headline)
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                            .kerning(1)
                        Text("PPG")
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(Color.white)
                            .kerning(3)
                    }
                    Spacer()
                    VStack {
                        Text("8.4")
                            .font(.headline)
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                            .kerning(1)
                        Text("APG")
                        .font(.system(size: 12, design: .monospaced))
                        .foregroundColor(Color.white)
                        .kerning(3)
                    }
                    Spacer()
                    VStack {
                        Text("3.5")
                            .font(.headline)
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                            .kerning(1)
                        Text("RPG")
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(Color.white)
                            .kerning(3)
                    }
                }
                .padding(.bottom, 12)
                .padding(.horizontal, 8)
                
                HStack {
                    Text("View Story".uppercased())
                        .font(.subheadline)
                        .kerning(3)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(Color.white)
            }
            .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 0)), Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 0)),Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 0.5)),Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 0.801331426)), Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .background(
            Image(player.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
            .cornerRadius(8)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.06), radius: 24, x: 0, y: 16)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.04), radius: 6, x: 0, y: 2)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.04), radius: 1, x: 0, y: 0)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(#colorLiteral(red: 0.3882352941, green: 0.3882352941, blue: 0.9843137255, alpha: 0.8212753081)), lineWidth: 2)
        )
    }
}

struct Player: Identifiable {
    var id = UUID()
    var image: String
    var firstName: String
    var lastName: String
    var att1: String
    var att2: String
    var ppg: String
}

let playerData = [
    Player(
        image: "card-kyle",
        firstName: "Kyle",
        lastName: "Lowry",
        att1: "97%|Leader",
        att2: "94%|Expressive",
        ppg: "14.7"
    ),
    
    Player(
        image: "card-lebron",
        firstName: "Lebron",
        lastName: "James",
        att1: "99%|Experienced",
        att2: "87%|Versatile",
        ppg: "27.1"
    ),
    
    Player(
        image: "card-steph",
        firstName: "Stephen",
        lastName: "Curry",
        att1: "84%|Experienced",
        att2: "78%|Leader",
        ppg: "23.1"
    ),
    
]

