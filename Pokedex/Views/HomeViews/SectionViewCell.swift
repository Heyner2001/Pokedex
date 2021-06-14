//
//  SectionViewCell.swift
//  Pokedex
//
//  Created by Heyner Rodriguez on 14/06/21.
//

import UIKit

class SectionViewCell: UITableViewCell {
    
    private let ContentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    private let backgroundImage = UIImageView()
    private let darkEffect: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.34
        return view
    }()
    
    private let sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .setFont(.bold, .huge)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(ContentView)
        ContentView.addSubview(backgroundImage)
        ContentView.sendSubviewToBack(backgroundImage)
        ContentView.addSubview(darkEffect)
        contentView.addSubview(sectionTitleLabel)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        ContentView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
        
        sectionTitleLabel.snp.makeConstraints { $0.center.equalToSuperview() }
        backgroundImage.snp.makeConstraints { $0.edges.equalTo(ContentView) }
        darkEffect.snp.makeConstraints { $0.edges.equalTo(backgroundImage) }
    }
    
    func setUpCell(title: String, backgroundName: String) {
        backgroundImage.image = UIImage(named: backgroundName)
        sectionTitleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
