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
    @State var showFeed = false
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                //PageHeader
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("These players match you.")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Text("Find out more about them.")
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
                        .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
                        .shadow(color: Color(#colorLiteral(red: 0.4509803922, green: 0.3843137255, blue: 0.968627451, alpha: 1)).opacity(0.25), radius: 6, x: 0, y: 0)
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2705882353, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                )
                
                Spacer()
                
                //Cards
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        VStack{
                            Spacer()
                                .frame(width: 30, height: 360)
                        }
                        ForEach(playerData) { item in
                            GeometryReader { geometry in
                                PlayerCardMiniView(player: item)
                                    .rotation3DEffect(Angle(degrees:
                                        Double(geometry.frame(in: .global).minX - 70) / -10
                                    ), axis: (x: 0, y: 20, z: 0))
                            }
                            .frame(width: 230, height: 360)
                            .onTapGesture {
                                withAnimation {
                                    self.showStory = true
                                }
                            }
                        }
                        
                        VStack{
                            Spacer()
                                .frame(width: 60, height: 360)
                        }
                    }
                    .padding()
                    .offset(x: 16, y: 0)
                }
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text(/*@START_MENU_TOKEN@*/"Follow Player"/*@END_MENU_TOKEN@*/.uppercased())
                        .foregroundColor(Color.white)
                        .kerning(3)
                }
                .padding(.horizontal, 72)
                .padding(.vertical, 18)
                .background(Color(#colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.7882352941, alpha: 1)))
                .cornerRadius(32)
                
                
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(showStory: .constant(false))
    }
}

struct PlayerCardMiniView: View {
    var player: Player
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            HStack {
                Text(player.firstName.uppercased())
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
            }
            HStack {
                Text(player.lastName.uppercased())
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .kerning(-1)
            }
            
            HStack {
                Text(player.att1.uppercased())
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(Color.white)
                    .kerning(3)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.black)
            .cornerRadius(16)
            
            HStack {
                Text(player.att2.uppercased())
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(Color.white)
                    .kerning(3)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.black)
            .cornerRadius(16)
            
            HStack {
                Text("View Story".uppercased())
                    .font(.subheadline)
                    .kerning(3)
                Image(systemName: "arrow.right")
            }
            .foregroundColor(Color.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1647058824, alpha: 0.1018100792)), Color(#colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1647058824, alpha: 0.5)), Color(#colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1647058824, alpha: 0.9567011444))]), startPoint: .top, endPoint: .bottom))
        .background(
            Image(player.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
            .cornerRadius(8)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.06), radius: 24, x: 0, y: 16)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.04), radius: 6, x: 0, y: 2)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.04), radius: 1, x: 0, y: 0)
    }
}

struct Player: Identifiable {
    var id = UUID()
    var image: String
    var firstName: String
    var lastName: String
    var att1: String
    var att2: String
}

let playerData = [
    Player(
        image: "card-player1",
        firstName: "Lebron",
        lastName: "James",
        att1: "98% | Experienced",
        att2: "94% | Versatile"
    ),
    
]

