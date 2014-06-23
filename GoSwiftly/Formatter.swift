//
//  Formatter.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/22/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

protocol AbstractFormatter {
    func formatString(string: String, forLevel level: LogLevel) -> String
    func prefix(forLevel level: LogLevel) -> String
    func label(forState state: LogState) -> String!
}

class Formatter : AbstractFormatter {

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
    
    func label(forState state: LogState) -> String! {
        switch(state) {
            case LogState.Error:   return "error"
            case LogState.Warn:    return "warn"
            case LogState.Info:    return "info"
            case LogState.Debug:   return "debug"
            case LogState.Verbose: return "verbose"
            default: return "none"
        }
    }
}
