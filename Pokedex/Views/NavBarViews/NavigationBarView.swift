//
//  NavigationBarView.swift
//  Pokedex
//
//  Created by Heyner Rodriguez on 13/06/21.
//

import UIKit
import SnapKit

var navBarHeight = 50 + UIApplication.statusBarHeight

enum NavBarStyle {
    case standard, search
}

class NavigationBarView: UIView {
    
    private var navBarStyle: NavBarStyle = .standard {
        didSet {
            guard oldValue != navBarStyle else { return }
            changeNavBarStyle()
        }
    }
    
    private var standardNavBar: StandardNavBar? = nil
    
    init(showSearchButton: Bool = true, viewTitle: String) {
        super.init(frame: .zero)
        
        standardNavBar = StandardNavBar(showSearchButton: showSearchButton, viewTitle: viewTitle)
        addSubview(standardNavBar ?? UIView())
        setUpConstraints()
    }
    
    func setUpLeftElement(_ element: UIView) {
        standardNavBar?.leftElement.addSubview(element)
        element.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func setUpConstraints() {
        standardNavBar?.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func changeNavBarStyle() {
        
        switch navBarStyle {
        case .standard:
            break
            
        case .search:
            
            break
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
