//
//  Logger.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/22/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

extension Logger {
    
    class func error(string: String) {
        Logger.singleton.log(.Error, string: string)
    }
    
    class func warn(string: String) {
        Logger.singleton.log(.Warn, string: string)
    }
    
    class func info(string: String) {
        Logger.singleton.log(.Info, string: string)
    }
    
    class func debug(string: String) {
        Logger.singleton.log(.Debug, string: string)
    }
    
    class func verbose(string: String) {
        Logger.singleton.log(.Verbose, string: string)
    }
    
}

class Logger {
    
    class var singleton : Logger {
        struct Static { static let instance : Logger = Logger() }
        return Static.instance
    }
    
    var state: LogState!
    var formatter: AbstractFormatter = Formatter()
    
    //
    // Logging
    //
    
    func log(level: LogLevel, string: String) {
        if(self.state.containsLevel(level)) {
            var message = self.formatter.formatString(string, forLevel: level)
            println(message)
        }
    }
    
}
