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
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    //MARK: - BODY
    
    var body: some View {
        
        NavigationStack{
            List{
                Section{
                    TextField("Enter your word", text: $newWord).textInputAutocapitalization(.never)
                }
                
                Section{
                    ForEach(usedWords, id: \.self ){ word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
               
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError){
                Button("OK"){}
            }message: {
                Text(errorMessage)
            }
            
            .toolbar{
                Button("Start Game"){
                    startGame()
                }
            }
        }
    }
    func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        guard isOriginal(word: answer) else{
            wordeRROR(title: "Word used already", message: "Be more original!")
            return
        }
        
        guard isPosible(word: answer) else{
            wordeRROR(title: "Word is not possible", message: "you cant spell that word from \(rootWord)!")
            return
        }
        
        guard isRealWord(word: answer) else {
            wordeRROR(title: "word not recognized", message:  "you cant just make them up, you know!")
            return
            
        }
        
        withAnimation{
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGame(){
        if let startWordsurl = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startwords = try? String(contentsOf: startWordsurl){
                let allWords =  startwords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool{
        !usedWords.contains(word)
    }
    
    func isPosible(word: String) -> Bool{
        var tempWord =  rootWord
        for letter in word{
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            } else{
                return false
            }
        }
        return true
    }
    
    func isRealWord(word: String) -> Bool{
        let hecker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange =  hecker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func wordeRROR(title: String, message: String){
        errorMessage = title
        errorMessage = message
        showingError = true
    }
    
    func lessThanTree(word: String) -> Bool{
        let count = word.count
        if(count<3){
            return true
        }
        return false
    }
}

#Preview {
    ContentView()
}
