//
//  SearchNavBar.swift
//  Pokedex
//
//  Created by Heyner Rodriguez on 14/06/21.
//

import UIKit

protocol BackButtonDelegate: class {
    func backButtonAction()
}

class SearchNavBar: UIView {
    
    weak var backButtonDelegate: BackButtonDelegate?
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 16
        stack.addArrangedSubview(backButton)
        stack.addArrangedSubview(searchBar)
        return stack
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(named: StringSources.shared.navBarBack)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchBar: UIView = {
        let view = UIView()
        view.addSubview(searchTextField)
        view.backgroundColor = .white
        view.layer.cornerRadius = 16.5
        return view
    }()
    
    private lazy var searchTextField: UITextField = {
        let input = UITextField()
        input.textColor = .black
        input.font = .setFont(.regular, .normal)
        input.addTarget(self, action: #selector(pokemonSearchAction(_:)), for: .editingChanged)
        return input
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        addSubview(contentStackView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        
        contentStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(UIApplication.statusBarHeight)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
        }
        
        backButton.snp.makeConstraints { $0.height.width.equalTo(35) }
        searchTextField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(8)
            $0.right.equalToSuperview().offset(-8)
            $0.centerY.equalToSuperview()
        }
    }
    
    @objc private func backButtonAction() {
        backButtonDelegate?.backButtonAction()
    }
    
    @objc private func pokemonSearchAction(_ textField: UITextField) {
        let pokemonSection = pokemonListViewController.pokemonsSectionView
        guard textField.text != "" else {
            pokemonSection.volatilPokemonsData = allPokemons?.results
            return
        }
        pokemonSection.volatilPokemonsData = allPokemons?.results.filter({ $0.name.lowercased().contains(textField.text?.lowercased() ?? "") })
        pokemonSection.pokemonsCollectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
