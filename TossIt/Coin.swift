//
//  Coin.swift
//  TossIt
//
//  Created by Agrima Purakkal on 16/4/2024.
//

import SwiftUI

func toss() -> String {
    let coin = ["head", "tail"]
    let random = coin.randomElement()!
    return random;
}

// In JS this would be sides = { head: "Heads", tail: "Tails" }
let sides = ["head": "Heads", "tail": "Tails"]


struct Coin: View {
    @State private var rotation = 0.0
    @State private var coin = toss()
    @State private var headCount = 0
    @State private var tailCount = 0
    
    var body: some View {
        VStack {
            Button {
                rotation += 180.0 * 10
                coin = toss()
                if (coin == "head") {
                    headCount += 1
                } else {
                    tailCount += 1
                }
            } label: {
                ZStack {
                    // back
                    Image("head")
                        .resizable()
                        .scaledToFill()
                        .imageScale(.small)
                        .foregroundStyle(.tint)
                        .rotation3DEffect(
                            .degrees(rotation),
                            axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                        )
                        .opacity(coin == "head" ? 1 : 0)
                        .clipShape(Circle())
                        .shadow(radius: 15)

                    // front
                    Image("tail")
                        .resizable()
                        .scaledToFill()
                        .imageScale(.small)
                        .foregroundStyle(.tint)
                        .rotation3DEffect(
                            .degrees(-180 + rotation),
                            axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                        )
                        .opacity(coin == "tail" ? 1 : 0)
                        .clipShape(Circle())
                        .shadow(radius: 15)

                }
                .animation(.easeOut(duration: 1.0))
            }
            .buttonStyle(PlainButtonStyle())
            
            Text("\(sides[coin] ?? "touch the coin to spin") \(coin == "head" ? headCount : tailCount)")
                .foregroundStyle(.white)
                .font(.title3)
        }
        .padding()
    }
}

#Preview {
    VStack {
        Coin()
    }.padding(100).background(.black)
}
