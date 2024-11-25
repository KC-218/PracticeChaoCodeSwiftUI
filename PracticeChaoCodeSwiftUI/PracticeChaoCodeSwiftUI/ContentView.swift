//
//  ContentView.swift
//  PracticeChaoCodeSwiftUI
//
//  Created by Bruce Chen on 2024/11/16.
//

import SwiftUI

struct ContentView: View {
    
    let foodArray = Food.examples
    
    @State private var selectedFood: Food?
    @State private var isShowInfo: Bool = false

    var body: some View {
        
        VStack(spacing: 30) {
            Group {
                if selectedFood == .none {
                    Image("dinner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    Text(selectedFood!.image)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                }
            }
            .frame(height: 250)
            
            Text("今天吃什麼")
                .font(.title)
                .bold()
            
            if selectedFood != .none {
                
                VStack(spacing: 30) {
                    
                    HStack(spacing: 15) {
                        Text(selectedFood!.name)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.green)
                        
                        Button("", systemImage: "exclamationmark.circle.fill") {
                            isShowInfo.toggle()
                        }
                        .buttonStyle(.borderless)
                        .foregroundColor(Color.gray)
                        
                    }
                    
                        
                    Text("熱量 \(String(Int(selectedFood!.calorie))) 大卡")
           
                    if isShowInfo {
                        VStack {
                            
                            HStack(alignment: .center, spacing: 20) {
                                Text("蛋白質")
                                Text("脂肪")
                                Text("碳水")
                            }
                            Divider()
                            HStack(alignment: .center, spacing: 20) {
                                Text("\(String(selectedFood!.carb)) g")
                                Text("\(String(selectedFood!.fat)) g")
                                Text("\(String(selectedFood!.protein)) g")
                            }
                            
                        }
                        .frame(width: 250, height: 120)
                        .background(.white)
                        .font(.title3)
                        .cornerRadius(5)
                        .animation(.easeInOut, value: isShowInfo)
                        
                    }
                    
                }
                .id(selectedFood!.name)
                .transition(.asymmetric(
                    insertion: .opacity.animation(.easeInOut(duration: 0.5).delay(0.2))
                    , removal: .opacity.animation(.easeInOut(duration: 0.4))))
           
            }
            
           
            Spacer()
            
            Button {
                selectedFood = foodArray.shuffled().first
            } label: {
                Text(selectedFood == .none ? "告訴我" : "換一個").frame(width: 200)
            }
            .padding(.bottom, -15)
            .transformEffect(.identity)
            
            Button {
                selectedFood = .none
            } label: {
                Text("重置").frame(width: 200)
            }
            .buttonStyle(.bordered)
            
        }
        .padding()
        .frame(maxWidth: .infinity ,maxHeight: .infinity)
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
