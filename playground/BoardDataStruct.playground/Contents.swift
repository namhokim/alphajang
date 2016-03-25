//: Playground - noun: a place where people can play

import Cocoa

struct Element {
    static let empty: UInt8 = 0
    static let gun: UInt8 = 0b0001
    static let cha: UInt8 = 0b010
    static let po: UInt8 = 0b0011
    static let ma: UInt8 = 0b0100
    static let sang: UInt8 = 0b0101
    static let sa: UInt8 = 0b0110
    static let byongJol: UInt8 = 0b0111
    
    static let cho: UInt8 = 0b0000
    static let han: UInt8 = 0b1000
}

struct Gimul {
    static let cho_gun = Element.cho | Element.gun
    static let cho_cha = Element.cho | Element.cha
    static let cho_po = Element.cho | Element.po
    static let cho_ma = Element.cho | Element.ma
    static let cho_sang = Element.cho | Element.sang
    static let cho_sa = Element.cho | Element.sa
    static let cho_jol = Element.cho | Element.byongJol
    
    static let han_gun = Element.han | Element.gun
    static let han_cha = Element.han | Element.cha
    static let han_po = Element.han | Element.po
    static let han_ma = Element.han | Element.ma
    static let han_sang = Element.han | Element.sang
    static let han_sa = Element.han | Element.sa
    static let han_byong = Element.han | Element.byongJol
    
    static let description = [
        Gimul.cho_gun: "楚",
        Gimul.cho_cha: "車",
        Gimul.cho_po: "包",
        Gimul.cho_ma: "馬",
        Gimul.cho_sang: "象",
        Gimul.cho_sa: "士",
        Gimul.cho_jol: "卒",
        Gimul.han_gun: "漢",
        Gimul.han_cha: "車",
        Gimul.han_po: "包",
        Gimul.han_ma: "馬",
        Gimul.han_sang: "象",
        Gimul.han_sa: "士",
        Gimul.han_byong: "兵"
    ]
}


class Board : CustomStringConvertible {
    var storage = [UInt8]()
    init() {
        for _ in 0 ..< 90 {
            storage.append(Element.empty)
        }
    }
    init(initialBoard: [UInt8]) {
        //storage = initialBoard.map { $0.copy() }
        storage = initialBoard
    }
    subscript(row: Int, column: Int) -> UInt8 {
        get {
            return storage[row * 9 + column]
        }
        set {
            storage[row * 9 + column] = newValue
        }
    }
    var description: String{
        var str = ""
        for x in 0 ..< 90 {
            if (x != 0 && x % 9 == 0) {
                str = str + "\n"
            }
            str = str + gimul(storage[x])
        }
        return str
    }
    
    func gimul(item: UInt8) -> String {
        return Gimul.description[item] ?? "口"
    }
}

var BasicBoard = [
    Gimul.han_cha,Element.empty, Element.empty, Gimul.han_sa, Element.empty, Gimul.han_sa, Element.empty, Element.empty, Gimul.han_cha,
    Element.empty, Element.empty, Element.empty, Element.empty, Gimul.han_gun, Element.empty, Element.empty, Element.empty, Element.empty,
    Element.empty, Gimul.han_po, Element.empty, Element.empty, Element.empty, Element.empty, Element.empty, Gimul.han_po, Element.empty,
    Gimul.han_byong, Element.empty, Gimul.han_byong, Element.empty, Gimul.han_byong, Element.empty, Gimul.han_byong, Element.empty, Gimul.han_byong,
    Element.empty, Element.empty, Element.empty, Element.empty, Element.empty, Element.empty, Element.empty, Element.empty, Element.empty,
    Element.empty, Element.empty, Element.empty, Element.empty, Element.empty, Element.empty, Element.empty, Element.empty, Element.empty,
    Gimul.cho_jol, Element.empty, Gimul.cho_jol, Element.empty, Gimul.cho_jol, Element.empty, Gimul.cho_jol, Element.empty, Gimul.cho_jol,
    Element.empty, Gimul.cho_po, Element.empty, Element.empty, Element.empty, Element.empty, Element.empty, Gimul.cho_po, Element.empty,
    Element.empty, Element.empty, Element.empty, Element.empty, Gimul.han_gun, Element.empty, Element.empty, Element.empty, Element.empty,
    Gimul.cho_cha, Element.empty, Element.empty, Gimul.cho_sa, Element.empty, Gimul.cho_sa, Element.empty, Element.empty, Gimul.cho_sa]

var initBoard = Board(initialBoard: BasicBoard)
initBoard[0, 1] = Gimul.han_sang
initBoard[0, 2] = Gimul.han_ma
initBoard[0, 6] = Gimul.han_sang
initBoard[0, 7] = Gimul.han_ma

initBoard[9, 1] = Gimul.cho_ma
initBoard[9, 2] = Gimul.cho_sang
initBoard[9, 6] = Gimul.cho_ma
initBoard[9, 7] = Gimul.cho_sang


print(initBoard)
