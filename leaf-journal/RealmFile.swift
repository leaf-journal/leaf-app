//  RealmFile.swift
//  leaf-journal
//
//  Created by Vibhuti Sharma on 4/4/23.
//

import RealmSwift

class Entry: Object {
    @Persisted var journal: String = ""
    @Persisted var dayCurrent: String = ""
    @Persisted var photoCaption: String = ""
    
    convenience init(journal: String, dayCurrent: String, photoCaption: String) {
         self.init()
         self.journal = journal
         self.dayCurrent = dayCurrent
         self.photoCaption = photoCaption
     }

}

class Date: Object {
    @Persisted var entry: Entry?
    @Persisted var date: String
    
    convenience init(entry: Entry, date: String) {
         self.init()
         self.entry = entry
         self.date = date
     }
}


