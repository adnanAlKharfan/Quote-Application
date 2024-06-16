//
//  QuoteTableViewController.swift
//  InspoQuotes
//
//  Created by Angela Yu on 18/08/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit
import StoreKit

class QuoteTableViewController: UITableViewController,SKPaymentTransactionObserver {
    
    var p = false
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for i in transactions {
            if  i.transactionState == .purchased {
                p = true
                
                UserDefaults.standard.setValue(p, forKey: "isPurchesed")
                
                navigationItem.setRightBarButton(nil, animated: true)
                
                SKPaymentQueue.default().finishTransaction(i)
                
                
            } else if i.transactionState == .restored {
                
                p = true
                
                UserDefaults.standard.setValue(p, forKey: "isPurchesed")
                
                navigationItem.setRightBarButton(nil, animated: true)
                SKPaymentQueue.default().finishTransaction(i)
            }
        }
    }
    
    
    
    let product
        = "com.londonappbrewery.InspoQuotes"
    
    var quotesToShow = [
        "Our greatest glory is not in never falling, but in rising every time we fall. — Confucius",
        "All our dreams can come true, if we have the courage to pursue them. – Walt Disney",
        "It does not matter how slowly you go as long as you do not stop. – Confucius",
        "Everything you’ve ever wanted is on the other side of fear. — George Addair",
        "Success is not final, failure is not fatal: it is the courage to continue that counts. – Winston Churchill",
        "Hardships often prepare ordinary people for an extraordinary destiny. – C.S. Lewis"
    ]
    
    let premiumQuotes = [
        "Believe in yourself. You are braver than you think, more talented than you know, and capable of more than you imagine. ― Roy T. Bennett",
        "I learned that courage was not the absence of fear, but the triumph over it. The brave man is not he who does not feel afraid, but he who conquers that fear. – Nelson Mandela",
        "There is only one thing that makes a dream impossible to achieve: the fear of failure. ― Paulo Coelho",
        "It’s not whether you get knocked down. It’s whether you get up. – Vince Lombardi",
        "Your true success in life begins only when you make the commitment to become excellent at what you do. — Brian Tracy",
        "Believe in yourself, take on your challenges, dig deep within yourself to conquer fears. Never let anyone bring you down. You got to keep going. – Chantal Sutherland"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "QuoteCell")
        SKPaymentQueue.default().add(self)
        
        buy()
        
        
        p = UserDefaults.standard.bool(forKey: "isPurchesed")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.contentSize.height = 80.0
        
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if !p {
        
            return quotesToShow.count+1
            
        }
        let two: [String] = quotesToShow + premiumQuotes
        
        return two.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath)

        if p {
            
            quotesToShow = quotesToShow + premiumQuotes
            
        }
        
        // Configure the cell...
        if indexPath.row < quotesToShow.count {
        cell.textLabel?.text = quotesToShow[indexPath.row]
            cell.textLabel?.numberOfLines=0
            cell.accessoryType = .none
            
        } else{
                cell.textLabel?.text = "buy our premium"
                cell.accessoryType = .disclosureIndicator
            }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == quotesToShow.count {
            buy()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func buy(){
        if   SKPaymentQueue.canMakePayments() { // can be bought
            let payment=SKMutablePayment() // make payment request
            payment.productIdentifier = product // add id
            
            SKPaymentQueue.default().add(payment) // bought
        }
        
    }
    
    @IBAction func restorePressed(_ sender: UIBarButtonItem) {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }


}
