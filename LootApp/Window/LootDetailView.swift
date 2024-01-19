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
                LootInformation(item: item)
            }
        }
    }
}

#Preview {
    LootDetailView(item: LootItem(id:UUID(), quantity: 2, name: "Épée", type: .dagger, rarity: .unique, attackStrength: 10, game: availableGames[0]))
}

