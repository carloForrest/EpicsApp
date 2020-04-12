//
//  AssessmentView.swift
//  codeTutorial_ListDraggable
//
//  Created by Carlo Dormiendo on 3/25/20.
//  Refrenced code by Christopher Guirguis on 3/25/20.
//  Copyright © 2020 Christopher Guirguis. All rights reserved.
//

import SwiftUI

struct AssessmentView: View {
    @State var playerValues = [
        "Confidence",
        "Experience",
        "Versatility",
        "Leadership",
        "Expressiveness",
        "Loyalty",
        "Skill",
        ]
    @State var editingList = true
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)), Color(#colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05882352941, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("What’s most important to you?")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Text("Rank the following based on importance.")
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
                
                List{
                    ForEach(0..<playerValues.count){i in
                        HStack {
                            Text("\(i + 1).")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.trailing, 4)
                                .foregroundColor(Color.white)
                            Text("\(self.playerValues[i])")
                                .font(.headline)
                                .fontWeight(.bold)
                                .frame(width: 210, height: 32)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .foregroundColor(Color.white)
                                .background(Color(#colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.4078431373, alpha: 1)))
                                .cornerRadius(8)
                                .lineLimit(nil)
                        }
                    }
                    .onMove(perform: move)
                    .onTapGesture {
                        withAnimation{
                            self.editingList.toggle()
                        }
                    }
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .listRowBackground(Color(#colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.2745098039, alpha: 1)))
                    
                }
                .environment(\.editMode, editingList ? .constant(.active) : .constant(.inactive))
            }
        }
        
    }
    
    func move(fromOffsets source: IndexSet, toOffsets destination: Int) {
        playerValues.move(fromOffsets: source, toOffset: destination)
        withAnimation {
            editingList = false
        }
    }
    
}

struct AssessmentView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentView()
    }
}
