//
//  Binding.swift
//  RickAndMortyProject
//
//  Created by Александр Муклинов on 16.02.2024.
//

import Foundation

class Binding<T> {
    
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
}
