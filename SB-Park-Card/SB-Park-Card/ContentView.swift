//
//  ContentView.swift
//  SB-Park-Card
//
//  Created by 박새별 on 2023/03/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(K.Colors.background)
                .ignoresSafeArea()
            
            VStack {
                Image("appstore")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                Text("SB Park")
                    .bold()
                    .font(Font.custom(K.Fonts.singleDay, size: 60))
                    .foregroundColor(K.Colors.textOnBackground)
                Text("iOS Developer")
                    .foregroundColor(K.Colors.textOnBackground)
                    .font(Font.custom(K.Fonts.pacifico, size: 20))
                
                Divider()
                
                InfoView(image: "person.fill", github: "github.com/sbpark88")
                InfoView(image: "envelope.fill", github: "devsbipa@gmail.com")

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
