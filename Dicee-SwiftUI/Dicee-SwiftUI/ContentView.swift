//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by 박새별 on 2023/03/19.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 3
    
    var body: some View {
        ZStack {
            Image(K.Images.background)
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Image(K.Images.diceeLogo)
                Spacer()
                HStack(alignment: .center, spacing: 20.0) {
                    DiceView(image: getDiceImage(number: leftDiceNumber)!)
                    DiceView(image: getDiceImage(number: rightDiceNumber)!)
                }.padding(.horizontal)
                Spacer()
//                Button("Roll", action: {
//                    leftDiceNumber = randomDice()
//                    rightDiceNumber = randomDice()
//                }).font(.system(size: 50))
//                    .fontWeight(.heavy)
//                    .foregroundColor(.white)
//                    .padding(.horizontal)
//                    .background(Color.red)

                Button {
                    leftDiceNumber = randomDice()
                    rightDiceNumber = randomDice()
                } label: {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
                    
                Text("").font(.system(size: 0))
            }
        }
    }
}

func randomDice() -> Int {
    Int.random(in: 1...6)
}

func getDiceImage(number: Int) -> String? {
    switch number {
    case 1: return K.Images.dice1
    case 2: return K.Images.dice2
    case 3: return K.Images.dice3
    case 4: return K.Images.dice4
    case 5: return K.Images.dice5
    case 6: return K.Images.dice6
    default: return nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    let image: String

    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
