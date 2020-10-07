//
//  Profile+CoreDataProperties.swift
//  MyResume
//
//  Created by Féfé on 06/10/2020.
//  Copyright © 2020 Felix Boquet. All rights reserved.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var job: String?
    @NSManaged public var tech: String?

}
