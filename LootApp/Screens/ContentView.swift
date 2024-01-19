//
//  ContentView.swift
//  LootApp
//
//  Created by Lou RASSAT on 1/19/24.
//

import SwiftUI
import Charts

enum EnumSortBy: String, CaseIterable {
    case name
    case rarity

    func sortList(_ item1: LootItem, _ item2: LootItem) -> Bool {
        switch self {
        case .name:
            return item1.name < item2.name
        case .rarity:
            return item1.rarity.rawValue < item2.rarity.rawValue
        }
    }
}


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
    @State private var enumSortBy: EnumSortBy = .name

    var body: some View {
        NavigationStack {
            List {
                Section("Loot") {
                    ForEach(inventory.loot.sorted(by: enumSortBy.sortList)) { item in
                        NavigationLink {
                            LootDetailView(item: item)
                        } label: {
                            LootRow(item: item)
                        }
                    }
                }
                Section("Statistiques"){
                    Chart {
                        ForEach(inventory.loot) { item in
                            BarMark(
                                x: .value("Shape Type", item.name),
                                y: .value("Total Count", item.quantity)
                            ).foregroundStyle(item.rarity.color)
                        }
                    }
                }
                Section("Vos jeux"){
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(availableGames, id: \.self) { game in
                                HStack {
                                    LootImageGame(image: game.coverName)
                                    Text("\(game.name)")
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("👝 Inventaire")
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Picker("Sort By", selection: $enumSortBy) {
                        Text("Name").tag(EnumSortBy.name)
                        Text("Rarity").tag(EnumSortBy.rarity)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
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
