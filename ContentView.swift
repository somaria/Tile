

import SwiftUI

struct ContentView: View {
   
   let tiles = ["l", "a", "n", "d"]
   
    var body: some View {
        VStack {
           TilesView(tiles: tiles)
        }
        .padding()
    }
}

struct TilesView: View {
   
   let tiles: [String]
   var tilesOne: [String]
   var tilesTwo: [String]
   
   func shuffleArrayExceptFirstElement(_ array: [String]) -> [String] {
          guard array.count > 1 else { return array }
          
          var shuffledArray: [String]
          repeat {
              shuffledArray = array
              for i in 1..<shuffledArray.count {
                  let randomIndex = Int.random(in: 1..<shuffledArray.count)
                  shuffledArray.swapAt(i, randomIndex)
              }
          } while shuffledArray == array || shuffledArray.first != array.first
          
          return shuffledArray
      }

      //create function shuffleArrayExceptFirstElementTwo so that tilesTwo is not equal to tilesOne or tiles
      func shuffleArrayExceptFirstElementTwo(_ array: [String], _ arrayOne: [String]) -> [String] {
          guard array.count > 1 else { return array }
          
          var shuffledArray: [String]
          repeat {
              shuffledArray = array
              for i in 1..<shuffledArray.count {
                  let randomIndex = Int.random(in: 1..<shuffledArray.count)
                  shuffledArray.swapAt(i, randomIndex)
              }
          } while shuffledArray == array || shuffledArray == arrayOne || shuffledArray.first != array.first
          
          return shuffledArray
      }
   
   init(tiles: [String]) {
      self.tiles = tiles
      self.tilesOne = []
      self.tilesTwo = []
      self.tilesOne = shuffleArrayExceptFirstElement(self.tiles)
      self.tilesTwo = shuffleArrayExceptFirstElementTwo(self.tiles, self.tilesOne)
      
      
   }
   
   var body: some View {
      VStack {
         HStack {
            ForEach(tiles, id: \.self) { tile in
               Text(tile)
                  .padding(.horizontal, 16)
                  .font(.system(size: 36))
                  .border(.cyan)
                  .cornerRadius(2)
            }
         }
         HStack {
            ForEach(tilesOne, id: \.self) { tile in
               Text(tile)
                  .padding(.horizontal, 16)
                  .font(.system(size: 36))
                  .border(.cyan)
                  .cornerRadius(2)
            }
         }
         HStack {
            ForEach(tilesTwo, id: \.self) { tile in
               Text(tile)
                  .padding(.horizontal, 16)
                  .font(.system(size: 36))
                  .border(.cyan)
                  .cornerRadius(2)
            }
         }
      }
   }
}


extension Array where Element: Comparable {
    func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count && self.sorted() == other.sorted()
    }
}


