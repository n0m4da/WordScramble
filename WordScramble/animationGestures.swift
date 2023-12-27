//
//  animationGestures.swift
//  WordScramble
//
//  Created by Luis Rivera on 23/12/23.
//

import SwiftUI

struct animationGestures: View {
    //MARK: - PROPERTIES
    @State private var dargAmount = CGSize.zero
    //MARK: - BODY
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .leading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dargAmount)
            .gesture(
                DragGesture()
                    .onChanged{ dargAmount = $0.translation}
                    .onEnded(){_ in
                        withAnimation(.bouncy){
                            dargAmount = .zero
                        }}
            )
//            .gesture(
//                DragGesture()
//                    .onChanged{
//                    dargAmount = $0.translation}
//                    .onEnded{_ in dargAmount = .zero}
//            )
           // .animation(.bouncy, value: dargAmount)
    }
}

#Preview {
    animationGestures()
}
