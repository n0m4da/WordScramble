//
//  animation.swift
//  WordScramble
//
//  Created by Luis Rivera on 20/12/23.
//

import SwiftUI

struct animation: View {
    //MARK: - PROPERTIES
    @State private var animationAmount = 1.0
    
    
    //MARK: - BODY
    var body: some View {
   
        
            ZStack{
                Button("Tap me!"){
                    //animationAmount += 1
                }
                .padding(50)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                // .blur(radius: (animationAmount - 1) * 3)
                .overlay(
                    Circle()
                        .stroke(.red)
                        .scaleEffect(animationAmount)
                        .opacity(2 - animationAmount)
                        .animation(
                            .easeOut(duration: 1)
                            .repeatForever( autoreverses: false),
                            value: animationAmount
                        )
                    
                )
                .onAppear{
                    animationAmount = 2
                }
            }
            
            
            // .animation(.linear(duration: 1), value: animationAmount) add duration time
             //.animation(.easeOut(duration: 1), value: animationAmount)
             //.animation(.easeInOut(duration: 2).delay(1), value: animationAmount)// add delaty to start animation afeter tap
            //MARK: - toolbar buttons
           

        }
}

#Preview {
    animation()
}
