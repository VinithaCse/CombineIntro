//
//  APICaller.swift
//  CombineIntro
//
//  Created by Vinitha Rao A on 20/04/22.
//

import Combine
import Foundation

class APICaller {
    
    static let shared = APICaller()
    
    func getData(_ url:URL) -> Future<Data, Error> {
        
        let session = URLSession.shared
        return Future { promise in
            let task = session.dataTask(with: url) { data, response, error in
                if let err = error {
                    promise(.failure(err))
                } else {
                    if let data = data {
                        promise(.success(data))
                    }
                }
            }
            task.resume()
        }
    }
}
