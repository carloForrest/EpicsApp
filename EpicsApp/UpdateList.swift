//
//  UpdateList.swift
//  EpicsApp
//
//  Created by Carlo Forrest Dormiendo on 2020-03-23.
//  Copyright © 2020 Carlo Forrest Dormiendo. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(image: "Card1", title: "New Item", text: "text", date: "Jan 1"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) {
                        HStack {
                            Image(update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                            
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete { index in
                    self.store.updates.remove(at: index.first!)
                }
                .onMove{ ( source: IndexSet, destination: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationBarTitle(Text("DubBurgerMenus"))
            .navigationBarItems(leading: Button(action: addUpdate) {
                Text("Add Update")
            }, trailing: EditButton())
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(
        image: "Card1",
        title: "Cardo",
        text: "I did a semester at UofT for life science so I'm basically an expert let's go",
        date: "JAN 1"),
    Update(
        image: "Card2",
        title: "Adamamdmdmdmdmd",
        text: "Design and animate a high converting landing page with advanced interactions, payments and CMS",
        date: "OCT 17"),
    Update(
        image: "Card3",
        title: "Aiden",
        text: "Quickly prototype advanced animations and interactions for mobile and Web.",
        date: "AUG 27"),
    Update(
        image: "Card4",
        title: "Jessy",
        text: "The last hackathon we were in caused a pandemic LOL",
        date: "JUNE 26"),
    Update(
        image: "Card5",
        title: "Corona",
        text: "Create powerful animations and interactions with the Framer X code editor",
        date: "JUN 11")
    
]
