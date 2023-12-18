//
//  shinelikeadiamond.swift
//  WordScramble
//
//  Created by Luis Rivera on 16/12/23.
//

import SwiftUI
extension View {
    @ViewBuilder
    func shine(_ toggle: Bool, duration: CGFloat = 0.5, clipShape: some Shape = .rect, rightToLeft: Bool = false) -> some View {
         
        let glossyGradientColors: [Color] = [
            .clear,
            .clear,
            .white.opacity(0.1),
            .white.opacity(0.5),
            .white.opacity(0.8),
            .white.opacity(0.5),
            .white.opacity(0.1),
            .clear,
            .clear
        ]
         
        self
            .overlay {
                GeometryReader {
                    let size = $0.size
                     
                    let moddedDuration = max(0.3, duration)
                    Rectangle()
                        .fill(.linearGradient(colors: glossyGradientColors, startPoint: .leading, endPoint: .trailing))
                        .scaleEffect(y: 8)
                        .keyframeAnimator(initialValue: 0.0, repeating: true, content: {
                            content, progress in
                            content
                                .offset(x: -size.width + (progress * (size.width * 2.4) ))
                        }, keyframes: { _ in
                            CubicKeyframe(.zero, duration: 0.1)
                            CubicKeyframe(1, duration: moddedDuration)
                            
                             
                        })
                        .offset(x: -100)
                        .rotationEffect(.init(degrees: 45))
                        .scaleEffect(x: rightToLeft ? -1 : 1)
                }
            }
            .clipShape(clipShape)
    }
}

struct shinelikeadiamond: View {
    @State private var shine : Bool = false
    var body: some View {
        VStack(spacing: 16) {
            Image("applelogo")
                .resizable()
                .frame(width: 250, height: 250)
                .shine(shine, duration: 0.8, clipShape: .rect(cornerRadius: 20), rightToLeft: false)
                .onTapGesture {
                    shine.toggle()
                }
        }
    }
    
}

#Preview {
    shinelikeadiamond()
}
