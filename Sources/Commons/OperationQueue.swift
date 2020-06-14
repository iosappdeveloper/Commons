//
//  OperationQueue.swift
//  Commons
//
//  Created by Matoria, Ashok on 11/02/19.
//  Copyright © 2019 Matoria, Ashok. All rights reserved.
//

import Foundation

public extension OperationQueue {
    @discardableResult
    func execute<T>(_ fetcher: @escaping () throws -> T, completion: @escaping (Result<T, Swift.Error>) -> Void) -> Operation {
        var result: Result<T, Swift.Error>?
        
        let networkOperation = BlockOperation() {
            let startDate = Date()
            do {
                let data = try fetcher()
                result = .success(data)
            } catch {
                result = .failure(error)
            }
            print(String(format: "%.2f seconds", abs(startDate.timeIntervalSinceNow)))
        }
        
        networkOperation.completionBlock = {
            guard let result = result else { assertionFailure(); return }
            DispatchQueue.main.async {
                completion(result)
            }
        }
        addOperation(networkOperation)
        return networkOperation
    }
}
