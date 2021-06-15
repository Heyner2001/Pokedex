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
    
    private var navBarStyle: NavBarStyle = .standard
    
    private var standardNavBar: StandardNavBar? = nil
    private var searchNavBar = SearchNavBar()
    
    init(showSearchButton: Bool = true, viewTitle: String) {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 0.87, green: 0.25, blue: 0.25, alpha: 1)
        
        standardNavBar = StandardNavBar(showSearchButton: showSearchButton, viewTitle: viewTitle)
        standardNavBar?.searchButtonDelegate = self
        searchNavBar.backButtonDelegate = self
        searchNavBar.isHidden = true
        addSubview(standardNavBar ?? UIView())
        addSubview(searchNavBar)
        setUpConstraints()
    }
    
    func setUpLeftElement(_ element: UIView) {
        standardNavBar?.leftElement.addSubview(element)
        element.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func setUpConstraints() {
        snp.makeConstraints { $0.height.equalTo(navBarHeight) }
        standardNavBar?.snp.makeConstraints { $0.edges.equalToSuperview() }
        searchNavBar.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func changeNavBarStyle() {
        navBarStyle = (navBarStyle == .standard ? .search : .standard)
        
        switch navBarStyle {
        case .standard:
            searchNavBar.isHidden = true
            standardNavBar?.isHidden = false
            break
            
        case .search:
            standardNavBar?.isHidden = true
            searchNavBar.isHidden = false
            break
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NavigationBarView: SearchButtonDelegate, BackButtonDelegate {
    func searchButtonAction() {
        changeNavBarStyle()
    }
    
    func backButtonAction() {
        changeNavBarStyle()
    }
}
