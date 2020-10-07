//
//  ProfileNetworkService.swift
//  MyResume
//
//  Created by Féfé on 06/10/2020.
//  Copyright © 2020 Felix Boquet. All rights reserved.
//

import Foundation
import Combine
import FirebaseFirestore

struct ProfileNetworkService {
    
    private var db = Firestore.firestore()
    
    func fetchRemoteProfile() -> Future<[RemoteProfile], ProfileAPIError> {
        
        return Future<[RemoteProfile], ProfileAPIError> { [weak self] promise in
            guard let me = self else {
                return promise(.failure(.genericError))
            }
            
            me.db.collection("profile").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                let profileList = documents.map { queryDocumentSnapshot -> RemoteProfile in
                    let data = queryDocumentSnapshot.data()
                    let name = data["name"] as? String ?? ""
                    let job = data["job"] as? String ?? ""
                    let tech = data["tech"] as? String ?? ""
                    
                    return RemoteProfile(name: name, job: job, tech: tech)
                }
                
                return promise(.success(profileList))
            }
        }
    }
    
}
