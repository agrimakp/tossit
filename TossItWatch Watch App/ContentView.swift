//
//  ContentView.swift
//  TossItWatch Watch App
//
//  Created by Agrima Purakkal on 16/4/2024.
//

import SwiftUI

struct ContentView: View {
    let colors = [Color(#colorLiteral(red: 0.07857587188, green: 0.06764737517, blue: 0.296828568, alpha: 1)), Color(#colorLiteral(red: 0.06097411364, green: 0.04310516268, blue: 0.1557132304, alpha: 1)), Color(#colorLiteral(red: 0.03118984215, green: 0.02621547319, blue: 0.05542177707, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),Color(#colorLiteral(red: 0.03118984215, green: 0.02621547319, blue: 0.05542177707, alpha: 1)), Color(#colorLiteral(red: 0.06097411364, green: 0.04310516268, blue: 0.1557132304, alpha: 1)), Color(#colorLiteral(red: 0.07857587188, green: 0.06764737517, blue: 0.296828568, alpha: 1))]

    @State var start = UnitPoint(x: 0, y: 0)
    @State var end = UnitPoint(x: 1, y: 1)
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Coin()
                }.padding()
            }
    }
}

#Preview {
    ContentView()
}
