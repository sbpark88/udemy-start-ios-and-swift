//
//  ContentView.swift
//  HackerNews
//
//  Created by 박새별 on 2023/03/19.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {

        NavigationView {
            List(networkManager.posts) { Text($0.title) }
            .navigationTitle("Hacker News")
        }
        .onAppear { // Adds an action to perform before this view appears.
            networkManager.fetchData()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
