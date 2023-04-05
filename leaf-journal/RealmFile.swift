//  RealmFile.swift
//  leaf-journal
//
//  Created by Vibhuti Sharma on 4/4/23.
//

import RealmSwift

class Entry: Object {
    @Persisted var journal: String = ""
    @Persisted var dayCurrent: String = ""
    
    convenience init(journal: String, dayCurrent: String) {
         self.init()
         self.journal = journal
         self.dayCurrent = dayCurrent
     }

}

class Date: Object {
    @Persisted var entry: Entry?
    
    convenience init(entry: Entry) {
         self.init()
         self.entry = entry
     }
}


