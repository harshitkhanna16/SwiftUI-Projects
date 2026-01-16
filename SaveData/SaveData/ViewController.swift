//
//  ViewController.swift
//  SaveData
//
//  Created by GEU on 14/01/26.
//

import UIKit

class ViewController: UIViewController {
    
    struct Note: Codable {
        let title: String
        let text: String
        let timestamp: Date
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let newNote = Note(title: "Grocery", text: "Pick up pineapple, capsicum, and pickles.", timestamp: Date())
        
        let propertyListEncoder = PropertyListEncoder()
//        if let encodeNote = try? propertyListEncoder.encode(newNote) {
//            print(encodeNote)
//            if let decodeNote = try? PropertyListDecoder().decode(Note.self, from: encodeNote) {
//                print(decodeNote)
//            }
//        }
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentDirectory.appendingPathComponent("note_test").appendingPathExtension("plist")
        
        let encodeNote = try? propertyListEncoder.encode(newNote)
        //write encoded object to archiveURL- file
        try? encodeNote?.write(to:archiveURL, options: .noFileProtection)
        //read data
        //decoder
        let propertyListDecoder = PropertyListDecoder()
        //decoding the object
        if let retrieveNoteData = try?Data(contentsOf: archiveURL), let decodeNote = try? propertyListDecoder.decode(Note.self, from: retrieveNoteData) {
            print(decodeNote)
        }
        print(documentDirectory.path())
        print(archiveURL)
        print("DONE")
    }
}

//whenever we are conforming codable protocol two methods should be ensure encode method and decode method.
//if my properties are of those data type then we don't need to override those methods
//we can save data in a particular folder named sandbox, and the folder name will change every time you load it.
//.documentDirectory-search parameter
//.userDomainMask-user's home folder
