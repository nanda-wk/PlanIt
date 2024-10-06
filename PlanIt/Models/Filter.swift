//
//  Filter.swift
//  PlanIt
//
//  Created by Nanda WK on 2024-10-06.
//

import Foundation

struct Filter {
    var searchText: String = ""
    var sortByTags: Set<Tag> = []
    var sortByType: Set<TaskType> = []
    var sortByDate: Set<SortByDate> = []

    enum SortByDate {
        case newest
        case oldest
    }
}
