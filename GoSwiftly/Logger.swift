//
//  Logger.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/22/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

extension Logger {
    
    class func error(message: String) {
        Logger.singleton.log(.Error, string: message)
    }
    
    class func warn(message: String) {
        Logger.singleton.log(.Warn, string: message)
    }
    
    class func info(message: String) {
        Logger.singleton.log(.Info, string: message)
    }
    
    class func debug(message: String) {
        Logger.singleton.log(.Debug, string: message)
    }
    
    class func verbose(message: String) {
        Logger.singleton.log(.Verbose, string: message)
    }
    
    class func check(error: NSError?, message: String?) {
        if let validError = error {
            let validMessage = message == nil ? "" : message
            Logger.singleton.log(.Error, string: "\(validMessage) \(validError)")
        }
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
