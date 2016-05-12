//
//  PizzaService.swift
//  swiftpizza
//
//  Created by Aron Kool on 01-05-16.
//  Copyright © 2016 Topicus. All rights reserved.
//

import Foundation

let PizzaService = MockPizzaServiceInstance()

class PizzaServiceInstance{
    
    func getPizzas(onSucces : ([Pizza]) -> Void){
        
    }
    
    func getToppings(onSucces : ([Topping]) -> Void){
        
    }
    
    func bestelPizza(pizza : Pizza, onCompletion : (Int) -> Void){
        
    }
    
    func getProgress(orderID : Int, onProgress : (Int) -> Void) {
        
    }
}