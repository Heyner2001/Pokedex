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
    
    func requestGetAPI(urlPath: String, indexSection: Int) {
        requestGet(urlPath: urlPath)
            .observe(on: serialSchedule)
            .retry(3)
            .subscribe(on: concurrentSchedule)
            .map { data in
                do {
                    switch indexSection {
                    case 0:
                        allPokemons = try JSONDecoder().decode(AllPokemons.self, from: data)
                        break
                    case 1:
                        break
                    case 2:
                        break
                    case 3:
                        break
                    case 4:
                        break
                    default: break
                    }
                } catch { print(error.localizedDescription) }
            }
            .observe(on: MainScheduler.instance)
            .do(onDispose:  {
                var viewController: UIViewController? = nil
                
                switch indexSection {
                case 0:
                    viewController = pokemonListViewController
                    break
                case 1:
                    //            viewController = regionsListViewController
                    break
                case 2:
                    //            viewController = berriesListViewController
                    break
                case 3:
                    //            viewController = skillsListViewController
                    break
                case 4:
                    //            viewController = pokeballsListViewController
                    break
                default: break
                }
                
                guard let vc = viewController else { return }
                globalNavigationController?.pushViewController(vc, animated: true)
            })
            .subscribe(onCompleted: {})
            .disposed(by: disposeBag)
    }
    
    private func requestGet(urlPath: String) -> Observable<Data> {
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
