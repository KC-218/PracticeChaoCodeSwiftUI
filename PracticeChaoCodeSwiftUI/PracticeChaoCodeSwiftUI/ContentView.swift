//
//  ContentView.swift
//  PracticeChaoCodeSwiftUI
//
//  Created by Bruce Chen on 2024/11/16.
//

import SwiftUI

struct ContentView: View {
    
    let foodArray = ["漢堡", "沙拉", "披薩", "義大利麵", "雞腿便當", "刀削麵", "火鍋", "牛肉麵", "關東煮"]
    
    @State private var selectedFood: String?
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("今天吃什麼")
                .font(.title)
                .bold()
            
            if selectedFood != .none {
                Text(selectedFood ?? "")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
            }
            
            
            Button {
                selectedFood = foodArray.shuffled().first ?? ""
            } label: {
                Text(selectedFood == .none ? "告訴我" : "換一個").frame(width: 200)
            }
            .padding(.bottom, -15)
            
            Button {
                selectedFood = .none
            } label: {
                Text("重置").frame(width: 200)
            }
            .buttonStyle(.bordered)
            
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color(uiColor: .secondarySystemBackground))
        .font(.title)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .animation(.easeInOut, value: selectedFood)
        
    }
}

#Preview {
    ContentView()
}
