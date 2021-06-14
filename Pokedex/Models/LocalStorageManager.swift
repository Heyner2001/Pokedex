//
//  LocalStorageManager.swift
//  Pokedex
//
//  Created by Heyner Rodriguez on 13/06/21.
//

import Foundation

class LocalStorageManager {
    
    static let shared = LocalStorageManager()
    private let defaults = UserDefaults.standard
    
    func saveData(data: Data, key: String) {
        defaults.set(data, forKey: key)
    }
    
    func getData(key: String) -> Data? {
        defaults.data(forKey: key)
    }
}
