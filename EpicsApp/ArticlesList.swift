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
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
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
                        ForEach(articleData) { item in
                            ArticleCardView(article2: item)
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
    var article2: Article2
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(article2.source.uppercased())
                        .foregroundColor(Color.white)
                        .font(.system(size: 12))
                        .kerning(1)
                    Text(article2.title)
                        .font(.system(size: 24, weight: .bold, design: .serif))
                        .kerning(-1)
                        .foregroundColor(Color.white)
                        .lineLimit(2)
                }
                
                HStack {
                    Image(article2.authorImage)
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 24, height: 24)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding(.trailing, 8)
                    Text(article2.author.uppercased())
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
                Image(article2.articleImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                
                Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1647058824, alpha: 0.1018100792)), Color(#colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1647058824, alpha: 0.5)), Color(#colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1647058824, alpha: 0.9567011444))]), startPoint: .top, endPoint: .bottom)
                .frame(width: 363, height: 261))

            }
        )
        .frame(width: 363, height: 261)
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
        articleImage: "article-image",
        source: "The New York Times",
        title: "Kawhi Leonard Traded to Raptors for DeMar DeRozan",
        author: "Marc Stein",
        authorImage: "Avatar"
    ),
    
    Article2(
        articleImage: "globalnews-image",
        source: "Global News Canada",
        title: "Toronto Raptors trade DeMar DeRozan for Kawhi Leonard",
        author: "Marc Stein",
        authorImage: "Avatar"
    ),
    
    Article2(
        articleImage: "forbes",
        source: "Forbes",
        title: "Kawhi Leonard Makes Money In Trade To High-Tax Toronto, But DeMar DeRozan Makes Millions More",
        author: "Sean Packard",
        authorImage: "Avatar"
    ),
    
    Article2(
        articleImage: "article-image",
        source: "Bleacher Report",
        title: "Kyle Lowry Not Ready to Comment on Kawhi Leonard, DeMar DeRozan Trade",
        author: "Alec Nathan",
        authorImage: "Avatar"
    ),
    
    Article2(
        articleImage: "article-image",
        source: "The New York Times",
        title: "Kawhi Leonard Traded to Raptors for DeMar DeRozan",
        author: "Marc Stein",
        authorImage: "Avatar"
    ),
    
    Article2(
        articleImage: "article-image",
        source: "The New York Times",
        title: "Kawhi Leonard Traded to Raptors for DeMar DeRozan",
        author: "Marc Stein",
        authorImage: "Avatar"
    ),
    
    Article2(
        articleImage: "article-image",
        source: "The New York Times",
        title: "Kawhi Leonard Traded to Raptors for DeMar DeRozan",
        author: "Marc Stein",
        authorImage: "Avatar"
    ),
]
