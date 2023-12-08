//
//  Plugin+Extensions.swift
//  
//
//  Created by Adriano Gimenez on 24/11/2023.
//

import Foundation
import Publish

extension Plugin {
    static var ensureAllItemsAreTagged: Self {
        Plugin(name: "Ensure that all items are tagged") { context in
            let allItems = context.sections.flatMap { $0.items }

            for item in allItems {
                guard !item.tags.isEmpty else {
                    throw PublishingError(
                        path: item.path,
                        infoMessage: "Item has no tags"
                    )
                }
            }
        }
    }
}
