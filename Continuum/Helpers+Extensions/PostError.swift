//
//  PostError.swift
//  Continuum
//
//  Created by Natalie Hall on 8/10/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import Foundation

enum PostError: LocalizedError {
    case ckError(Error)
    case noRecord
    case noPost
    
    var localizedDescription: String {
        switch self {
        case .ckError(let error):
            return "There was an error returned from cloudkit. Error: \(error)"
        case .noRecord:
            return "No record was returned from cloudkit"
        case .noPost:
            return "The post was not found"
        }
    }
}