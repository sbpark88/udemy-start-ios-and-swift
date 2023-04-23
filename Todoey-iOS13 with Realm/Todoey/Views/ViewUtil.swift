//
//  ViewUtil.swift
//  Todoey
//
//  Created by 박새별 on 2023/03/28.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import UIKit

protocol TintSettings: UITableViewController {
    func setTintColor(backgroundColor: UIColor?, titleTextColor: UIColor?)
}

extension TintSettings {
    func setTintColor(backgroundColor: UIColor? = UIColor.cyan, titleTextColor: UIColor? = UIColor.white) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [.foregroundColor: titleTextColor!]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
}
