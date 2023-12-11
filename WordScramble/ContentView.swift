//
//  ContentView.swift
//  WordScramble
//
//  Created by Luis Rivera on 04/12/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    //MARK: - BODY
    
    var body: some View {
        
        NavigationStack{
            List{
                Section{
                    TextField("Enter your word", text: $newWord)
                }
                
                Section{
                    ForEach(usedWords, id: \.self ){ word in
                        Text(word)
                    }
                }
               
            }
            . navigationTitle(rootWord)
            .onSubmit(addNewWord)
            
        }
    }
    func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        usedWords.insert(answer, at: 0)
        newWord = ""
    }
}

#Preview {
    ContentView()
}
