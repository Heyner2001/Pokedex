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
    case standard , search
}

class NavigationBarView: UIView {
    
    private var navBarStyle: NavBarStyle = .standard {
        didSet {
            guard oldValue != navBarStyle else { return }
            changeNavBarStyle()
        }
    }
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.addSubview(contentStackView)
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        stack.addArrangedSubview(leftElement)
        stack.addArrangedSubview(titleView)
        stack.addArrangedSubview(searchButton)
        return stack
    }()
    
    private let leftElement: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 17.5
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.addSubview(titleLabel)
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = .setFont(.bold, .normal)
        label.textAlignment = .center
        return label
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(named: StringSources.shared.navBarImage)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    init(showSearchButton: Bool = true, viewTitle: String) {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 0.87, green: 0.25, blue: 0.25, alpha: 1)
        searchButton.isHidden = !showSearchButton
        titleLabel.text = viewTitle
        
        addSubview(contentView)
        setUpStandardContraints()
    }
    
    private func setUpStandardContraints() {
        
        snp.makeConstraints { $0.height.equalTo(navBarHeight) }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: UIApplication.statusBarHeight, left: 0, bottom: 0, right: 0))
        }
        
        contentStackView.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.left.equalTo(contentView).offset(16)
            $0.right.equalTo(contentView).offset(-16)
        }
        
        titleLabel.snp.makeConstraints { $0.center.equalTo(contentView) }
        leftElement.snp.makeConstraints { $0.height.width.equalTo(35) }
        searchButton.snp.makeConstraints { $0.height.width.equalTo(35) }
    }
    
    func setUpLeftElement(_ element: UIView) {
        leftElement.addSubview(element)
        element.snp.makeConstraints { $0.edges.equalToSuperview() }
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
