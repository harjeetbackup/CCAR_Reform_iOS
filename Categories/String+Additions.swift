//
//  String+Additions.swift
//  ReformLuach
//
//  Created by Mahadev Prabhu on 11/03/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import Foundation

extension String {
    
    func html(_ event: RLEvent, allEvents: [RLEvent]) -> String? {
        var name = self
        if event.chanukahNextDayLogic(){
            if let string = applyChanukahNextDayLogic(event, allEvents) {
                name = string
            }
        }
        if event.chanukahTodayLogic() {
            if let string = applyChanukahTodayLogic(event, allEvents) {
                name = string
            }
        }
        name = name.spellChanged()
        name = name.removeSpecialChars()
        print(name)
        let url = Bundle.main.url(forResource: name, withExtension: "html")
        return url?.absoluteString
    }
    
    func applyChanukahNextDayLogic(_ event: RLEvent, _ nextEvent: [RLEvent]) -> String? {
        var name = self
        var comparableEvent : RLEvent?
        if event.title != "Rosh Chodesh Tevet" {
            for anyEvent in nextEvent {
                if let eventDate = event.date, let nextDayEventDate = anyEvent.date {
                    if nextDayEventDate > eventDate && anyEvent.roshChodeshNextDayAndTodayLogic()  && event.chanukahNextDayLogic() {
                        comparableEvent = anyEvent
                    }
                }
            }
        }
        if comparableEvent != nil {
            name = name.spellChanged()
            if comparableEvent?.title != nil {
                name = name.replacingOccurrences(of: "Chanukah_7th_Night", with: "Chanukah_7th_Night_Erev_Rosh_Chodesh_Tevet")
                name = name.replacingOccurrences(of: "Chanukah_6th_Night", with: "Chanukah_6th_Night_Erev_Rosh_Chodesh_Tevet")
                comparableEvent = nil
            }
        }
        return name
    }
    
    func applyChanukahTodayLogic(_ event: RLEvent, _ nextEvent: [RLEvent]) -> String? {
        var name = self
        var comparableEvent : RLEvent?
        if event.title != "Rosh Chodesh Tevet" {
            for anyEvent in nextEvent {
                if let date = anyEvent.date {
                    if event.date?.localizedStandardContains(date) == true && anyEvent.roshChodeshNextDayAndTodayLogic() && event.chanukahTodayLogic() {
                        comparableEvent = anyEvent
                    }
                }
            }
        }
        if comparableEvent != nil {
            name = name.spellChanged()
            if comparableEvent?.title != nil {
                name = name.replacingOccurrences(of: "Chanukah_7th_Night", with: "Chanukah_7th_Night_Rosh_Chodesh_Tevet_1")
                name = name.replacingOccurrences(of: "Chanukah_8th_Night", with: "Chanukah_8th_Night_Rosh_Chodesh_Tevet_1")
                name = name.replacingOccurrences(of: "Chanukah_8th_Day", with: "Chanukah_8th_Day_Rosh_Chodesh_Tevet_1")
                comparableEvent = nil
            }
        }
        return name
    }
    
