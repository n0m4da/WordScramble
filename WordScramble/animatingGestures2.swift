//
//  animatingGestures2.swift
//  WordScramble
//
//  Created by Luis Rivera on 23/12/23.
//

import SwiftUI

struct animatingGestures2: View {
    //MARK: - properties
    
    let letter = Array("hello swift!!")
    
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    var body: some View {
        HStack{
            ForEach(0..<letter.count, id:\.self){num in
                Text(String(letter[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
                
            }
        }
        .gesture(
        DragGesture()
            .onChanged{ dragAmount = $0.translation}
            .onEnded{ _ in dragAmount = .zero
                enabled.toggle()}
        )
    }
}

#Preview {
    animatingGestures2()
}
