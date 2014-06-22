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
    
    func log(level: LogLevel, string: String) {
        if(self.state & level != 0) {
            println(formatString(string, forLevel: level))
        }
    }
    
    func formatString(string: String, forLevel level: LogLevel) -> String {
        return "\( self.prefix(forLevel: level) ) \( string )"
    }
    
    func prefix(forLevel level: LogLevel) -> String {
        switch(level) {
            case .Error:   return "ERROR:  "
            case .Warn:    return "WARN:   "
            case .Info:    return "INFO:   "
            case .Debug:   return "DEBUG:  "
            case .Verbose: return "VERBOSE:"
        }
    }
    
}
