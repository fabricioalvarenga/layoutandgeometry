//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by FABRICIO ALVARENGA on 07/11/22.
//

import SwiftUI

// A parent view proposes a size for its child
// Based on that proposal the child then choses its own size and the parent must respect that choice
// The parent then positions the child in its coordinate space somehow

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@pretodopai")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                Image("Preto do pai")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
