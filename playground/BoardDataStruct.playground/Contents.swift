//: Playground - noun: a place where people can play

import Cocoa

let gun: UInt8 = 0b0001
let cha: UInt8 = 0b010
let po: UInt8 = 0b0011
let ma: UInt8 = 0b0100
let sang: UInt8 = 0b0101
let sa: UInt8 = 0b0110
let jol: UInt8 = 0b0111

let cho: UInt8 = 0b0000
let han: UInt8 = 0b1000

let cho_gun = cho | gun
let cho_cha = cho | cha
let cho_po = cho | po
let cho_ma = cho | ma
let cho_sang = cho | sang
let cho_sa = cho | sa
let cho_jol = cho | jol

let han_gun = han | gun
let han_cha = han | cha
let han_po = han | po
let han_ma = han | ma
let han_sang = han | sang
let han_sa = han | sa
let han_jol = han | jol

func gimul(item: UInt8) -> String {
    switch (item) {
    case cho_gun:
        return "楚"
    case cho_cha:
        return "車"
    case cho_po:
        return "包"
    case cho_ma:
        return "馬"
    case cho_sang:
        return "象"
    case cho_sa:
        return "士"
    case cho_jol:
        return "兵"
    case han_gun:
        return "漢"
    case han_cha:
        return "車"
    case han_po:
        return "包"
    case han_ma:
        return "馬"
    case han_sang:
        return "象"
    case han_sa:
        return "士"
    case han_jol:
        return "卒"
    default:
        return "口"
    }
}

class Board : CustomStringConvertible {
    var storage = [UInt8]()
    init() {
        for var x = 0; x < 90; x++ {
            storage.append(0)
        }
    }
    subscript(row: Int, column: Int) -> UInt8 {
        get {
            // This could validate arguments.
            return storage[row * 9 + column]
        }
        set {
            // This could also validate.
            storage[row * 9 + column] = newValue
        }
    }
    var description: String{
        var str = ""
        for var x = 0; x < 90; x++ {
            if (x != 0 && x % 9 == 0) {
                str = str + "\n"
            }
            str = str + gimul(storage[x])
        }
        return str
    }
}

var initBoard = Board()
initBoard[0, 0] = han_cha
initBoard[0, 1] = han_sang
initBoard[0, 2] = han_ma
initBoard[0, 3] = han_sa
initBoard[0, 5] = han_sa
initBoard[0, 6] = han_sang
initBoard[0, 7] = han_ma
initBoard[0, 8] = han_cha

initBoard[1, 4] = han_gun

initBoard[2, 1] = han_po
initBoard[2, 7] = han_po

initBoard[3, 0] = han_jol
initBoard[3, 2] = han_jol
initBoard[3, 4] = han_jol
initBoard[3, 6] = han_jol
initBoard[3, 8] = han_jol

initBoard[6, 0] = cho_jol
initBoard[6, 2] = cho_jol
initBoard[6, 4] = cho_jol
initBoard[6, 6] = cho_jol
initBoard[6, 8] = cho_jol

initBoard[7, 1] = cho_po
initBoard[7, 7] = cho_po

initBoard[8, 4] = han_gun

initBoard[9, 0] = cho_cha
initBoard[9, 1] = cho_ma
initBoard[9, 2] = cho_sang
initBoard[9, 3] = cho_sa
initBoard[9, 5] = cho_sa
initBoard[9, 6] = cho_ma
initBoard[9, 7] = cho_sang
initBoard[9, 8] = cho_cha

print(initBoard)
