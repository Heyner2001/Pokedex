//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Heyner Rodriguez on 14/06/21.
//

import UIKit
import SnapKit

class PokemonListViewController: UIViewController {
    
    let pokemonsSectionview = PokemonSectionView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        view.addSubview(pokemonsSectionview)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        pokemonsSectionview.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
