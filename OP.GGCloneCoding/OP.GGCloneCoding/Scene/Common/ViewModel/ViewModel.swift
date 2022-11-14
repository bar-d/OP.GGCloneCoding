//
//  ViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/14.
//

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    init(output: Output)
}
