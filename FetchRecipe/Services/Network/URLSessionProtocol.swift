//
//  URLSessionProtocol.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/23/24.
//

import Foundation

import Combine
import Foundation

protocol URLSessionProtocol {
    func dataTaskPublisher(for url: URL) -> URLSession.DataTaskPublisher
}
