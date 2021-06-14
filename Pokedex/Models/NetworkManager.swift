//
//  NetworkManager.swift
//  Pokedex
//
//  Created by Heyner Rodriguez on 13/06/21.
//

import Foundation
import Alamofire
import RxSwift

let networkManager = NetworkManager()
class NetworkManager {
    
    private let disposeBag = DisposeBag()
    private let serialSchedule = SerialDispatchQueueScheduler(qos: .background)
    private let concurrentSchedule = ConcurrentDispatchQueueScheduler(queue: DispatchQueue.global())
    
    private struct requestError: Swift.Error {}
    
    func requestGetAPI(urlPath: String, keyToSave: String) {
        requestGet(urlPath: urlPath, keyToSave: keyToSave)
            .observe(on: serialSchedule)
            .retry(3)
            .subscribe(on: concurrentSchedule)
            .map { data in
                LocalStorageManager.shared.saveData(data: data, key: keyToSave)
                
                do {
                    let results = try JSONDecoder().decode(AllPokemons.self, from: data)
                    allPokemons = results
                } catch { print(error.localizedDescription) }
            }
            .subscribe(onCompleted: {})
            .disposed(by: disposeBag)
    }
    
    private func requestGet(urlPath: String, keyToSave: String) -> Observable<Data> {
        return Observable.create { observable in
            Alamofire.request(StringSources.shared.urlBase + urlPath ,method: .get , encoding: URLEncoding.default)
                .validate(statusCode: 200 ..< 300)
                .responseJSON { response in
                    
                    guard response.result.isSuccess, let data = response.data else {
                        observable.onError(requestError())
                        return
                    }
                    
                    observable.onNext(data)
                    observable.onCompleted()
                }
            return Disposables.create()
        }
    }
}
