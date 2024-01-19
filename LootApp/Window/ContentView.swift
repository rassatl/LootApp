//
//  ContentView.swift
//  LootApp
//
//  Created by Lou RASSAT on 1/19/24.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot = [
        LootItem(id:UUID(), quantity: 2, name: "Épée", type: .dagger, rarity: .common, attackStrength: 10, game: availableGames[0]),
        LootItem(id:UUID(),name: "Bouclier", type: .shield, rarity: .rare, attackStrength: nil, game: availableGames[1]),
        LootItem(id:UUID(),name: "Arc", type: .bow, rarity: .uncommon, attackStrength: 8, game: availableGames[0]),
        LootItem(id:UUID(),name: "Bague", type: .ring, rarity: .rare, attackStrength: 15, game: availableGames[3]),
        LootItem(id:UUID(),name: "Magie", type: .magic, rarity: .legendary, attackStrength: 15, game: availableGames[3]),
        LootItem(id:UUID(),name: "Boost de vitesse", type: .magic, rarity: .legendary, attackStrength: nil, game: availableGames[3]),
        LootItem(id:UUID(),name: "Potion de poison", type: .poison, rarity: .legendary, attackStrength: 20, game: availableGames[2]),
        LootItem(id:UUID(),name: "Marteau de Thor", type: .thunder, rarity: .unique, attackStrength: 40, game: availableGames[0]),
        LootItem(id:UUID(),name: "Pouvoir du dernier maître de l'air", type: .wind, rarity: .unique, attackStrength: 36, game: availableGames[0]),
        LootItem(id:UUID(),name: "Pouvoir de glace", type: .ice, rarity: .unique, attackStrength: 45, game: availableGames[0]),
        LootItem(id:UUID(),name: "Pouvoir de feu", type: .fire, rarity: .unique, attackStrength: 46, game: availableGames[0]),
    ]

    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @State var showAddItemView = false
    @StateObject var inventory = Inventory()

    var body: some View {
        NavigationStack {
            List {
                ForEach(inventory.loot) { item in
                    NavigationLink {
                        LootDetailView(item: item)
                    } label: {
                        LootRow(item: item)
                    }
                }
            }
            .navigationBarTitle("👝 Inventaire")
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            })
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(inventory)
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
