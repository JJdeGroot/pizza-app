//
//  Topping.swift
//  swiftpizza
//
//  Created by Aron Kool on 01-05-16.
//  Copyright © 2016 Topicus. All rights reserved.
//

import Foundation

class Topping {
    let id : Int
    let naam : String
    
    init(id : Int, naam : String){
        self.id = id
        self.naam = naam
    }
}

extension Topping : Equatable {}

func ==(t1: Topping, t2: Topping) -> Bool {
    return t1.id == t2.id;
}