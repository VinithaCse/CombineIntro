//
//  UserViewModel.swift
//  CombineIntro
//
//  Created by Vinitha Rao A on 20/04/22.
//

import Foundation
import Combine

class UserViewModel {
    
    var observer: AnyCancellable?
    var showUserModel = PassthroughSubject<UserModel, Never>()
    var userModel: UserModel = UserModel(withJSON: [:])
    
    func getData() {
        
        guard let url = URL(string: "http://assessment.api.vweb.app/user") else {
            return
        }
        
        observer = APICaller.shared.getData(url).sink(receiveCompletion: { completion in
            
            switch completion {
                case .finished:
                print("Finished")
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { data in
            
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String: Any] ?? [:]
                
                var user: UserModel = UserModel(withJSON: jsonResult)
                user = UserModel(withJSON: jsonResult)
                self.showUserModel.send(user)
            }
            catch {
                
            }

        })
    }
    
}
