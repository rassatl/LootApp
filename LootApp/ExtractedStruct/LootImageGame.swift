//
//  LootImageGame.swift
//  LootApp
//
//  Created by Lou RASSAT on 1/19/24.
//

import Foundation
import SwiftUI

struct LootImageGame: View {
    @State var image: String?
    
    var body: some View {
        if let img = image {
            HStack {
                Image("\(img)")
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

    }
}