    func spellChanged() -> String {
        var name = self;
        name = name.replacingOccurrences(of: "Pesach_Day_7", with: "Pesach_Day_7_Shabbat")
        name = name.replacingOccurrences(of: "Erev Rosh Chodesh Weekday", with: "Erev_Rosh_Chodesh_Weekday")
        name = name.replacingOccurrences(of: "Parashat Vayakhel-Pekudei", with: "Shabbat_Vayakheil-P'kudei")
        name = name.replacingOccurrences(of: "Parashat Achrei Mot-Kedoshim", with: "Shabbat_Acharei_Mot-K'doshim")
        name = name.replacingOccurrences(of: "Chanukah: 8th Day", with: "Chanukah_8th_Day")
        name = name.replacingOccurrences(of: "Pesach_Day_1_Weekday", with: "Pesach_Day_1_Shabbat")
        name = name.replacingOccurrences(of: "Parashat Bereshit", with: "B'reishit")
        name = name.replacingOccurrences(of: "Parashat Noach", with: "Noach")
        name = name.replacingOccurrences(of: "Parashat Lech-Lecha", with: "Lech L'cha")
        name = name.replacingOccurrences(of: "Parashat Vayera", with: "Vayeira")
        name = name.replacingOccurrences(of: "Parashat Chayei Sara", with: "Chayei_Sara")
        name = name.replacingOccurrences(of: "Parashat Vayishlach", with: "Vayishlach")
        name = name.replacingOccurrences(of: "Parashat Toldot", with: "Tol'dot")
        name = name.replacingOccurrences(of: "Parashat Vayetzei", with: "Vayeitzei")
        name = name.replacingOccurrences(of: "Parashat Vayeshev", with: "Vayeishev")
        name = name.replacingOccurrences(of: "Parashat Miketz", with: "Mikeitz")
        name = name.replacingOccurrences(of: "Parashat Vayechi", with: "Va-y'chi")
        name = name.replacingOccurrences(of: "Parashat Vayeilech", with: "Vayeilech")
        name = name.replacingOccurrences(of: "Parashat Shemot", with: "Sh'mot")
        name = name.replacingOccurrences(of: "Parashat Vaera", with: "Va-eira")
        name = name.replacingOccurrences(of: "Parashat Beshalach", with: "B'shalach")
        name = name.replacingOccurrences(of: "Parashat Terumah", with: "T'rumah")
        name = name.replacingOccurrences(of: "Parashat Ki Tisa", with: "Ki Tisa")
        name = name.replacingOccurrences(of: "Parashat Ki Tavo", with: "Ki Tavo")
        name = name.replacingOccurrences(of: "Parashat Bo", with: "Bo")
        name = name.replacingOccurrences(of: "Parashat Mishpatim", with: "Mishpatim")
        name = name.replacingOccurrences(of: "Parashat Yitro", with: "Yitro")
        name = name.replacingOccurrences(of: "Parashat Tetzaveh", with: "T'tzaveh")
        name = name.replacingOccurrences(of: "Parashat Vayigash", with: "Vayigash")
        name = name.replacingOccurrences(of: "Parashat Vayakhel", with: "Vayak'heil")
        
        name = name.replacingOccurrences(of: "Parashat Shmini", with: "Sh'mini")
        name = name.replacingOccurrences(of: "Parashat Metzora", with: "M'tzora")
        name = name.replacingOccurrences(of: "Parashat Achrei Mot", with: "Acharei Mot")
        name = name.replacingOccurrences(of: "Parashat Kedoshim", with: "K'doshim")
        name = name.replacingOccurrences(of: "Parashat Bechukotai", with: "B'chukotai")
        name = name.replacingOccurrences(of: "Parashat Behar-Bechukotai", with: "B'har/B'chukotai")
        name = name.replacingOccurrences(of: "Parashat Behar", with: "B'har")
        name = name.replacingOccurrences(of: "Parashat Bamidbar", with: "B'midbar")
        name = name.replacingOccurrences(of: "Parashat Nasso", with: "Naso")
        name = name.replacingOccurrences(of: "Parashat Beha'alotcha", with: "B'haalot'cha")
        name = name.replacingOccurrences(of: "Parashat Sh'lach", with: "Sh'lach L'cha")
        name = name.replacingOccurrences(of: "Parashat Vayikra", with: "Vayikra")
        name = name.replacingOccurrences(of: "Parashat Masei", with: "Shabbat_Mas'ei")
        name = name.replacingOccurrences(of: "Parashat Tzav", with: "Tzav")
        name = name.replacingOccurrences(of: "Parashat Devarim", with: "Shabbat_D'varim-Shabbat_Chazon")
        name = name.replacingOccurrences(of: "Parashat Vaetchanan", with: "Shabbat V'etchanan/Nachamu")
        name = name.replacingOccurrences(of: "Parashat Ki Teitzei", with: "Ki Teitzei")
        name = name.replacingOccurrences(of: "Parashat Nitzavim", with: "Nitzavim")
        name = name.replacingOccurrences(of: "Parashat Shoftim", with: "Shof'tim")
        name = name.replacingOccurrences(of: "Parashat Re'eh", with: "R'eih")
        name = name.replacingOccurrences(of: "Parashat Eikev", with: "Eikev")
        name = name.replacingOccurrences(of: "Parashat Ha'Azinu", with: "Haazinu")
        name = name.replacingOccurrences(of: "Parashat Chukat", with: "Chukat")
        name = name.replacingOccurrences(of: "Parashat Balak", with: "Balak")
        name = name.replacingOccurrences(of: "Parashat Pinchas", with: "Pinchas")
        name = name.replacingOccurrences(of: "Parashat Emor", with: "Emor")
        name = name.replacingOccurrences(of: "Parashat Tazria-Metzora", with: "Tazria-M'tzora")
        name = name.replacingOccurrences(of: "Parashat Tazria", with: "Tazria")
        name = name.replacingOccurrences(of: "Parashat Korach", with: "Korach")
        name = name.replacingOccurrences(of: "Parashat Behar-Bechukotai", with: "B'har-B'chukotai")
        name = name.replacingOccurrences(of: "Parashat Nitzavim-Vayeilech", with: "Nitzavim/Vayeilech")
        name = name.replacingOccurrences(of: "Parashat Matot-Masei", with: "Shabbat_Matot-Mas'ei")
        
        //     ===================  Parishoyot end  ===========================
        if name.hasPrefix("Rosh Hashana") {
            if name.lastThreeLettersAreNumbers == true {
                name = name.replacingOccurrences(of: name, with: "Rosh_Hashanah_1")
            }
        }
        name = name.replacingOccurrences(of: "Rosh Hashana II", with: "Rosh Hashanah 2")
        name = name.replacingOccurrences(of: "Erev Rosh Hashana Friday", with: "Erev_Rosh_Hashanah_Friday")
        name = name.replacingOccurrences(of: "Erev Rosh Hashana", with: "Erev Rosh Hashanah Weekday")
        name = name.replacingOccurrences(of: "Pesach Chol HaMoed Day 5 Friday", with: "Pesach_Chol_Hamoed_Day_5_Friday")
        name = name.replacingOccurrences(of: "Chukat-Balak", with: "Chukat/Balak")
        name = name.replacingOccurrences(of: "Erev Pesach", with: "Erev_Pesach-Ta'anit_Bechorot")
        name = name.replacingOccurrences(of: "Shabbat Shekalim", with: "Shabbat Sh'kalim")
        name = name.replacingOccurrences(of: "Tu BiShvat", with: "Tu B'Sh'vat")
        name = name.replacingOccurrences(of: "Tzom Tammuz", with: "Shiva Asar b'Tammuz")
        name = name.replacingOccurrences(of: "Tish'a B'Av", with: "Tisha B'Av")
        name = name.replacingOccurrences(of: "Erev Tisha B\'Av", with: "Erev Tisha b'Av")
        name = name.replacingOccurrences(of: "Yom HaShoah", with: "Yom HaShoah V'hag'vurah")
        name = name.replacingOccurrences(of: "Yom HaAtzma'ut", with: "Yom Ha'atzma'ut")
        name = name.replacingOccurrences(of: "Lag B'Omer", with: "Lag Ba'Omer")
        name = name.replacingOccurrences(of: "Erev Pesach", with: "Erev_Pesach-Ta'anit_Bechorot")
        name = name.replacingOccurrences(of: "Shmini Atzeret", with: "Sh'mini Atzeret/Simchat Torah")
        name = name.replacingOccurrences(of: "Sukkot II (CH''M)", with: "Sukkot 2 Weekday")
        name = name.replacingOccurrences(of: "Sukkot III (CH''M)", with: "Sukkot 3 Weekday")
        name = name.replacingOccurrences(of: "Sukkot IV (CH''M)", with: "Sukkot 4 Weekday")
        name = name.replacingOccurrences(of: "Sukkot V (CH''M)", with: "Sukkot 5 Weekday")
        name = name.replacingOccurrences(of: "Sukkot VI (CH''M)", with: "Sukkot 6 Weekday")
        name = name.replacingOccurrences(of: "Sukkot VII (Hoshana Raba)", with: "Hoshana Raba")
        name = name.replacingOccurrences(of: "Sukkot II", with: "Sukkot 2 Weekday")
        name = name.replacingOccurrences(of: "Sukkot I", with: "Sukkot_1_Weekday")
        name = name.replacingOccurrences(of: "Pesach Sheni", with: "Pesach Sheini")
        name = name.replacingOccurrences(of: "Pesach VIII", with: "Pesach-VIII")
        name = name.replacingOccurrences(of: "Pesach II (CH''M)", with: "Pesach Chol Hamoed Day 1")
        name = name.replacingOccurrences(of: "Pesach III (CH''M)", with: "Pesach Chol Hamoed Day 2")
        name = name.replacingOccurrences(of: "Pesach IV (CH''M)", with: "Pesach Chol Hamoed Day 3")
        name = name.replacingOccurrences(of: "Pesach V (CH''M)", with: "Pesach Chol Hamoed Day 4")
        name = name.replacingOccurrences(of: "Pesach VI (CH''M)", with: "Pesach Chol HaMoed Day 5 Weekday")
        name = name.replacingOccurrences(of: "Pesach VII", with: "Pesach_Day_7")
        name = name.replacingOccurrences(of: "Pesach II", with: "Pesach Chol Hamoed Day 1")
        name = name.replacingOccurrences(of: "Pesach I", with: "Pesach Day 1 Weekday")
        name = name.replacingOccurrences(of: "Chanukah: 1 Candle", with: "Erev Chanukah")
        name = name.replacingOccurrences(of: "Yom HaAliyah", with: "Yom_HaZikaron")
        name = name.replacingOccurrences(of: "Shabbat Shuva", with: "Shabbat_Shuva")
        name = name.replacingOccurrences(of: "Shavuot II", with: "Shavuot-II")
        name = name.replacingOccurrences(of: "Shavuot I", with: "Shavuot")
        
        // ================================Omer days============================================
        
        name = name.replacingOccurrences(of: "Ta\'anit Bechorot", with: "Ta'anit_Bechorot")
        name = name.replacingOccurrences(of: "15th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "16th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "17th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "18th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "19th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "20th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "21st day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "22nd day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "23rd day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "24th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "25th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "26th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "27th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "28th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "29th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "30th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "31st day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "32nd day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "34th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "35th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "36th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "37th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "38th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "39th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "40th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "41st day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "42nd day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "43rd day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "44th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "45th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "46th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "47th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "48th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "49th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "Lag BaOmer", with: "Lag_Ba'Omer")
        name = name.replacingOccurrences(of: "33rd day of the Omer", with: "Lag_Ba'Omer")
        name = name.replacingOccurrences(of: "14th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "1st day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "2nd day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "3rd day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "4th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "5th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "6th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "7th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "8th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "9th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "10th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "11th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "12th day of the Omer", with: "Counting_the_Omer")
        name = name.replacingOccurrences(of: "13th day of the Omer", with: "Counting_the_Omer")
        
        // ==================================Rosh Chodesh====================================
        
        name = name.replacingOccurrences(of: "Rosh Chodesh Tamuz", with: "Rosh_Chodesh_I_Weekday")
        name = name.replacingOccurrences(of: "Rosh Chodesh Cheshvan", with: "Rosh_Chodesh_I_Weekday")
        name = name.replacingOccurrences(of: "Rosh Chodesh Sh\'vat", with: "Rosh_Chodesh_I_Weekday")
        name = name.replacingOccurrences(of: "Rosh Chodesh Adar I", with: "Rosh_Chodesh_Adar_I")
        name = name.replacingOccurrences(of: "Rosh Chodesh Adar", with: "Rosh_Chodesh_Adar_I")
        name = name.replacingOccurrences(of: "Rosh Chodesh Nisan", with: "Rosh_Chodesh_I_Weekday")
        name = name.replacingOccurrences(of: "Rosh Chodesh Iyyar", with: "Rosh_Chodesh_I_Weekday")
        name = name.replacingOccurrences(of: "Rosh Chodesh Sivan", with: "Rosh_Chodesh_I_Weekday")
        name = name.replacingOccurrences(of: "Rosh Chodesh Kislev", with: "Rosh_Chodesh_I_Weekday")
        name = name.replacingOccurrences(of: "Rosh Chodesh Tevet", with: "Rosh_Chodesh_I_Weekday")
        name = name.replacingOccurrences(of: "Chanukah: 2 Candles", with: "Chanukah_2nd_Night")
        name = name.replacingOccurrences(of: "Chanukah: 3 Candles", with: "Chanukah_3rd_Night")
        name = name.replacingOccurrences(of: "Chanukah: 4 Candles", with: "Chanukah_4th_Night")
        name = name.replacingOccurrences(of: "Chanukah: 5 Candles", with: "Chanukah_5th_Night")
        name = name.replacingOccurrences(of: "Chanukah: 6 Candles", with: "Chanukah_6th_Night")
        name = name.replacingOccurrences(of: "Chanukah: 7 Candles", with: "Chanukah_7th_Night")
        name = name.replacingOccurrences(of: "Chanukah: 8 Candles", with: "Chanukah_8th_Night")
        name = name.replacingOccurrences(of: "Shabbat Chazon", with: "Shabbat_D'varim-Shabbat_Chazon")
        name = name.replacingOccurrences(of: "Shabbat Nachamu", with: "Shabbat_V'etchanan-Nachamu")
        // =========================================================================================
        
        return name
    }
    
