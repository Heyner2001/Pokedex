//
//  PokemonSectionView.swift
//  Pokedex
//
//  Created by Heyner Rodriguez on 14/06/21.
//

import UIKit
import SnapKit

class PokemonSectionView: UIView {
    
    var volatilPokemonsData = allPokemons?.results
    private let navBar = NavigationBarView(viewTitle: StringSources.shared.sectionTitles[0])
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(named: StringSources.shared.navBarBack)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var pokemonsCollectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collection.backgroundColor = UIColor.clear
        collection.showsVerticalScrollIndicator = false
        collection.register(PokemonSectionCell.self,
                            forCellWithReuseIdentifier: StringSources.shared.PokemonSectionCellKey)
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    init() {
        super.init(frame: .zero)
        navBar.setUpLeftElement(backButton)
        addSubview(navBar)
        addSubview(pokemonsCollectionView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        navBar.snp.makeConstraints { $0.left.right.top.equalToSuperview() }
        pokemonsCollectionView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.top.equalTo(navBar.snp.bottom).offset(16)
            $0.bottom.equalToSuperview().offset(-UIApplication.bottomSafeInset)
        }
    }
    
    @objc private func backButtonAction() {
        globalNavigationController?.popViewController(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PokemonSectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return volatilPokemonsData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = pokemonsCollectionView.dequeueReusableCell(withReuseIdentifier: StringSources.shared.PokemonSectionCellKey, for: indexPath) as? PokemonSectionCell else {
            return UICollectionViewCell()
        }
        guard let data = volatilPokemonsData?[indexPath.row] else { return UICollectionViewCell() }
        cell.setData(urlPokemon: data)
        return cell
    }
}

extension PokemonSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return PokemonSectionCell.cellSize
    }
}
