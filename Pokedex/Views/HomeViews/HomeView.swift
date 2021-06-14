//
//  HomeView.swift
//  Pokedex
//
//  Created by Heyner Rodriguez on 13/06/21.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    let navBar = NavigationBarView(showSearchButton: false)
    let navBarImage = UIImageView(image: UIImage(named: "pokedex"))
    
    lazy var sectionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 180
        tableView.bounces = true
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
        tableView.alwaysBounceVertical = true
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        tableView.register(SectionViewCell.self, forCellReuseIdentifier: StringSources.shared.sectionsTableViewKey)
        tableView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(navBar)
        addSubview(sectionsTableView)
        setUpConstraints()
        navBar.setUpLeftElement(navBarImage)
    }
    
    private func setUpConstraints() {
        navBar.snp.makeConstraints { $0.left.top.right.equalToSuperview() }
        
        sectionsTableView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.top.equalTo(navBar.snp.bottom).offset(25)
            $0.bottom.equalToSuperview().offset(-UIApplication.bottomSafeInset)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StringSources.shared.sectiontitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = sectionsTableView.dequeueReusableCell(withIdentifier: StringSources.shared.sectionsTableViewKey, for: indexPath) as? SectionViewCell else {
            return UITableViewCell()
        }
        cell.setUpCell(title: StringSources.shared.sectiontitles[indexPath.row],
                       backgroundName: StringSources.shared.pokemonBackground[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        networkManager.requestGetAPI(urlPath: StringSources.shared.sectionsPathArray[indexPath.row],
                                     indexSection: indexPath.row)
        
    }
}
