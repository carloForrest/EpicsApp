//
//  MyFeedView.swift
//  EpicsApp
//
//  Created by Carlo Forrest Dormiendo on 2020-04-01.
//  Copyright © 2020 Carlo Forrest Dormiendo. All rights reserved.
//

import SwiftUI

struct MyFeedView: View {
    @Binding var showQuiz: Bool
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                //PageHeader
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("MyFeed")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                        .padding(.top, 72)
                        .padding(.bottom, 24)
                        .padding(.horizontal, 24)
                        Spacer()
                    }
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2705882353, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.all)
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        FeedFilterView()
                        
                        VStack {
                            Image(systemName: "plus")
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(Color.white)
                                .frame(width: 48, height: 48)
                                .background(Color.gray)
                                .clipShape(Circle())
                            
                            Text("Add Player")
                                .font(.footnote)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(width: 48)
                                .lineSpacing(/*@START_MENU_TOKEN@*/-2.0/*@END_MENU_TOKEN@*/)
                        }
                        .onTapGesture {
                            withAnimation {
                                self.showQuiz = true
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 8)
                    .padding(.bottom, 16)
                }
                
                Spacer()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 12) {
                        ForEach(articleData) { item in
                            ArticleCardView(article: item)
                        }
                    }
                }
            }
        }
    }
}

struct MyFeedView_Previews: PreviewProvider {
    static var previews: some View {
        MyFeedView(showQuiz: .constant(false))
    }
}

struct FeedFilterView: View {
    var body: some View {
        VStack {
            Image("face-player1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.white, lineWidth: 1)
                        .frame(width: 56, height: 56)
                )
            
            Text("Player Name")
                .font(.footnote)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .frame(width: 48)
                .lineSpacing(/*@START_MENU_TOKEN@*/-2.0/*@END_MENU_TOKEN@*/)
        }
    }
}
