//
//  NetworkWorker.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import Alamofire
import SVProgressHUD

struct RequestModel {
    let url: String
    let method: HTTPMethod
    let params: [String: Any]
}

class NetworkWorker {
    func fetch<T: Decodable & DTOToDomainConvertable>(_ requestModel: RequestModel,
                             of: T.Type,
                             completion: @escaping ((Result<T.DomainType, AFError>) -> Void)) {
        AF.cancelAllRequests()
        showHUD()
        
        AF.request(requestModel.url,
                   method: requestModel.method,
                   parameters: requestModel.params)
            .validate()
            .responseDecodable(of: T.self) { response in
                if let error = response.error,
                      error.isExplicitlyCancelledError { return }
                
                self.dismissHUD()
                
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        completion(.success(data.convert()))
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
    }
}

extension NetworkWorker {
    func showHUD() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    func dismissHUD() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}
