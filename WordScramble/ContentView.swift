//
//  ContentView.swift
//  WordScramble
//
//  Created by Luis Rivera on 04/12/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let names: [String] = ["Luke","Leia","Vader","Solo"]
    
    //MARK: - BODY
    
    var body: some View {
        List{
            Text("Statick row top")
            ForEach(names, id: \.self){
                Text($0)
            }
            Text("static row bottom")
        }
       
    }
}

#Preview {
    ContentView()
}
