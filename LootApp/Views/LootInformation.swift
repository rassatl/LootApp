//
//  LootInformation.swift
//  LootApp
//
//  Created by Lou RASSAT on 1/19/24.
// push autre branche

import Foundation
import SwiftUI


struct LootInformation: View {
    @State var item: LootItem
    
    var body: some View {
        Section(header: Text("Information")){
            HStack {
                LootImageGame(image: item.game.coverName)
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
