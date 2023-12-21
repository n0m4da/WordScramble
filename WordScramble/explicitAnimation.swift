//
//  explicitAnimation.swift
//  WordScramble
//
//  Created by Luis Rivera on 21/12/23.
//

import SwiftUI

struct explicitAnimation: View {
    //MARK: - PROPERTIES
    @State private var animation = 0.0
    
    //MARK: - BODY
    var body: some View {
        Button("tap me"){
            withAnimation{
                animation += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(
            .degrees(animation), axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}

#Preview {
    explicitAnimation()
}
