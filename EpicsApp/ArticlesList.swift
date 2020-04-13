//
//  ArticlesList.swift
//  EpicsApp
//
//  Created by Carlo Forrest Dormiendo on 2020-03-25.
//  Copyright © 2020 Carlo Forrest Dormiendo. All rights reserved.
//

import SwiftUI

struct ArticlesList: View {

    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Related Articles")
                            .font(.system(size: 32))
                            .font(.title)
                            .kerning(-1)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9921568627, alpha: 1)))
                        Spacer()
                    }
                    Text("Leonard–Derozan Trade")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                }
                .padding(.vertical, 24)
                
                Spacer()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 12) {
                        ForEach(articleData.shuffled()) { item in
                            ArticleCardView(article: item)
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 44)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2705882353, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
            
        }
    }
}

struct ArticlesList_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesList()
    }
}

struct ArticleCardView: View {
    var article: Article2
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(article.source.uppercased())
                        .foregroundColor(Color.white)
                        .font(.system(size: 12))
                        .kerning(1)
                    Text(article.title)
                        .font(.system(size: 22, weight: .bold, design: .serif))
                        .kerning(-1)
                        .foregroundColor(Color.white)
                        .lineLimit(2)
                }
                
                HStack {
                    Image(article.authorImage)
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 24, height: 24)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding(.trailing, 8)
                    Text(article.author.uppercased())
                        .font(.caption)
                        .kerning(3)
                        .foregroundColor(Color.white)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            ZStack {
                Image(article.articleImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                
                Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1647058824, alpha: 0.1018100792)), Color(#colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1647058824, alpha: 0.5)), Color(#colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1647058824, alpha: 0.9567011444))]), startPoint: .top, endPoint: .bottom)
                .frame(width: 363-32, height: 261-32))

            }
        )
        .frame(width: 363-32, height: 261-32)
        .cornerRadius(8)
    }
    
}



struct Article2: Identifiable {
    var id = UUID()
    var articleImage: String
    var source: String
    var title: String
    var author: String
    var authorImage: String
}

let articleData = [
    Article2(
        articleImage: "player-article1",
        source: "The New York Times",
        title: "Kawhi Leonard Traded to Raptors for DeMar DeRozan",
        author: "Marc Stein",
        authorImage: "face-author1"
    ),
    
    Article2(
        articleImage: "player-article2",
        source: "The Athletic",
        title: "Lebron James Jumps Ship and Heads to Cleveland",
        author: "Eric Koreen",
        authorImage: "face-author2"
    ),
    
    Article2(
        articleImage: "player-article3",
        source: "The Score",
        title: "Raptors Rout Trailblazers in 112-89 win",
        author: "Jason Concepcion",
        authorImage: "face-author3"
    ),
    
    Article2(
        articleImage: "player-article4",
        source: "Global News",
        title: "Is Giannis Antetokounmpo Trying Too Hard?",
        author: "Kevin O'Connor",
        authorImage: "face-author4"
    ),
    
    Article2(
        articleImage: "player-article5",
        source: "ESPN",
        title: "Gar-Pax Wanted Dead or Alive by Bulls Mascot",
        author: "Bill Simmons",
        authorImage: "face-author5"
    ),
    
]
