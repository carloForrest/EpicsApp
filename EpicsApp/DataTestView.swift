//
//  DataTestView.swift
//  EpicsApp
//
//  Created by Carlo Forrest Dormiendo on 2020-03-25.
//  Copyright © 2020 Carlo Forrest Dormiendo. All rights reserved.
//

import SwiftUI

struct DataTestView: View {
    @State var articles: [Article] = []
    
    var body: some View {
        List(articles) { article in
            HStack {
                Image("Logo1")
                    .padding(.trailing, 12)
                Spacer()
                VStack(alignment: .leading) {
                    Text(article.title.uppercased())
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(1)
                    Text(article.body)
                        .font(.subheadline)
                        .lineLimit(2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        .padding()
        }
        .onAppear {
            Api().getArticles { (articles) in
                self.articles = articles
            }
        }
    }
}

struct DataTestView_Previews: PreviewProvider {
    static var previews: some View {
        DataTestView()
    }
}
