//
//  notes.swift
//  sight_reading
//
//  Created by Sunny Kong on 2024-02-22.
//

import SwiftUI

struct notes: View {
    @State var noteType: NoteType = .none
    @State var randNote = "C"
    @State var randClef = "T"
    @State var randSuffix = "N"
    @State var yOffset = CGFloat(0)
    @State var displayedNote: String = ""
    @State var suffix = Image("sharp")
    @State var clef = Image("treble")
    @State var sufVisible = false
    let staff = Image("music_staff")
    let whole_note = Image("whole_note")
    var body: some View {
        VStack{
            ZStack(alignment: .leading) { // Aligning to the leading edge
                staff.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300.0)
                    .padding()
                HStack{
                    clef.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100.0)
                        .padding(.leading,35)
                    if sufVisible{
                        suffix.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:60)
                            .offset(y:yOffset)
                    }
                    whole_note.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 60.0)
                        .offset(y:yOffset)
                }
            }.padding()
            HStack {
                ForEach(ButtonTitles.values, id: \.self) { title in
                    Button(action: {
                        let correct = checkAnswer(selectedNote: title, selectedSuffix: noteTypeText)
                        if correct {
                            resetScreen()
                        }
                    }) {
                        Text(title)
                            .font(.headline) // Set font size and style
                            .foregroundColor(.white) // Set text color
                            .padding() // Add padding around the text
                            .background(Color.blue) // Set background color
                            .cornerRadius(10) // Apply corner radius to create rounded corners
                            .shadow(color: .gray, radius: 3, x: 1, y: 1) // Add shadow
                    }
                    .buttonStyle(PlainButtonStyle()) // Remove button default styling
                }

            }
            Button(action: {
                noteType.toggle()
            }) {
                Text(noteTypeText)
                    .font(.title) // Set font size and style
                    .foregroundColor(.white) // Set text color
                    .padding() // Add padding around the text
                    .background(Color.green) // Set background color
                    .cornerRadius(8) // Apply corner radius to create rounded corners
                    .shadow(color: .gray, radius: 3, x: 1, y: 1) // Add shadow
            }
            .buttonStyle(PlainButtonStyle()) // Remove button default styling
            .offset(y:50)

        }
        .onAppear {
            // Generate a new random note when the view appears
            generateRandomNote()
            showSuffix()
            showClef()
            
        }
    }
    
    //check type
    var noteTypeText: String {
        switch noteType {
        case .none:
            return "None"
        case .sharp:
            return "# (Sharp)"
        case .flat:
            return "♭ (Flat)"
        }
    }
    
    //generating the note for user to recognise, also calculate the y offset for graphical display to be correct
    func generateRandomNote() {
        randNote = randomNote()
        randClef = randomClef()
        randSuffix = randomSuffix()
        yOffset = calcY(clef:randClef,note:randNote)
        displayedNote = randClef + randNote + randSuffix
    }
    //show image based on what suffix, sharp or flat
    func showSuffix(){
        if randSuffix != "N"{
            sufVisible = true
            if randSuffix == "S"{
                suffix = Image("sharp")
            }
            else if randSuffix == "F"{
                suffix = Image("flat")
            }
        }
        else{
            sufVisible = false
        }
    }
    //default is already set to treble so if clef == b, set image to bass
    func showClef(){
        if randClef == "B" {
            clef = Image("bass")
        }
        else{
            clef = Image("treble")
        }
    }
    //check if note and suffix are right based on button and generateRandomNote
    func checkAnswer(selectedNote: String, selectedSuffix: String) -> Bool {
        var checkSuffix:String
        if selectedSuffix == "None"{
            checkSuffix = "N"
        }
        else if selectedSuffix == "# (Sharp)"{
            checkSuffix = "S"
        }
        else{
            checkSuffix = "F"
        }
        return selectedNote == randNote && checkSuffix == randSuffix
    }
    func resetScreen() {
        generateRandomNote()
        showSuffix()
        showClef()
        displayedNote = randClef + randNote + randSuffix // Reset displayed note
    }

}
struct notes_Previews: PreviewProvider {
    static var previews: some View {
        notes()
    }
}
