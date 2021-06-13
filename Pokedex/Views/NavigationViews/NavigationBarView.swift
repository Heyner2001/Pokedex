//
//  NavigationBarView.swift
//  Pokedex
//
//  Created by Heyner Rodriguez on 13/06/21.
//

import UIKit

var navBarHeight: CGFloat {
    guard let statusBarHeight = UIWindow().windowScene?.statusBarManager?.statusBarFrame.height
    else { return 50 }
    return 50 + statusBarHeight
}

class NavigationBarView: UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 0.87, green: 0.25, blue: 0.25, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
