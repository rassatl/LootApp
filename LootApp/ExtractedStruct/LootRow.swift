//
//  LootRow.swift
//  LootApp
//
//  Created by Lou RASSAT on 1/19/24.
//

import Foundation
import SwiftUI

struct LootRow: View {
    @State var item: LootItem
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .fill(Color(item.rarity.color))
                    .frame(width: 12, height: 12)
                Text("\(item.name) x\(item.quantity)")
                    .font(.headline)
                Spacer()
                Text("\(item.type.rawValue)")
            }
        }
        .id(item.id)
    }
}
