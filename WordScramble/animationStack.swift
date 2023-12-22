//
//  animationStack.swift
//  WordScramble
//
//  Created by Luis Rivera on 22/12/23.
//

import SwiftUI

struct animationStack: View {
    //MARK: - PROPERTIES
    
    @State private var enable = false
    
    //MARK: - BODY
    var body: some View {
        Button("tapme"){
            //MARK: - do something
            
            enable.toggle()
        }
        .frame(width: 300, height: 200)
        .background(enable ? .blue : .red)
        .foregroundStyle(.white)
        .animation(.default, value: enable)//.default can be null
        .clipShape(.rect(cornerRadius: enable ? 60: 0))
        .animation(.spring(duration: 1, bounce: 0.9), value: enable)
      
        
    }
}

#Preview {
    animationStack()
}
