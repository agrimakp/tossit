//
//  ContentView.swift
//  TossIt
//
//  Created by Agrima Purakkal on 8/4/2024.
//

import SwiftUI

func toss() -> String {
    let coin = ["head", "tail"]
    let random = coin.randomElement()!
    return random;
}

// In JS this would be sides = { head: "Heads", tail: "Tails" }
let sides = ["head": "Heads", "tail": "Tails"]

struct ContentView: View {
    @State var isPlaying : Bool = false
    @State var coin = toss()
    let colors = [Color(#colorLiteral(red: 0.07857587188, green: 0.06764737517, blue: 0.296828568, alpha: 1)), Color(#colorLiteral(red: 0.06097411364, green: 0.04310516268, blue: 0.1557132304, alpha: 1)), Color(#colorLiteral(red: 0.03118984215, green: 0.02621547319, blue: 0.05542177707, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),Color(#colorLiteral(red: 0.03118984215, green: 0.02621547319, blue: 0.05542177707, alpha: 1)), Color(#colorLiteral(red: 0.06097411364, green: 0.04310516268, blue: 0.1557132304, alpha: 1)), Color(#colorLiteral(red: 0.07857587188, green: 0.06764737517, blue: 0.296828568, alpha: 1))]

    @State var start = UnitPoint(x: 0, y: 0)
    @State var end = UnitPoint(x: 1, y: 1)
    
    @State var rotation = 0.0

    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Button {
                        rotation += 180.0 * 10
                        coin = toss()
                    } label: {
                        ZStack {
                            // back
                            Image("head")
                                .imageScale(.small)
                                .foregroundStyle(.tint)
                                .rotation3DEffect(
                                    .degrees(rotation),
                                    axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                                )
                                .opacity(coin == "head" ? 1 : 0)
                            // front
                            Image("tail")
                                .imageScale(.small)
                                .foregroundStyle(.tint)
                                .rotation3DEffect(
                                    .degrees(-180 + rotation),
                                    axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                                )
                                .opacity(coin == "tail" ? 1 : 0)
                        }
                        .animation(.easeOut(duration: 1.0))

                    }
                    Text(sides[coin] ?? "Nani")
                        .foregroundStyle(.white)
                        .font(.title)
                }
                .padding()
            }
    }
}

#Preview {
    ContentView()
}
