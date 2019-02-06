//
//  Swift+Blocks.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

typealias VoidBlock = () -> Void

typealias FuncBlock<T, V> = (T) -> V

typealias ValueBlock<T> = FuncBlock<T, Void>
