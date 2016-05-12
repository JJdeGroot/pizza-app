//
//  PizzaTableViewController.swift
//  swiftpizza
//
//  Created by Aron Kool on 03-05-16.
//  Copyright © 2016 Topicus. All rights reserved.
//

import UIKit

class PizzaTableViewController : TableViewController{
    
    var pizzas = [Pizza]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: pizza's opvragen (TIP: herlaadt na het inladen de tabel)
        PizzaService.getPizzas({pizzas in
            NSLog("Pizza's opgehaald")
            self.pizzas = pizzas
            self.tableView.reloadData()
        });
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: het aantal regels dat getoond moet worden
        return self.pizzas.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = getPizzaCell(indexPath)
        
        //TODO: de juiste vulling aan de cell geven (label = textLabel)
        let pizza = pizzas[indexPath.row]
        cell.textLabel?.text = pizza.naam
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //TODO: doorgaan naar het volgende scherm
        self.performSegueWithIdentifier("showToppings", sender: self)
    }
    
    override func prepareForNextViewController(nextViewController: UIViewController) {
        //TODO: de gemaakte keuze doorgeven aan het volgende scherm
        if let toppingsController = nextViewController as? ToppingsTableViewController, index = tableView.indexPathForSelectedRow?.row {
            toppingsController.pizza = self.pizzas[index]
        }
    }
    
    private func getPizzaCell(indexPath : NSIndexPath) -> UITableViewCell{
        return tableView.dequeueReusableCellWithIdentifier(TableCells.Pizza, forIndexPath: indexPath)
    }
}