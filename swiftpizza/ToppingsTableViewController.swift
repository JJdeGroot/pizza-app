//
//  ToppingsTableViewController.swift
//  swiftpizza
//
//  Created by Aron Kool on 03-05-16.
//  Copyright © 2016 Topicus. All rights reserved.
//

import UIKit

class ToppingsTableViewController : TableViewController{
    
    var pizza : Pizza? //TODO: de naam van de pizza moet de title van het scherm worden
    var toppings = [Topping]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.pizza?.naam
        
        //TODO: toppings opvragen
        PizzaService.getToppings({toppings in
            NSLog("Toppings opgehaald")
            self.toppings = toppings
            self.tableView.reloadData()
        });
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: geef het aantal te tonen regels terug
        return self.toppings.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = getToppingCell(indexPath)
        let topping = self.toppings[indexPath.row]
        
        //TODO: naam van de topping tonen
        cell.textLabel?.text = topping.naam;
        
        //TODO: vinkje (= accessoryType) tonen
        if !(self.pizza?.toppings.contains(topping))! {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }else{
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    
    private func getToppingCell(indexPath : NSIndexPath) -> UITableViewCell{
        return tableView.dequeueReusableCellWithIdentifier(TableCells.Topping, forIndexPath: indexPath)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //TODO: de state in de toppings
        let topping = self.toppings[indexPath.row]

        if let index = self.pizza?.toppings.indexOf(topping) {
            self.pizza?.toppings.removeAtIndex(index);
        }else{
            self.pizza?.toppings.append(topping)
        }

        self.tableView.reloadData();
    }
    
    override func prepareForNextViewController(nextViewController: UIViewController) {
        //TODO: de gemaakte keuze doorgeven aan het volgende scherm
        if let bestellenController = nextViewController as? BestellenViewController {
            bestellenController.pizza = self.pizza;
        }
        
    }
    
    @IBAction func bestellen(sender: UIBarButtonItem) {
        gaNaarBestellen()
    }
}