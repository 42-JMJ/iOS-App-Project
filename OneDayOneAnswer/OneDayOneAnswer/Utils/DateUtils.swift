//
//  DateUtils.swift
//  OneDayOneAnswer
//
//  Created by Jaedoo Ko on 2020/05/01.
//  Copyright © 2020 JMJ. All rights reserved.
//

import Foundation

func strToDate(_ dateStr: String) -> Date? {
    let formatter: DateFormatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.date(from: dateStr)
}

func dateToStr(_ date: Date, _ format: String) -> String {
    let formatter: DateFormatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = format
    return formatter.string(from: date)
}

func dateToStr(_ date: Date) -> String {
    dateToStr(date, "yyyy-MM-dd")
}
