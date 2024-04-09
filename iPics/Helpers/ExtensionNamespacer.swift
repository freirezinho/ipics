//
//  ExtensionNamespacer.swift
//  iPics
//
//  Created by Saulo Freire on 23/03/24.
//

import Foundation

public struct IPXWrapper<Wrapped> {
    public let wrapped: Wrapped
    public init(_ wrapped: Wrapped) {
        self.wrapped = wrapped
    }
}

public protocol IPXCompatible {
    associatedtype CompatibleType
    static var ipx: IPXWrapper<CompatibleType>.Type { get set }
    var ipx: IPXWrapper<CompatibleType> { get set }
}

extension IPXCompatible {
    public static var ipx: IPXWrapper<Self>.Type {
        get { return IPXWrapper<Self>.self }
        set {} // for mutating
    }

    public var ipx: IPXWrapper<Self> {
        get { return IPXWrapper(self) }
        set {} // for mutating
    }
}
