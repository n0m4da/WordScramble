//
//  Lists.swift
//  WordScramble
//
//  Created by Luis Rivera on 04/12/23.
//

import SwiftUI

struct Lists: View {
    var body: some View {
        List{
            Section("Section 1"){
                Text("Statick row 1")
                Text("Statick row 2")
            }
            
            Section("Section 2"){
                ForEach(0..<5){
                    Text("Dynamic row \($0)")
                }}
            
            Section("Section 3"){
                
                Text("Statick row 3")
                Text("Statick row 4")
                
            }
        
        }
        .listStyle(.grouped)
    }
}

#Preview {
    Lists()
}
