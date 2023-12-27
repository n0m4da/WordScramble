//
//  showingHiddenAnimation.swift
//  WordScramble
//
//  Created by Luis Rivera on 26/12/23.
//

import SwiftUI

struct showingHiddenAnimation: View {
    //MARK: - PROPERTIES
    
    @State private var isShowingRed = false
    var body: some View {
        VStack{
            Button("tap me"){
                withAnimation{
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                .frame(width: 200, height: 200)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))// they declare two anitmation one for open and one for disapear
            }
        }
    }
}

#Preview {
    showingHiddenAnimation()
}
