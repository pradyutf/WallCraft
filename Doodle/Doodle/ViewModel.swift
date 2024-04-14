//
//  ViewModel.swift
//  Doodle
//
//  Created by Pradyut Fogla on 26/02/24.
//

import Foundation
import Observation

enum FlowStatey{
    case one
    case two
    case three
}


@Observable
class ViewModel{
    var flowState = FlowStatey.one
    
    var isPanel: Bool = false
}
