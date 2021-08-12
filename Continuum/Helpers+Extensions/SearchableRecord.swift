//
//  SearchableRecord.swift
//  Continuum
//
//  Created by Natalie Hall on 8/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import Foundation

protocol SearchableRecord {
    func matches(searchTerm: String) -> Bool
}
