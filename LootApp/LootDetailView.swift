//
//  LootDetailView.swift
//  LootApp
//
//  Created by Lou RASSAT on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    @State var item: LootItem
    var body: some View {
        Rectangle()
            .fill(Color(item.rarity.color).gradient)
            .frame(width: 150, height: 150)
            .cornerRadius(20)
            .shadow(color: Color(item.rarity.color), radius: 40)
            .overlay(
                Text("\(item.type.rawValue)")
                    .font(.system(size: 80))
            )
        Spacer()
            .frame(width: 0, height: 30)
        
        Text("\(item.name)")
            .font(.system(size: 40))
            .bold()
            .foregroundColor(item.rarity.color) 
        
        if item.rarity.rawValue == Rarity.unique.rawValue {
                Rectangle()
                    .fill(Color(item.rarity.color).gradient)
                    .frame(width: 350, height: 50)
                .cornerRadius(20)
                .overlay(
                    Text("Item Unique 🏆")
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                )
        }
        Section{
            List([1], id: \.self) { _ in
                HStack {
                    if item.game.coverName != "" {
                        HStack {
                            Image("\(item.game.coverName!)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 100)
                                .cornerRadius(4)
                        }
                    }else {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.gray, .gray.opacity(0.4)]),
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                            )
                            .overlay{
                                Image(systemName: "rectangle.slash")
                                    .foregroundColor(.black)
                                    .opacity(0.4)
                                    .padding(1)
                            }
                            .frame(width: 58, height: 80)
                    }
                    Text("\(item.game.name)")
                }
                Text("In-game : \(item.name)")
                if item.attackStrength != nil {
                    Text("Puissance (ATQ) : \(item.attackStrength!)")
                }
                Text("Possédé : \(item.quantity)")
                Text("Rareté : \(item.rarity.rawValue)")
            }
        }
    }
}

#Preview {
    LootDetailView(item: LootItem(id:UUID(), quantity: 2, name: "Épée", type: .dagger, rarity: .unique, attackStrength: 10, game: availableGames[0]))
}

