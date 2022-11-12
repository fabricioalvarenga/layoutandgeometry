//
//  ContentView2.swift
//  LayoutAndGeometry
//
//  Created by FABRICIO ALVARENGA on 08/11/22.
//

import SwiftUI

struct ContentView2: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
//                            .background(colors[index % 7])
                            .background(Color(hue: geo.frame(in: .global).minY / fullView.size.height, saturation: 1, brightness: 1))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(geo.frame(in: .global).minY / fullView.size.height)
                            .scaleEffect(x: geo.frame(in: .global).minY / fullView.size.height)
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
