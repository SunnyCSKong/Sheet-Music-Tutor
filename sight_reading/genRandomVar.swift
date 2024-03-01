//
//  genRandomVar.swift
//  sight_reading
//
//  Created by Sunny Kong on 2024-02-23.
//

import Foundation

func randomNote()->String{
    let randInt = Int.random(in: 0..<7)//1-7
    let letters = ButtonTitles.values
    return letters[randInt]
}

//repurpose this function for key signature recognition, T = sharps, B = flats, unless key signature is c than it doesnt matter
func randomClef()->String{
    let randBool = Bool.random()
    return randBool ? "T" : "B" //if randBool == true, do treble clef, else do bass clef
}

func randomSuffix()->String{
    let randInt = Int.random(in: 1..<4) //1-3
    //if randInt == 1, the note will be sharp, if 2, note will be flat, else no suffix added
    if randInt == 1{
        return "S"
    }
    if randInt == 2{
        return "F"
    }
    return "N"
    
}

func calcY(clef:String,note:String)->CGFloat{
    var offset = CGFloat(0)
    let line = Bool.random() //for treble clef, E and F occur twice in the normal staff, for bass, A/G
    if clef == "T"{
        if note == "C"{
            offset = CGFloat(-20)
        }
        else if note == "D"{
            offset = CGFloat(-37)
        }
        else if note == "E"{
            if line{
                offset = CGFloat(21)
            }
            else{
                offset = CGFloat(-56)
            }
        }
        else if note == "F"{//on the line
            if line{
                offset = CGFloat(-73)
            }
            else{
                offset = CGFloat(52)
            }
        }
        else if note == "G"{
            offset = CGFloat(34)
        }
        else if note == "A"{
            offset = CGFloat(15)
        }
    }
    else{
        if note == "E"{//C
            offset = CGFloat(-20)
        }
        else if note == "F"{//F
            offset = CGFloat(-37)
        }
        else if note == "G"{//E
            if line{
                offset = CGFloat(21)
            }
            else{
                offset = CGFloat(-56)
            }
        }
        else if note == "A"{//on the line, F
            if line{
                offset = CGFloat(-73)
            }
            else{
                offset = CGFloat(52)
            }
        }
        else if note == "B"{
            offset = CGFloat(34)
        }
        else if note == "C"{
            offset = CGFloat(15)
        }
    }
    return offset
}

func randKeySig(pitch:String)->String{
    let randInt = Int.random(in: 0..<8)//0-7, 8 values, where 0 = C for both pitches (sharp/flat)
    var result:String
    if pitch == "T"{
        result = signatures.sharp[randInt]
    }
    else{
        result = signatures.flat[randInt]
    }
    return result
}
