//
//  String+Additions.swift
//  ReformLuach
//
//  Created by Mahadev Prabhu on 11/03/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import Foundation

extension String {
    
    func html(_ event: RLEvent) -> String? {
        var name = self
        name = name.spellChanged()
        name = name.removeSpecialChars()
        name = name.applyFridaySatudayLogic(event)
        print(name)
        let url = Bundle.main.url(forResource: name, withExtension: "html");
        return url?.absoluteString
    }
    
    func applyFridaySatudayLogic(_ event: RLEvent) -> String {
        var name = self
        if event.inSaturday() {
            name = name.replacingOccurrences(of: "Pesach_Day_1_Weekday", with: "Pesach_Day_1_Shabbat")
            name = name.replacingOccurrences(of: "Pesach_Day_7", with: "Pesach_Day_7_Shabbat")
            name = name.replacingOccurrences(of: "Sukkot_1_Weekday", with: "Sukkot_1_Shabbat")
            name = name.replacingOccurrences(of: "Yom_Kippur", with: "Yom_Kippur_Shabbat")
            name = name.replacingOccurrences(of: "Shavuot I", with: "Shavuot_Shabbat")
            name = name.replacingOccurrences(of: "Sh'mini_Atzeret-Simchat_Torah", with: "Sh'mini_Atzeret-Simchat_Torah_Shabbat")
            name = name.replacingOccurrences(of: "Rosh_Chodesh_I_Weekday", with: "Shabbat_Rosh_Chodesh_I")
            name = name.replacingOccurrences(of: "Rosh_Chodesh_II_or_One_Day_Rosh_Chodesh_Weekday", with: "Shabbat_Rosh_Chodesh_II_or_One_Day_Rosh_Chodesh")
            name = name.replacingOccurrences(of: "Rosh_Hashanah_1", with: "Rosh_Hashanah_Shabbat")
            if (name == " Sukkot_2_Weekday" || name == "Sukkot_3_Weekday" || name == "Sukkot_4_Weekday" || name == "Sukkot_5_Weekday" || name == "Sukkot_6_Weekday") {
                name = "Chol_Hamoed_Sukkot_Shabbat"
           }
            //here name is "Chanukah_*_Weekday"
            if (name == "Chanukah_2_Weekday" || name == "Chanukah_3_Weekday" || name == "Chanukah_4_Weekday" || name == "Chanukah_5_Weekday" || name == "Chanukah_6_Weekday" || name == "Chanukah_7_Weekday" || name == "Chanukah_8_Weekday" || name == "Chanukah_8th_Day") {
                name = "Shabbat_Chanukah"
            }
        } else if event.inFriday() {
            name = name.replacingOccurrences(of: "Erev_Pesach-Ta'anit_Bechorot", with: "Erev_Pesach-Ta'anit_Bechorot_Friday")
            name = name.replacingOccurrences(of: "Erev_Rosh_Chodesh_Weekday", with: "Erev_Rosh_Chodesh_Friday")
            name = name.replacingOccurrences(of: "Erev_Sh'mini_Atzeret-Simchat_Torah", with: "Erev_Sh'mini_Atzeret-Erev_Simchat_Torah_Friday")
            name = name.replacingOccurrences(of: "Erev_Shavuot", with: "Erev_Shavuot_Friday")
            name = name.replacingOccurrences(of: "Erev_Sukkot", with: "Erev_Sukkot_Friday")
            name = name.replacingOccurrences(of: "Erev_Yom_Kippur", with: "Erev_Yom_Kippur_Friday")
            name = name.replacingOccurrences(of: "Pesach_Chol_Hamoed_Day_5_Weekday", with: "Pesach_Chol_Hamoed_Day_5_Friday")
            name = name.replacingOccurrences(of: "Erev_Rosh_Hashanah_Weekday", with: "Erev_Rosh_Hashanah_Friday")
            if (name == "Sukkot_2_Weekday" || name == "Sukkot_3_Weekday" || name == "Sukkot_4_Weekday" || name == "Sukkot_5_Weekday" || name == "Sukkot_6_Weekday") {
                name = "Shabbat_Chol_Hamoed_Sukkot_Friday"
            }
        }
        return name
    }
    
