//
//  keySigs.swift
//  sight_reading
//
//  Created by Sunny Kong on 2024-02-22.
//

import SwiftUI

struct keySigs: View {
    @State var sig = "C"
    @State var pitch = "T"//T == sharp, B == flat
    @State var clef = "T"//T == Treble, B == Bass
    @State var letters = signatures.sharp
    @State var staff = Image("T_C")
    
    var body: some View {
        VStack{
                staff.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350.0)
                    .padding(.bottom,60)
            HStack {

                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                    ForEach(letters, id: \.self) { title in
                        Button(action: {
                            let correct = checkAns(selectedSig: title)
                            if correct {
                                resetKSScreen()
                            }
                        }) {
                            Text(title)
                                .font(.body)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(5)
                                .shadow(color: .gray, radius: 2, x: 1, y: 1)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }



            }
        }
        .onAppear{
            genKeySig()
        }
    }
    func genKeySig(){
        pitch = randomClef()
        if pitch == "T"{
            letters = signatures.sharp
        }
        else{
            letters = signatures.flat
        }
        clef = randomClef()

        sig = randKeySig(pitch:pitch)
        staff = keySigImage(clef: clef, note: sig)//image
    }
    func checkAns(selectedSig:String)->Bool{
        return selectedSig == sig
    }
    func resetKSScreen(){
        genKeySig()
    }
    
    func keySigImage(clef:String, note:String)->Image{
        if clef == "T"{//treble
            if note == "C"{
                return Image("T_C")
            }
            else if note == "G"{
                return Image("T_G")
            }
            else if note == "D"{
                return Image("T_D")
            }
            else if note == "A"{
                return Image("T_A")
            }
            else if note == "E"{
                return Image("T_E")
            }
            else if note == "B"{
                return Image("T_B")
            }
            else if note == "F#"{
                return Image("T_FS")
            }
            else if note == "C#"{
                return Image("T_CS")
            }
            else if note == "F"{
                return Image("T_F")
            }
            
            else if note == "B♭"{
                return Image("T_BF")
            }
            
            else if note == "E♭"{
                return Image("T_EF")
            }
            
            else if note == "A♭"{
                return Image("T_AF")
            }
            
            else if note == "D♭"{
                return Image("T_DF")
            }
            
            else if note == "G♭"{
                return Image("T_GF")
            }
            else{
                return Image("T_CF")
            }
        }
        else{
            if note == "C"{
                return Image("B_C")
            }
            else if note == "G"{
                return Image("B_G")
            }
            else if note == "D"{
                return Image("B_D")
            }
            else if note == "A"{
                return Image("B_A")
            }
            else if note == "E"{
                return Image("B_E")
            }
            else if note == "B"{
                return Image("B_B")
            }
            else if note == "F#"{
                return Image("B_FS")
            }
            else if note == "C#"{
                return Image("B_CS")
            }
            else if note == "F"{
                return Image("B_F")
            }
            
            else if note == "B♭"{
                return Image("B_BF")
            }
            
            else if note == "E♭"{
                return Image("B_EF")
            }
            
            else if note == "A♭"{
                return Image("B_AF")
            }
            
            else if note == "D♭"{
                return Image("B_DF")
            }
            
            else if note == "G♭"{
                return Image("B_GF")
            }
            else{
                return Image("B_CF")
            }
        }
    }

}

struct keySigs_Previews: PreviewProvider {
    static var previews: some View {
        keySigs()
    }
}
