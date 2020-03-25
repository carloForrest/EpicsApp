//
//  Data.swift
//  EpicsApp
//
//  Created by Carlo Forrest Dormiendo on 2020-03-25.
//  Copyright © 2020 Carlo Forrest Dormiendo. All rights reserved.
//

import SwiftUI

struct Article: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
}

class Api {
    func getArticles(completion: @escaping ([Article]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Article].self, from: data!)
//          print(posts)
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}
