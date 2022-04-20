//
//  UserModel.swift
//  CombineIntro
//
//  Created by Vinitha Rao A on 20/04/22.
//

import Foundation

class UserModel {
    
    var stationCode: Int = 0
    var name: String = ""
    var profileKey: String = ""
        
    init(withJSON toDoDict: [String: Any]) {
        
        self.extractDetail(detailDict: toDoDict)
    }
    
    private func extractDetail(detailDict: Dictionary<String, Any>) {
        
        self.stationCode = detailDict["station_code"] as? Int ?? 0
        self.profileKey = detailDict["url"] as? String ?? ""
        self.name = detailDict["name"] as? String ?? ""
    }
    
}
