//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Heyner Rodriguez on 14/06/21.
//

import UIKit
import SnapKit

let pokemonListViewController = PokemonListViewController()
class PokemonListViewController: UIViewController {
    
    let pokemonsSectionView = PokemonSectionView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        view.addSubview(pokemonsSectionView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        pokemonsSectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
