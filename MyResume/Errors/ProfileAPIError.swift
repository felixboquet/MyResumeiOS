//
//  ProfileAPIError.swift
//  MyResume
//
//  Created by Féfé on 29/09/2020.
//  Copyright © 2020 Felix Boquet. All rights reserved.
//

import Foundation

enum ProfileAPIError: Error, LocalizedError {
    case urlError(URLError)
    case responseError(Int)
    case genericError
    
    var localizedDescription: String {
        switch self {
        case .urlError(let error):
            return error.localizedDescription
        case .responseError(let status):
            return "Bad response code: \(status)"
        case .genericError:
            return "An unknown error has been occured"
        }
    }
}
