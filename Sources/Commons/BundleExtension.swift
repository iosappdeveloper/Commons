//
//  BundleExtension.swift
//  Commons
//
//  Created by Matoria, Ashok on 27/08/18.
//  Copyright © 2018 Matoria, Ashok. All rights reserved.
//

import Foundation

public extension Bundle {
    func contents(ofFile fileName: String) throws -> Data {
        var fileComponents = fileName.split(separator: ".")
        let ext = String(fileComponents.popLast() ?? "")
        let fileName = fileComponents.joined(separator: ".")
        guard let fileUrl = url(forResource: fileName, withExtension: ext) else { throw Error.fileNotFound }
        let data = try Data(contentsOf: fileUrl)
        return data
    }
}

public enum Error: LocalizedError {
    case fileNotFound
    
    public var errorDescription: String? {
        return String(describing: self)
    }
}
