//
//  PokemonSectionCell.swift
//  Pokedex
//
//  Created by Heyner Rodriguez on 14/06/21.
//

import UIKit
import SnapKit
import Kingfisher

class PokemonSectionCell: UICollectionViewCell {
    static let cellSize = CGSize(width: 165, height: 200)
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.backgroundColor = UIColor.white.cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 4.0
        view.addSubview(contentStack)
        return view
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 10
        stack.addArrangedSubview(pokemonImage)
        stack.addArrangedSubview(pokemonNameLabel)
        return stack
    }()
    
    private let pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(.regular, .normal)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(containerView)
        setUpContraints()
    }
    
    private func setUpContraints() {
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
                .inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)) }
        
        contentStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
                .inset(UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8))
        }
    }
    
    func setData(urlPokemon: UrlPokemon) {
        pokemonNameLabel.text = urlPokemon.name
        var id = urlPokemon.url
        guard let range = id.range(of: StringSources.shared.urlBase + "pokemon") else { return }
           id.removeSubrange(range)
        id.removeAll(where: { "/".contains($0) })
        let urlImage = URL(string: StringSources.shared.pokemonImageUrl + id + ".png")
        pokemonImage.kf.setImage(with: urlImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
