//
//  ViewModel.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/14.
//

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    init(output: Output)
}
