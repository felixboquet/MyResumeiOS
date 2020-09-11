//
//  DataManager.swift
//  MyResume
//
//  Created by Féfé on 11/09/2020.
//  Copyright © 2020 Felix Boquet. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol DataManagerProtocol {
    func fetchProfile() -> [Profile]
}

class DataManager {
    static let shared: DataManagerProtocol = DataManager()
    private var db = Firestore.firestore()
    var profileList = [Profile]()
    
    private init() {}
}

// MARK: - DataManagerProtocol implementation
extension DataManager: DataManagerProtocol {
    
    func fetchProfile() -> [Profile] {
        fetchRemoteProfile()
        
        return profileList
    }
    
    private func fetchRemoteProfile() {
        db.collection("profile").addSnapshotListener { (querrySnapshot, error) in
            guard let documents = querrySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.profileList = documents.map { queryDocumentSnapshot -> Profile in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                
                return Profile(name: name)
                
            }
            
        }
    }
    
}
