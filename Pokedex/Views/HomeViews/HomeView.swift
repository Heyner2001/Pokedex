//
//  HomeView.swift
//  Pokedex
//
//  Created by Heyner Rodriguez on 13/06/21.
//

import UIKit

class HomeView: UIView {
    
    let navBar = NavigationBarView()
    let navBarImage = UIImageView(image: UIImage(named: "pokedex"))
    
    init() {
        super.init(frame: .zero)
        addSubview(navBar)
        setUpConstraints()
        navBar.setUpLeftElement(navBarImage)
    }
    
    private func setUpConstraints() {
        navBar.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
