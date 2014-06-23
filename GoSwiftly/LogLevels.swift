//
//  LogLevels.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/22/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

//
// Raw enumeration used to compose LogState bitmasks, test for level membership
//

enum LogLevel: UInt {
    case Error   = 0b00001;
    case Warn    = 0b00010;
    case Info    = 0b00100;
    case Debug   = 0b01000;
    case Verbose = 0b10000;
}

//
// Bitmask used to fully specify which types of logs should fire
//

struct LogState : RawOptionSet {
    
    var value: UInt = 0
    
    //
    // Values
    //
    
    static var Error:   LogState { return LogState(LogLevel.Error) }
    static var Warn:    LogState { return LogState(LogState.Error | LogLevel.Warn)    }
    static var Info:    LogState { return LogState(LogState.Warn  | LogLevel.Info)    }
    static var Debug:   LogState { return LogState(LogState.Info  | LogLevel.Debug)   }
    static var Verbose: LogState { return LogState(LogState.Debug | LogLevel.Verbose) }
    
    //
    // Utility functions
    //
    
    func containsLevel(level: LogLevel) -> Bool {
        return self & level != 0
    }
    
    //
    // Crufty RawOptionSet conformance
    //
    
    init(_ value: LogLevel) { self.value = value.toRaw() }
    init(_ value: UInt) { self.value = value }
    
    func toRaw() -> UInt { return self.value }
    func getLogicValue() -> Bool { return self.value != 0 }
    
    static func fromRaw(raw: UInt)  -> LogState? { return LogState(raw) }
    static func fromMask(raw: UInt) -> LogState  { return LogState(raw) }
    
}

//
// Operators for building and inspecting LogState bitmasks
//

func | (lhs: LogLevel, rhs: LogLevel) -> UInt { return lhs.toRaw() | rhs.toRaw() }
func | (lhs: LogLevel, rhs: UInt) -> UInt { return lhs.toRaw() | rhs }

func | (lhs: LogState, rhs: LogLevel) -> UInt { return lhs.value | rhs.toRaw() }
func & (lhs: LogState, rhs: LogLevel) -> UInt { return lhs.value & rhs.toRaw() }