    func removeSpecialChars() -> String {
        var name = self;
        name = name.replacingOccurrences(of: ":", with: "")
        name = name.replacingOccurrences(of: "/", with: "-")
        name = name.replacingOccurrences(of: " ", with: "_")
        return name
    }
    
    func spellChangedForTitle() -> String {
        var name = self;
        //==============================     Parashat     ============================================
        if EventManager.shared.selectedCalender.hashValue == 2 {
            name = name.replacingOccurrences(of: "Shmini Atzeret", with: "Sh'mini Atzeret/Simchat Torah")
        }
        name = name.replacingOccurrences(of: "Parashat Bereshit", with: "Parashat B'reishit")
        name = name.replacingOccurrences(of: "Parashat Chayei Sara", with: "Parashat Chayei Sarah")
        name = name.replacingOccurrences(of: "Parashat Lech-Lecha", with: "Parashat Lech L'cha")
        name = name.replacingOccurrences(of: "Parashat Vayera", with: "Parashat Vayeira")
        name = name.replacingOccurrences(of: "Parashat Toldot", with: "Parashat Tol'dot")
        name = name.replacingOccurrences(of: "Parashat Vayetzei", with: "Parashat Vayeitzei")
        name = name.replacingOccurrences(of: "Parashat Vayeshev", with: "Parashat Vayeishev")
        name = name.replacingOccurrences(of: "Parashat Miketz", with: "Parashat Mikeitz")
        name = name.replacingOccurrences(of: "Parashat Vayechi", with: "Parashat Va-y'chi")
        name = name.replacingOccurrences(of: "Parashat Shemot", with: "Parashat Sh'mot")
        name = name.replacingOccurrences(of: "Parashat Vaera", with: "Parashat Va-eira")
        name = name.replacingOccurrences(of: "Parashat Beshalach", with: "Parashat B'shalach")
        name = name.replacingOccurrences(of: "Parashat Terumah", with: "Parashat T'rumah")
        name = name.replacingOccurrences(of: "Parashat Tetzaveh", with: "Parashat T'tzaveh")
        name = name.replacingOccurrences(of: "Parashat Pekudei", with: "Parashat P'kudei")
        name = name.replacingOccurrences(of: "Parashat Shmini", with: "Parashat Sh'mini")
        name = name.replacingOccurrences(of: "Parashat Metzora", with: "Parashat M'tzora")
        name = name.replacingOccurrences(of: "Parashat Achrei Mot", with: "Parashat Acharei Mot")
        name = name.replacingOccurrences(of: "Parashat Acharei Mot-Kedoshim", with: "Parashat Acharei Mot/K'doshim")
        name = name.replacingOccurrences(of: "Parashat Kedoshim", with: "Parashat K'doshim")
        name = name.replacingOccurrences(of: "Parashat Behar-Bechukotai", with: "Parashat B'har/B'chukotai")
        name = name.replacingOccurrences(of: "Parashat Behar", with: "Parashat B'har")
        name = name.replacingOccurrences(of: "Parashat Bechukotai", with: "Parashat B'chukotai")
        name = name.replacingOccurrences(of: "Parashat Bamidbar", with: "Parashat B'midbar")
        name = name.replacingOccurrences(of: "Parashat Nasso", with: "Parashat Naso")
        name = name.replacingOccurrences(of: "Parashat Beha'alotcha", with: "Parashat B'haalot'cha")
        name = name.replacingOccurrences(of: "Parashat Sh'lach", with: "Parashat Sh'lach L'cha")
        name = name.replacingOccurrences(of: "Parashat Masei", with: "Parashat Mas'ei")
        name = name.replacingOccurrences(of: "Parashat Devarim", with: "Parashat D'varim")
        name = name.replacingOccurrences(of: "Parashat Vaetchanan", with: "Parashat Va-et'chanan")
        name = name.replacingOccurrences(of: "Parashat Re'eh", with: "Parashat R'eih")
        name = name.replacingOccurrences(of: "Parashat Shoftim", with: "Parashat Shof'tim")
        name = name.replacingOccurrences(of: "Parashat Ki Teitzei", with: "Parashat Ki Teitzei")
        name = name.replacingOccurrences(of: "Parashat Ha'Azinu", with: "Parashat Haazinu")
        name = name.replacingOccurrences(of: "Parashat Vezot Haberakhah", with: "Parashat V'zot Hab'rachah")
        name = name.replacingOccurrences(of: "Parashat Vayakhel-Pekudei", with: "Parashat Vayak’heil/P’kudei")
        name = name.replacingOccurrences(of: "Parashat Vayakhel", with: "Parashat Vayak'heil")
        name = name.replacingOccurrences(of: "Parashat Tazria-Metzora", with: "Parashat Tazria/M'tzora")
        name = name.replacingOccurrences(of: "Parashat Chukat-Balak", with: "Parashat Chukat/Balak")
        name = name.replacingOccurrences(of: "Parashat Matot-Masei", with: "Parashat Matot/Mas-ei")
        name = name.replacingOccurrences(of: "Parashat Nitzavim-Vayeilech", with: "Parashat Nitzavim/Vayeilech")
        //CHECK: -Any event with "Selichot" should be changed to "S'lichot"
        name = name.replacingOccurrences(of: "Leil Selichot", with: "Leil S'lichot")
        name = name.replacingOccurrences(of: "Erev Pesach", with: "Erev Pesach/Ta’anit Bechorot")
        name = name.replacingOccurrences(of: "Shabbat Shekalim", with: "Shabbat Sh'kalim")
        name = name.replacingOccurrences(of: "Tu BiShvat", with: "Tu B'Sh'vat")
        name = name.replacingOccurrences(of: "Tzom Tammuz", with: "Shivah Asar b'Tammuz")
        name = name.replacingOccurrences(of: "Tish'a B'Av", with: "Tisha B'Av")
        name = name.replacingOccurrences(of: "Erev Tisha B\'Av", with: "Erev Tisha b'Av")
        name = name.replacingOccurrences(of: "Hashana", with: "Hashanah")
        name = name.replacingOccurrences(of: "Erev Rosh Hashanah", with: "Erev Rosh Hashanah Weekday")
        name = name.replacingOccurrences(of: "Erev Rosh Hashanah Weekday Friday", with: "Erev Rosh Hashanah Friday")
        name = name.replacingOccurrences(of: "Rosh Hashana II", with: "Rosh Hashanah II")
        name = name.replacingOccurrences(of: "Yom HaShoah", with: "Yom HaShoah V'hag'vurah")
        name = name.replacingOccurrences(of: "Yom HaAtzma'ut", with: "Yom Ha'atzma'ut")
        name = name.replacingOccurrences(of: "Lag BaOmer", with: "Lag Ba'Omer")
        name = name.replacingOccurrences(of: "Sukkot II (CH''M)", with: "Sukkot 2 Weekday")
        name = name.replacingOccurrences(of: "Sukkot III (CH''M)", with: "Sukkot 3 Weekday")
        name = name.replacingOccurrences(of: "Sukkot IV (CH''M)", with: "Sukkot 4 Weekday")
        name = name.replacingOccurrences(of: "Sukkot V (CH''M)", with: "Sukkot 5 Weekday")
        name = name.replacingOccurrences(of: "Sukkot VI (CH''M)", with: "Sukkot 6 Weekday")
        name = name.replacingOccurrences(of: "Sukkot VII (Hoshana Raba)", with: "Hoshana Raba")
        name = name.replacingOccurrences(of: "Sukkot II", with: "Sukkot II")
        
        name = name.replacingOccurrences(of: "Pesach Sheni", with: "Pesach Sheini")
        name = name.replacingOccurrences(of: "Pesach II (CH''M)", with: "Pesach Chol Hamoed Day 1")
        name = name.replacingOccurrences(of: "Pesach III (CH''M)", with: "Pesach Chol Hamoed Day 2")
        name = name.replacingOccurrences(of: "Pesach IV (CH''M)", with: "Pesach Chol Hamoed Day 3")
        name = name.replacingOccurrences(of: "Pesach V (CH''M)", with: "Pesach Chol Hamoed Day 4")
        name = name.replacingOccurrences(of: "Pesach VI (CH''M)", with: "Pesach Chol HaMoed Day 5 Weekday")
        
        name = name.replacingOccurrences(of: "Chanukah: 2 Candles", with: "Chanukah: 2nd Night")
        name = name.replacingOccurrences(of: "Chanukah: 3 Candles", with: "Chanukah: 3rd Night")
        name = name.replacingOccurrences(of: "Chanukah: 4 Candles", with: "Chanukah: 4th Night")
        name = name.replacingOccurrences(of: "Chanukah: 5 Candles", with: "Chanukah: 5th Night")
        name = name.replacingOccurrences(of: "Chanukah: 6 Candles", with: "Chanukah: 6th Night")
        name = name.replacingOccurrences(of: "Chanukah: 7 Candles", with: "Chanukah: 7th Night")
        name = name.replacingOccurrences(of: "Chanukah: 8 Candles", with: "Chanukah: 8th Night")
        name = name.replacingOccurrences(of: "Chanukah: 1 Candle", with: "Chanukah: 1st Night")
        name = name.replacingOccurrences(of: "Chanukah: 8th Day", with: "Chanukah 8 Weekday")
        return name
    }
    //TODO: - FUNC
        var lastThreeLettersAreNumbers: Bool {
            if case let chars = suffix(4), chars.count > 3 {
                let numbersPattern = Character("0")..."9"
                return chars.reduce(true) { $0 && (numbersPattern ~= $1) }
            }
            return false
        }
}
