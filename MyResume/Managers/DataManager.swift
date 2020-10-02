//
//  DataManager.swift
//  MyResume
//
//  Created by Féfé on 11/09/2020.
//  Copyright © 2020 Felix Boquet. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Combine

protocol DataManagerProtocol {
    var profileList: [Profile] { get }
    func fetchProfile() -> [Profile]
    func fetchRemoteProfile() -> Future<[Profile], ProfileAPIError>
}

class DataManager {
    static let shared: DataManagerProtocol = DataManager()
    private var db = Firestore.firestore()
    var profileList = [Profile]()
    
    private init() { }
}

// MARK: - DataManagerProtocol implementation
extension DataManager: DataManagerProtocol {
    
    func fetchProfile() -> [Profile] {
        return profileList
    }
    
    func fetchRemoteProfile() -> Future<[Profile], ProfileAPIError> {
        
        return Future<[Profile], ProfileAPIError> { [weak self] promise in
            guard let me = self else {
                return promise(.failure(.genericError))
            }
            
            me.db.collection("profile").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                let profileList = documents.map { queryDocumentSnapshot -> Profile in
                    let data = queryDocumentSnapshot.data()
                    let name = data["name"] as? String ?? ""
                    let job = data["job"] as? String ?? ""
                    let tech = data["tech"] as? String ?? ""
                    
                    return Profile(name: name, job: job, tech: tech)
                }
                
                return promise(.success(profileList))
            }
        }

    }
    
}
