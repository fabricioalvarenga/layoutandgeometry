//
//  ContentView1.swift
//  LayoutAndGeometry
//
//  Created by FABRICIO ALVARENGA on 07/11/22.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            
            GeometryReader { geo in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center is \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Local center is \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                        print("Custom center is \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                    }
            }
            .background(.orange)
            
            Text("Right")
        }
    }
}

struct ContentView1: View {
    var body: some View {
        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom") }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
