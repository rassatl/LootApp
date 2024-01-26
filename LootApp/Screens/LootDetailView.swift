//
//  LootDetailView.swift
//  LootApp
//
//  Created by Lou RASSAT on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    @State var item: LootItem
    @State private var animationAmount = 0.0
    @State private var isAppeared : Bool = false
    @State private var randomDirection : (x: CGFloat, y: CGFloat, z: CGFloat) = (1, 1, 0)

    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .fill(Color(item.rarity.color).gradient)
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)
                    .overlay(
                        Text("\(item.type.rawValue)")
                            .font(.system(size: 80))
                    )
                    .task {
                        do {
                            try await Task.sleep(nanoseconds: 400000000)
                            isAppeared = true
                        }catch {
                            print("erreur")
                        }
                    }
                    .rotation3DEffect(.degrees(animationAmount), axis: randomDirection)
                    .scaleEffect(isAppeared ? 1.0 : 0.5)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            animationAmount += 45
                            randomDirection = (CGFloat(Int.random(in: 0...1)),CGFloat(Int.random(in: 0...1)),CGFloat(Int.random(in: 0...1)))
                            print(randomDirection)
                        }
                    }
                    .onAppear() {
                        withAnimation(.spring(duration: 1).delay(0.5)) {
                            animationAmount += 360
                        }
                        withAnimation(.easeInOut(duration: 0.8).delay(1.0)) {
                            isAppeared = true
                        }
                    }
                    .shadow(color: item.rarity.color, radius: isAppeared ? 20 : 0)
                
                Spacer().frame(width: 0, height: 30)
                
                Text("\(item.name)")
                    .font(.system(size: 40))
                    .bold()
                    .foregroundColor(item.rarity.color)
                
                if item.rarity.rawValue == Rarity.unique.rawValue {
                    Text("Item Unique 🏆")
                        .padding()
                        .font(.system(size: 20))
                        .background(Color(item.rarity.color).gradient)
                        .foregroundColor(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12.0))
                        .task {
                            do {
                                try await Task.sleep(nanoseconds: 800000000)
                                isAppeared = true
                            }catch {
                                print("erreur")
                            }
                        }
                        .scaleEffect(isAppeared ? 1 : 0)
                        .animation(.spring().delay(0.2), value: isAppeared)
                }
                Section{
                    List([1], id: \.self) { _ in
                        LootInformation(item: item)
                    }
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                    }, label: {
                        HStack {
                            Image(systemName: "pencil")
                            Text("Editer")
                        }
                    })
                }
            })
        }
    }
}

#Preview {
    LootDetailView(item: LootItem(id:UUID(), quantity: 2, name: "Épée", type: .dagger, rarity: .unique, attackStrength: 10, game: availableGames[0]))
}

