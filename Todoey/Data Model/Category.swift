//
//  Category.swift
//  Todoey
//
//  Created by Chamuel Castillo on 6/23/19.
//  Copyright © 2019 chamuel castillo. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
    
}
