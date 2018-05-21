//
//  RemonCall.swift
//  remonios
//
//  Created by hyounsiklee on 2018. 5. 10..
//  Copyright © 2018년 Remote Monster. All rights reserved.
//

import UIKit

public class RemonCall: RemonIBController, RemonControllBlockSettable {
    override public init() {
        super.init()
        self.channelType = 0
    }
    
    override public func connectChannel(_ ch: String, _ config:RemonConfig? = nil) {
        super.connectChannel(ch, config)
    }
    
    public func search(complete: @escaping (RemonError?, Array<RemonSearchResult>?) -> Void) {
        super.search(type: .call, complete: complete)
    }
}