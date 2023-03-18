//
//  InfoView.swift
//  SB-Park-Card
//
//  Created by 박새별 on 2023/03/18.
//

import SwiftUI

struct InfoView: View {
    let image: String
    let github: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(height: 50)
            .foregroundColor(Color.white)
            .overlay(
                HStack {
                    Image(systemName: image).foregroundColor(.mint)
                    Text(github).bold().foregroundColor(.blue)
                }
            )
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(image: "person.fill", github: "sample")
            .previewLayout(.sizeThatFits)
    }
}
