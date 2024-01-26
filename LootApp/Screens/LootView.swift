//
//  LootView.swift
//  LootApp
//
//  Created by Lou RASSAT on 1/26/24.
//

import SwiftUI
import Charts

struct LootView: View {
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
                        UserDefaults.standard.set(false, forKey: "isOnboardingDone")
                    }, label: {
                            Image(systemName: "arrow.counterclockwise.circle.fill")
                        })
                }
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }, label: {
                        Image(systemName: "pencil")
                    })
                }
            })
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(inventory)
            })
        }
    }
}

#Preview {
    LootView()
}
