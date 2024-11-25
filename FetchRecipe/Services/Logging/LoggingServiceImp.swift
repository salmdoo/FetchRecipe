//
//  LoggingServiceImp.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/19/24.
//

import Foundation
import OSLog

struct LoggingServiceImp: LoggingService {
    
    private let logging = Logger()
    
    func logInfo(string: String) {
        logging.info("\(string)")
    }
}
