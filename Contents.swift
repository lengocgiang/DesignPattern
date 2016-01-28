//: Playground - noun: a place where people can play

import UIKit
import Foundation

class MoneyPie {
    let value:Int
    var quantity:Int
    var nextPie:MoneyPie?
    
    init(value:Int,quantity:Int,nextPie:MoneyPie?) {
        self.value = value
        self.quantity = quantity
        self.nextPie = nextPie
    }
    
    func canWithdraw(var v:Int) ->Bool {

        func canTakeSomeBill(want:Int)->Bool {
            return (want / self.value) > 0
        }
        
        var q = self.quantity
        
        while canTakeSomeBill(v) {
            if q == 0 {
                break
            }
            
            v -= self.value
            q -= 1
        }
        if v == 0 {
            return true
        }else if let next = self.nextPie {
            return next.canWithdraw(v)
        }
        return false
    }
}

class ATM {
    private var hundred : MoneyPie
    private var fifty : MoneyPie
    private var twenty : MoneyPie
    private var ten : MoneyPie
    
    private var startPie: MoneyPie {
        return self.hundred
    }
}
