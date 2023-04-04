
//  RealmFile.swift
//  leaf-journal
//
//  Created by Vibhuti Sharma on 4/4/23.
//

import RealmSwift

class Entry: Object {
    @Persisted var journal: String = ""
    @Persisted var dayCurrent: String = ""

}

class Date: Object {
    @Persisted var entry: Entry?
}
