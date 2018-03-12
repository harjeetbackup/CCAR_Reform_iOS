//
//  String+Additions.swift
//  ReformLuach
//
//  Created by Mahadev Prabhu on 11/03/18.
//  Copyright © 2018 u-sss18. All rights reserved.
//

import Foundation

extension String {
    
    func html() -> String? {
        var name = self;
        name = name.spellChanged()
        name = name.removeSpecialChars()
        let url = Bundle.main.url(forResource: name, withExtension: "html");
        return url?.absoluteString
    }
    
    func spellChanged() -> String {
        var name = self;
        name = name.replacingOccurrences(of: "Chanukah: 8th Day", with: "Chanukah 8 Weekday")
        name = name.replacingOccurrences(of: "Parashat_Bereshit", with: "B'reishit")
        name = name.replacingOccurrences(of: "Lech-Lecha", with: "Lech L'cha")
        name = name.replacingOccurrences(of: "Vayera", with: "Vayeira")
        name = name.replacingOccurrences(of: "Toldot", with: "Tol'dot")
        name = name.replacingOccurrences(of: "Vayetzei", with: "Vayeitzei")
        name = name.replacingOccurrences(of: "Vayeshev", with: "Vayeishev")
        name = name.replacingOccurrences(of: "Miketz", with: "Mikeitz")
        name = name.replacingOccurrences(of: "Vayechi", with: "Va-y'chi")
        name = name.replacingOccurrences(of: "Shemot", with: "Sh'mot")
        name = name.replacingOccurrences(of: "Vaera", with: "Va-eira")
        name = name.replacingOccurrences(of: "Beshalach", with: "B'shalach")
        name = name.replacingOccurrences(of: "Terumah", with: "T'rumah")
        name = name.replacingOccurrences(of: "Tetzaveh", with: "T'tzaveh")
        name = name.replacingOccurrences(of: "Vayakhel", with: "Vayak'heil")
        name = name.replacingOccurrences(of: "Pekudei", with: "P'kudei")
        name = name.replacingOccurrences(of: "Shmini", with: "Sh'mini")
        name = name.replacingOccurrences(of: "Metzora", with: "M'tzora")
        name = name.replacingOccurrences(of: "Achrei Mot", with: "Acharei Mot")
        name = name.replacingOccurrences(of: "Kedoshim", with: "K'doshim")
        name = name.replacingOccurrences(of: "Behar", with: "B'har")
        name = name.replacingOccurrences(of: "Bechukotai", with: "B'chukotai")
        name = name.replacingOccurrences(of: "Bamidbar", with: "B'midbar")
        name = name.replacingOccurrences(of: "Nasso", with: "Naso")
        name = name.replacingOccurrences(of: "Beha'alotcha", with: "B'ha'alot'cha")
        name = name.replacingOccurrences(of: "Sh'lach", with: "Sh'lach L'cha")
        name = name.replacingOccurrences(of: "Masei", with: "Mas'ei")
        name = name.replacingOccurrences(of: "Devarim", with: "Shabbat D'varim, Shabbat Chazon")
        name = name.replacingOccurrences(of: "Vaetchanan", with: "Shabbat V'etchanan/Nachamu")
        name = name.replacingOccurrences(of: "Ki Teitzei", with: "Ki Teitze")
        name = name.replacingOccurrences(of: "Nitzavim", with: "N'tzavim")
        name = name.replacingOccurrences(of: "Ha'Azinu", with: "Ha'azinu")
        name = name.replacingOccurrences(of: "Vayakhel-Pekudei", with: "Vayakheil/P'kudei")
        name = name.replacingOccurrences(of: "Tazria-Metzora", with: "Tazria/M'tzora")
        name = name.replacingOccurrences(of: "Achrei Mot-Kedoshim", with: "Acharei Mot/K'doshim")
        name = name.replacingOccurrences(of: "Behar-Bechukotai", with: "B'har/B'chukotai")
        name = name.replacingOccurrences(of: "Chukat-Balak", with: "Chukat/Balak")
        name = name.replacingOccurrences(of: "Matot-Masei", with: "Matot/Mas'ei")
        name = name.replacingOccurrences(of: "Nitzavim-Vayeilech", with: "N'tzavim Vayeilech")
        name = name.replacingOccurrences(of: "Erev Rosh Hashana", with: "Erev Rosh Hashanah Friday")
        name = name.replacingOccurrences(of: "Erev Sukkot", with: "Erev Sukkot Friday")
        name = name.replacingOccurrences(of: "Erev Pesach", with: "Erev Pesach/Ta'anit Bechorot Friday")
        name = name.replacingOccurrences(of: "Erev Shavuot", with: "Erev Shavuot Friday")
        name = name.replacingOccurrences(of: "Erev Yom Kippur", with: "Erev Yom Kippur Friday")
        name = name.replacingOccurrences(of: "Pesach VI (CH''M)", with: "Pesach Chol HaMoed Day 5 Friday")
        name = name.replacingOccurrences(of: "Shabbat Shekalim", with: "Shabbat Sh'kalim")
        name = name.replacingOccurrences(of: "Tu BiShvat", with: "Tu B'Sh'vat")
        name = name.replacingOccurrences(of: "Tzom Tammuz", with: "Shiva Asar b'Tammuz")
        name = name.replacingOccurrences(of: "Tish'a B'Av", with: "Tisha B'Av")
        name = name.replacingOccurrences(of: "Erev Tish'a B'Av", with: "Erev Tisha b'Av")
        name = name.replacingOccurrences(of: "Erev Rosh Hashana", with: "Erev Rosh Hashanah Weekday")
        name = name.replacingOccurrences(of: "Rosh Hashana", with: "Rosh Hashanah 1")
        name = name.replacingOccurrences(of: "Rosh Hashana II", with: "Rosh Hashanah 2")
        name = name.replacingOccurrences(of: "Yom HaShoah", with: "Yom HaShoah V'hag'vurah")
        name = name.replacingOccurrences(of: "Yom HaAtzma'ut", with: "Yom Ha'atzma'ut")
        name = name.replacingOccurrences(of: "Lag B'Omer", with: "Lag Ba'Omer")
        name = name.replacingOccurrences(of: "Erev Pesach", with: "Erev Pesach/Ta’anit Bechorot")
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
        return name
    }
    
    func removeSpecialChars() -> String {
        var name = self;
        name = name.replacingOccurrences(of: ":", with: "")
        name = name.replacingOccurrences(of: "/", with: "-")
        name = name.replacingOccurrences(of: " ", with: "_")
        return name
    }
}
