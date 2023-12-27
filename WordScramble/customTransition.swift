//
//  customTransition.swift
//  WordScramble
//
//  Created by Luis Rivera on 26/12/23.
//

import SwiftUI

struct CornderRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
           .clipped()
    }
}

extension AnyTransition {
    static var pivont : AnyTransition{
        .modifier(active: CornderRotateModifier(amount: -90, anchor: .topLeading), identity: CornderRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct customTransition: View {
    //MARK: - PROPERTIES
    @State private var isShowingRed = false
    //MARK: - BODY
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivont)
            }
        }
        .onTapGesture {
            withAnimation{
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    customTransition()
}
