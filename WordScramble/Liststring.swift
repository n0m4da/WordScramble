//
//  Liststring.swift
//  WordScramble
//
//  Created by Luis Rivera on 11/12/23.
//

import SwiftUI

struct Liststring: View {
    var body: some View {
        Button("simon", action: testStrings)
             
          }
          
          func testBundles() {
              if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt"){
                  //MARK: - check for content
                  if (try? String(contentsOf: fileURL)) != nil{
                      //MARK: - read string
                  }
              }else{
                  
              }
          }
          
          func testStrings(){
              let word = "swift"
              let checker = UITextChecker()
              let range =  NSRange(location: 0, length: word.utf16.count)
              
              let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
              
              print(misspelledRange)
              
              let allGood = misspelledRange.location == NSNotFound
              print(allGood)
                      
      //        let inpunt = """
      //        a
      //        b
      //        c
      //        """
      //        let letters = inpunt.components(separatedBy: "\n")
      //        let letter = letters.randomElement()
      //        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
          }
      
    
}

#Preview {
    Liststring()
}