    func spellChanged() -> String {
        var name = self;
        name = name.replacingOccurrences(of: "Parashat Vayakhel-Pekudei", with: "Shabbat_Vayakheil-P'kudei")
        name = name.replacingOccurrences(of: "Parashat Achrei Mot-Kedoshim", with: "Shabbat_Acharei_Mot-K'doshim")
        name = name.replacingOccurrences(of: "Chanukah: 8th Day", with: "Chanukah 8 Weekday")
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
        name = name.replacingOccurrences(of: "Parashat Pekudei", with: "P'kudei")
        name = name.replacingOccurrences(of: "Parashat Shmini", with: "Sh'mini")
        name = name.replacingOccurrences(of: "Parashat Metzora", with: "M'tzora")
        name = name.replacingOccurrences(of: "Parashat Achrei Mot", with: "Acharei Mot")
        name = name.replacingOccurrences(of: "Parashat Kedoshim", with: "K'doshim")
        name = name.replacingOccurrences(of: "Parashat Behar-Bechukotai", with: "B'har/B'chukotai")
        name = name.replacingOccurrences(of: "Parashat Behar", with: "B'har")
        name = name.replacingOccurrences(of: "Parashat Bechukotai", with: "B'chukotai")
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
        //name = name.replacingOccurrences(of: "Parashat Nitzavim", with: "N'tzavim")
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
        
        name = name.replacingOccurrences(of: "Rosh Hashana 5779", with: "Rosh_Hashanah_1")
        name = name.replacingOccurrences(of: "Rosh Hashana 5780", with: "Rosh_Hashanah_1")
        name = name.replacingOccurrences(of: "Pesach VI (CH\'\'M)", with: "Pesach_Chol_Hamoed_Day_5_Friday")
        name = name.replacingOccurrences(of: "Chukat-Balak", with: "Chukat/Balak")
        name = name.replacingOccurrences(of: "Erev Pesach", with: "Erev_Pesach-Ta'anit_Bechorot")
        name = name.replacingOccurrences(of: "Shabbat Shekalim", with: "Shabbat Sh'kalim")
        name = name.replacingOccurrences(of: "Tu BiShvat", with: "Tu B'Sh'vat")
        name = name.replacingOccurrences(of: "Tzom Tammuz", with: "Shiva Asar b'Tammuz")
        name = name.replacingOccurrences(of: "Tish'a B'Av", with: "Tisha B'Av")
        name = name.replacingOccurrences(of: "Erev Tisha B\'Av", with: "Erev Tisha b'Av")
        name = name.replacingOccurrences(of: "Erev Rosh Hashana", with: "Erev Rosh Hashanah Weekday")
        name = name.replacingOccurrences(of: "Rosh Hashana", with: "Rosh Hashanah 1")
        name = name.replacingOccurrences(of: "Rosh Hashanah 1 II", with: "Rosh Hashanah 2")
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
        name = name.replacingOccurrences(of: "Pesach Sheni", with: "Pesach Sheini")
        name = name.replacingOccurrences(of: "Pesach II (CH''M)", with: "Pesach Chol Hamoed Day 1")
        name = name.replacingOccurrences(of: "Pesach III (CH''M)", with: "Pesach Chol Hamoed Day 2")
        name = name.replacingOccurrences(of: "Pesach IV (CH''M)", with: "Pesach Chol Hamoed Day 3")
        name = name.replacingOccurrences(of: "Pesach V (CH''M)", with: "Pesach Chol Hamoed Day 4")
        name = name.replacingOccurrences(of: "Pesach VI (CH''M)", with: "Pesach Chol HaMoed Day 5 Weekday")
        name = name.replacingOccurrences(of: "Chanukah: 1 Candle", with: "Erev Chanukah")
        name = name.replacingOccurrences(of: "Yom HaAliyah", with: "Yom_HaZikaron")
        name = name.replacingOccurrences(of: "Shabbat Shuva", with: "Shabbat_Ha'azinu-Shabbat_Shuva")
        
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
        name = name.replacingOccurrences(of: "Rosh Chodesh Sh\'vat", with: "Rosh_Chodesh_I_Weekday")
        name = name.replacingOccurrences(of: "Rosh Chodesh Adar I", with: "Rosh_Chodesh_Adar_I")
        name = name.replacingOccurrences(of: "Rosh Chodesh Nisan", with: "Rosh_Chodesh_I_Weekday")
        name = name.replacingOccurrences(of: "Rosh Chodesh Iyyar", with: "Rosh_Chodesh_I_Weekday")
        name = name.replacingOccurrences(of: "Rosh Chodesh Sivan", with: "Rosh_Chodesh_I_Weekday")
        name = name.replacingOccurrences(of: "Rosh Chodesh Kislev", with: "Rosh_Chodesh_I_Weekday")
        name = name.replacingOccurrences(of: "Rosh Chodesh Tevet", with: "Rosh_Chodesh_I_Weekday")
        name = name.replacingOccurrences(of: "Chanukah: 2 Candles", with: "Chanukah_2_Weekday")
        name = name.replacingOccurrences(of: "Chanukah: 3 Candles", with: "Chanukah_3_Weekday")
        name = name.replacingOccurrences(of: "Chanukah: 4 Candles", with: "Chanukah_4_Weekday")
        name = name.replacingOccurrences(of: "Chanukah: 5 Candles", with: "Chanukah_5_Weekday")
        name = name.replacingOccurrences(of: "Chanukah: 6 Candles", with: "Chanukah_6_Weekday")
        name = name.replacingOccurrences(of: "Chanukah: 7 Candles", with: "Chanukah_7_Weekday")
        name = name.replacingOccurrences(of: "Chanukah: 8 Candles", with: "Chanukah_8_Weekday")
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
        
        name = name.replacingOccurrences(of: "Parashat Bereshit", with: "Parashat B'reishit")
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
        name = name.replacingOccurrences(of: "Parashat Vayakhel", with: "Parashat Vayak'heil")
        name = name.replacingOccurrences(of: "Parashat Pekudei", with: "Parashat P'kudei")
        name = name.replacingOccurrences(of: "Parashat Shmini", with: "Parashat Sh'mini")
        name = name.replacingOccurrences(of: "Parashat Metzora", with: "Parashat M'tzora")
        name = name.replacingOccurrences(of: "Parashat Achrei Mot", with: "Parashat Acharei Mot")
        name = name.replacingOccurrences(of: "Parashat Kedoshim", with: "Parashat K'doshim")
        name = name.replacingOccurrences(of: "Parashat Behar", with: "Parashat B'har")
        name = name.replacingOccurrences(of: "Parashat Bechukotai", with: "Parashat B'chukotai")
        name = name.replacingOccurrences(of: "Parashat Bamidbar", with: "Parashat B'midbar")
        name = name.replacingOccurrences(of: "Parashat Nasso", with: "Parashat Naso")
        name = name.replacingOccurrences(of: "Parashat Beha'alotcha", with: "Parashat B'haalot'cha")
        name = name.replacingOccurrences(of: "Parashat Sh'lach", with: "Parashat Sh'lach L'cha")
        name = name.replacingOccurrences(of: "Parashat Masei", with: "Parashat Mas-ei")
        name = name.replacingOccurrences(of: "Parashat Devarim", with: "Parashat D'varim")
        name = name.replacingOccurrences(of: "Parashat Vaetchanan", with: "Parashat Va-et'chanan")
        name = name.replacingOccurrences(of: "Parashat Re'eh", with: "Parashat R'eih")
        name = name.replacingOccurrences(of: "Parashat Shoftim", with: "Parashat Shof'tim")
        name = name.replacingOccurrences(of: "Parashat Ki Teitzei", with: "Parashat Ki Teitzei")
        name = name.replacingOccurrences(of: "Parashat Ha'Azinu", with: "Parashat Haazinu")
        name = name.replacingOccurrences(of: "Parashat Vezot Haberakhah", with: "Parashat V'zot Hab'rachah")
        name = name.replacingOccurrences(of: "Parashat Vayakhel-Pekudei", with: "Parashat Vayak’heil/P’kudei")
        name = name.replacingOccurrences(of: "Parashat Tazria-Metzora", with: "Parashat Tazria/M'tzora")
        name = name.replacingOccurrences(of: "Parashat Achrei Mot-Kedoshim", with: "Parashat Acharei Mot/K'doshim")
        name = name.replacingOccurrences(of: "Parashat Behar-Bechukotai", with: "Parashat B'har/B'chukotai")
        name = name.replacingOccurrences(of: "Parashat Chukat-Balak", with: "Parashat Chukat/Balak")
        name = name.replacingOccurrences(of: "Parashat Matot-Masei", with: "Parashat Matot/Mas-ei")
        name = name.replacingOccurrences(of: "Parashat Nitzavim-Vayeilech", with: "Parashat Nitzavim/Vayeilech")
        name = name.replacingOccurrences(of: "Erev Pesach", with: "Erev Pesach/Ta’anit Bechorot")
        name = name.replacingOccurrences(of: "Shabbat Shekalim", with: "Shabbat Sh'kalim")
        name = name.replacingOccurrences(of: "Tu BiShvat", with: "Tu B'Sh'vat")
        name = name.replacingOccurrences(of: "Tzom Tammuz", with: "Shiva Asar b'Tammuz")
        name = name.replacingOccurrences(of: "Tish'a B'Av", with: "Tisha B'Av")
        name = name.replacingOccurrences(of: "Erev Tisha B\'Av", with: "Erev Tisha b'Av")
        name = name.replacingOccurrences(of: "Erev Rosh Hashana", with: "Erev Rosh Hashanah Weekday")
        //name = name.replacingOccurrences(of: "Rosh Hashana", with: "Rosh Hashanah 1")
        //name = name.replacingOccurrences(of: "Rosh Hashana II", with: "Rosh Hashanah 2")
        name = name.replacingOccurrences(of: "Yom HaShoah", with: "Yom HaShoah V'hag'vurah")
        name = name.replacingOccurrences(of: "Yom HaAtzma'ut", with: "Yom Ha'atzma'ut")
        name = name.replacingOccurrences(of: "Lag BaOmer", with: "Lag Ba'Omer")
        name = name.replacingOccurrences(of: "Shmini Atzeret", with: "Sh'mini Atzeret/Simchat Torah")
        name = name.replacingOccurrences(of: "Sukkot II (CH''M)", with: "Sukkot 2 Weekday")
        name = name.replacingOccurrences(of: "Sukkot III (CH''M)", with: "Sukkot 3 Weekday")
        name = name.replacingOccurrences(of: "Sukkot IV (CH''M)", with: "Sukkot 4 Weekday")
        name = name.replacingOccurrences(of: "Sukkot V (CH''M)", with: "Sukkot 5 Weekday")
        name = name.replacingOccurrences(of: "Sukkot VI (CH''M)", with: "Sukkot 6 Weekday")
        name = name.replacingOccurrences(of: "Sukkot VII (Hoshana Raba)", with: "Hoshana Raba")
        name = name.replacingOccurrences(of: "Pesach Sheni", with: "Pesach Sheini")
        name = name.replacingOccurrences(of: "Pesach II (CH''M)", with: "Pesach Chol Hamoed Day 1")
        name = name.replacingOccurrences(of: "Pesach III (CH''M)", with: "Pesach Chol Hamoed Day 2")
        name = name.replacingOccurrences(of: "Pesach IV (CH''M)", with: "Pesach Chol Hamoed Day 3")
        name = name.replacingOccurrences(of: "Pesach V (CH''M)", with: "Pesach Chol Hamoed Day 4")
        name = name.replacingOccurrences(of: "Pesach VI (CH''M)", with: "Pesach Chol HaMoed Day 5 Weekday")
        name = name.replacingOccurrences(of: "Chanukah: 1 Candle", with: "Erev Chanukah")
        name = name.replacingOccurrences(of: "Chanukah: 8th Day", with: "Chanukah 8 Weekday")
        return name
    }
}
