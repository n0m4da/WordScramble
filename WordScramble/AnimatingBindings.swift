//
//  AnimatingBindings.swift
//  WordScramble
//
//  Created by Luis Rivera on 21/12/23.
//

import SwiftUI

struct AnimatingBindings: View {
    //MARK: -  PROPERTIES
    @State private var animationAmount = 1.0
    //MARK: - BODY
    var body: some View {
        print(animationAmount)
        
        return VStack{
            Stepper("Scale Amount", value: $animationAmount.animation(
                .easeInOut(duration: 1).repeatCount(2, autoreverses: true)), in: 1...10)
                
            
            Spacer()
            
            Button("tap me"){
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
    }
}

#Preview {
    AnimatingBindings()
}
