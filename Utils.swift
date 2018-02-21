//
//  Utils.swift
//  Foreera
//
//  Created by Admin on 12/25/17.
//  Copyright © 2017 Foreera. All rights reserved.
//

import UIKit

class Utils {
    
    static let shared = Utils()
    
    static func getMainNVC() -> UIViewController {
        
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutVC") as! AboutVC
    }
    
    static func getSettingVC() -> SettingVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
    }
    
    static func getUrl(eventType: String, eventName: String) -> URL? {
        
        if eventType == "HOLIDAYS" {
            return Utils.urlForHolidays(eventName: eventName)
        }
        
        if eventType == "ALL" {
            return Utils.urlForAll(eventName: eventName)
        }
        
        if eventType == "PARSHIYOT" {
            
            if eventName.range(of:"Mot") != nil || eventName.range(of:"Acharei") != nil || eventName.range(of:"Acharei_Mot") != nil
            {
                 return Bundle.main.url(forResource: "Acharei_Mot", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Behar-Bechukotai") != nil
            {
                 return Bundle.main.url(forResource: "B'chukotai", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Beha'alotcha") != nil
            {
                 return Bundle.main.url(forResource: "B'haalot'cha", withExtension: "html");
                
            }
            else if eventName.range(of:"chukotai") != nil || eventName.range(of:"har") != nil
            {
                 return Bundle.main.url(forResource: "B'har-B'chukotai", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Behar-Bechukotai") != nil || eventName.range(of:"Parashat Behar") != nil
            {
                 return Bundle.main.url(forResource: "B'har", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Bamidbar") != nil
            {
                 return Bundle.main.url(forResource: "B'midbar", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Bereshit") != nil
            {
                 return Bundle.main.url(forResource: "B'reishit", withExtension: "html");
                
            }
                
            else if eventName.range(of:"Parashat Beshalach") != nil || eventName.range(of:"Beshalach") != nil
            {
                 return Bundle.main.url(forResource: "B'shalach", withExtension: "html");
                
            }
            else if eventName.range(of:"Balak") != nil
            {
                 return Bundle.main.url(forResource: "Balak", withExtension: "html");
                
            }
            else if eventName.range(of:"Bo") != nil
            {
                 return Bundle.main.url(forResource: "Bo", withExtension: "html");
                
            }
            else if eventName.range(of:"Chayei_Sara") != nil || eventName.range(of:"Sara") != nil || eventName.range(of:"Chayei") != nil
            {
                 return Bundle.main.url(forResource: "Chayei_Sara", withExtension: "html");
                
            }
            else if eventName.range(of:"Chukat-Balak") != nil
            {
                 return Bundle.main.url(forResource: "Chukat-Balak", withExtension: "html");
                
            }
            else if eventName.range(of:"Chukat") != nil
            {
                 return Bundle.main.url(forResource: "Chukat", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Devarim") != nil || eventName.range(of:"Devarim") != nil
            {
                 return Bundle.main.url(forResource: "D'varim", withExtension: "html");
                
            }
            else if eventName.range(of:"Eikev") != nil
            {
                 return Bundle.main.url(forResource: "Eikev", withExtension: "html");
                
            }
            else if eventName.range(of:"Emor") != nil || eventName.range(of:"Parashat Emor") != nil
            {
                 return Bundle.main.url(forResource: "Emor", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Ha'Azinu") != nil
            {
                 return Bundle.main.url(forResource: "Haazinu", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Kedoshim") != nil || eventName.range(of:"Kedoshim") != nil
            {
                 return Bundle.main.url(forResource: "K'doshim", withExtension: "html");
                
            }
            else if eventName.range(of:"Ki_Tavo") != nil || eventName.range(of:"Tavo") != nil
            {
                 return Bundle.main.url(forResource: "Ki_Tavo", withExtension: "html");
                
            }
            else if eventName.range(of:"Ki_Teitzei") != nil || eventName.range(of:"Teitzei") != nil
            {
                 return Bundle.main.url(forResource: "Ki_Teitzei", withExtension: "html");
                
            }
            else if eventName.range(of:"Ki_Tisa") != nil || eventName.range(of:"Tisa") != nil
            {
                 return Bundle.main.url(forResource: "Ki_Tisa", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Korach") != nil || eventName.range(of:"Korach") != nil
            {
                 return Bundle.main.url(forResource: "Korach", withExtension: "html");
                
            }
            else if eventName.range(of:"Lech_L'cha") != nil || eventName.range(of:"Lech") != nil || eventName.range(of:"cha") != nil
            {
                 return Bundle.main.url(forResource: "Lech_L'cha", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Tazria-Metzora") != nil
            {
                 return Bundle.main.url(forResource: "M'tzora", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Matot-Masei") != nil
            {
                 return Bundle.main.url(forResource: "Matot-Mas-ei", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Matot-Masei") != nil || eventName.range(of:"Matot-Masei") != nil
            {
                 return Bundle.main.url(forResource: "Mas-ei", withExtension: "html");
                
            }
            else if eventName.range(of:"Matot") != nil
            {
                 return Bundle.main.url(forResource: "Matot", withExtension: "html");
                
            }
            else if eventName.range(of:"Mikeitz-2") != nil
            {
                 return Bundle.main.url(forResource: "Mikeitz-2", withExtension: "html");
                
            }
            else if eventName.range(of:"Mikeitz") != nil || eventName.range(of:"Miketz") != nil
            {
                 return Bundle.main.url(forResource: "Mikeitz", withExtension: "html");
                
            }
            else if eventName.range(of:"Mishpatim") != nil
            {
                 return Bundle.main.url(forResource: "Mishpatim", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Nasso") != nil
            {
                 return Bundle.main.url(forResource: "Naso", withExtension: "html");
                
            }
            else if eventName.range(of:"Nitzavim-Vayeilech") != nil
            {
                 return Bundle.main.url(forResource: "Nitzavim-Vayeilech", withExtension: "html");
                
            }
            else if eventName.range(of:"Nitzavim") != nil
            {
                 return Bundle.main.url(forResource: "Nitzavim", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Noach") != nil
            {
                 return Bundle.main.url(forResource: "Noach", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Vayakhel-Pekudei") != nil || eventName.range(of:"Vayakhel-Pekudei") != nil
            {
                 return Bundle.main.url(forResource: "P'kudei", withExtension: "html");
                
            }
            else if eventName.range(of:"Pinchas") != nil
            {
                 return Bundle.main.url(forResource: "Pinchas", withExtension: "html");
                
            }
            else if eventName.range(of:"R'eih") != nil
            {
                 return Bundle.main.url(forResource: "R'eih", withExtension: "html");
                
            }
            else if eventName.range(of:"Sh'lach") != nil
            {
                 return Bundle.main.url(forResource: "Sh'lach_L'cha", withExtension: "html");
                
            }
            else if eventName.range(of:"Sh'mini") != nil
            {
                 return Bundle.main.url(forResource: "Sh'mini", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Shmini II") != nil
            {
                 return Bundle.main.url(forResource: "Sh'mini_II", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Shmini I") != nil
            {
                 return Bundle.main.url(forResource: "Sh'mini_I", withExtension: "html");
                
            }
                
            else if eventName.range(of:"Shemot") != nil
            {
                 return Bundle.main.url(forResource: "Sh'mot", withExtension: "html");
                
            }
            else if eventName.range(of:"Shoftim") != nil
            {
                 return Bundle.main.url(forResource: "Shof'tim", withExtension: "html");
                
            }
            else if eventName.range(of:"Terumah") != nil
            {
                 return Bundle.main.url(forResource: "T'rumah", withExtension: "html");
                
            }
            else if eventName.range(of:"Tetzaveh") != nil
            {
                 return Bundle.main.url(forResource: "T'tzaveh", withExtension: "html");
                
            }
            else if eventName.range(of:"Tazria-M'tzora") != nil
            {
                 return Bundle.main.url(forResource: "Tazria-M'tzora", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Tazria-Metzora") != nil
            {
                 return Bundle.main.url(forResource: "Tazria", withExtension: "html");
                
            }
            else if eventName.range(of:"Toldot") != nil
            {
                 return Bundle.main.url(forResource: "Tol'dot", withExtension: "html");
                
            }
            else if eventName.range(of:"Tzav") != nil
            {
                 return Bundle.main.url(forResource: "Tzav", withExtension: "html");
                
            }
            else if eventName.range(of:"rachah") != nil
            {
                 return Bundle.main.url(forResource: "V'zot_Hab'rachah", withExtension: "html");
                
            }
            else if eventName.range(of:"Vaera") != nil
            {
                 return Bundle.main.url(forResource: "Va-eira", withExtension: "html");
                
            }
            else if eventName.range(of:"Vaetchanan") != nil
            {
                 return Bundle.main.url(forResource: "Va-et'chanan", withExtension: "html");
                
            }
            else if eventName.range(of:"Vayechi") != nil
            {
                 return Bundle.main.url(forResource: "Va-y'chi", withExtension: "html");
                
            }
            else if eventName.range(of:"Vayakhel") != nil
            {
                 return Bundle.main.url(forResource: "Vayak'heil", withExtension: "html");
                
            }
            else if eventName.range(of:"Vayak’heil-P’kudei") != nil
            {
                 return Bundle.main.url(forResource: "Vayak’heil-P’kudei", withExtension: "html");
                
            }
            else if eventName.range(of:"Vayeilech") != nil
            {
                 return Bundle.main.url(forResource: "Vayeilech", withExtension: "html");
                
            }
            else if eventName.range(of:"Vayeira") != nil
            {
                 return Bundle.main.url(forResource: "Vayeira", withExtension: "html");
                
            }
            else if eventName.range(of:"Vayera") != nil||eventName.range(of:"Vayeira") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayeira", withExtension: "html");
                
            }
            else if eventName.range(of:"Vayeishev") != nil || eventName.range(of:"Vayeshev") != nil
            {
                 return Bundle.main.url(forResource: "Vayeishev", withExtension: "html");
                
            }
            else if eventName.range(of:"Vayeitzei") != nil || eventName.range(of:"Vayetzei") != nil
            {
                 return Bundle.main.url(forResource: "Vayeitzei", withExtension: "html");
                
            }
            else if eventName.range(of:"Vayigash") != nil
            {
                 return Bundle.main.url(forResource: "Vayigash", withExtension: "html");
                
            }
            else if eventName.range(of:"Vayikra") != nil
            {
                 return Bundle.main.url(forResource: "Vayikra", withExtension: "html");
                
            }
            else if eventName.range(of:"Vayishlach") != nil
            {
                 return Bundle.main.url(forResource: "Vayishlach", withExtension: "html");
                
            }
            else if eventName.range(of:"Parashat Re'eh") != nil||eventName.range(of:"Re'eh") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Re'eh", withExtension: "html");
                
            }

            return Bundle.main.url(forResource: "Yitro", withExtension: "html");
        }
        
        return nil
    }
    
    static func urlForHolidays(eventName: String) -> URL? {

            if eventName.range(of:"Asara B'Tevet") != nil
            {
                 return Bundle.main.url(forResource: "Asara_B'Tevet", withExtension: "html");
 
            }
            else if eventName.range(of:"Aseret Y'mei T'shuva") != nil
            {
                 return Bundle.main.url(forResource: "Aseret_Y'mei_T'shuva", withExtension: "html");
 
            }
            else if eventName.range(of:"B'dikat and Biur Chametz") != nil
            {
                 return Bundle.main.url(forResource: "B'dikat_and_Biur_Chametz", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Chanukah") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_1_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Chanukah: 2 Candles") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_2_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Chanukah: 3 Candles") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_3_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Chanukah: 4 Candles") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_4_Weekday", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Chanukah: 5 Candles") != nil||eventName.range(of:"Erev_Rosh_Chodesh") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Chanukah_5_Weekday_Erev_Rosh_Chodesh _Tevet", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Chanukah: 5 Candles") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_5_Weekday", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Chanukah: 6 Candles") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Chanukah_6_Weekday_Erev_Rosh_Chodesh _Tevet", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
                //            else if eventName.range(of:"Chanukah_6_Weekday") != nil||eventName.range(of:"Rosh_Chodesh") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Chanukah_6_Weekday_Rosh_Chodesh _Tevet_1", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Chanukah: 6 Candles") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_6_Weekday", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Chanukah_7_Weekday") != nil||eventName.range(of:"Rosh_Chodesh ") != nil
                //
                //            {
                //                 return Bundle.main.url(forResource: "Chanukah_7_Weekday_Rosh_Chodesh _Tevet_1", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Chanukah: 7 Candles") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_7_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Chanukah 8 Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_8_Weekday_Rosh_Chodesh _Tevet_1", withExtension: "html");
 
            }
            else if eventName.range(of:"Chanukah: 8 Candles") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_8_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Counting the Omer") != nil
            {
                 return Bundle.main.url(forResource: "Counting_the_Omer", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Chanukah") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Chanukah", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Erev Pesach") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Pesach-Ta'anit_Bechorot", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Pesach/Ta'anit Bechorot Friday") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Pesach-Ta'anit_Bechorot_Friday", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Purim") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Purim", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Erev_Rosh") != nil||eventName.range(of:"Chodesh_Friday") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Erev_Rosh_Chodesh_Friday", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
                //            else if eventName.range(of:"Erev_Rosh") != nil||eventName.range(of:"Chodesh_Weekday") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Erev_Rosh_Chodesh_Weekday", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Erev Rosh Hashanah Friday") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Rosh_Hashanah_Friday", withExtension: "html");
 
            }
            else if eventName.range(of:"Rosh Hashana 5778") != nil||eventName.range(of:"Hashanah_Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Rosh_Hashanah_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Sh'mini Atzeret-Erev Simchat_Torah") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Sh'mini_Atzeret-Erev_Simchat_Torah_Friday", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Sh'mini Atzeret-Simchat Torah") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Sh'mini_Atzeret-Simchat_Torah", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Shavuot Friday") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Shavuot_Friday", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Shavuot") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Shavuot", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Tisha b'Av") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Tisha_b'Av", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Yom Kippur Friday") != nil
                
            {
                 return Bundle.main.url(forResource: "Erev_Yom_Kippur", withExtension: "html");
 
            }
            else if eventName.range(of:"Hoshana Raba") != nil
            {
                 return Bundle.main.url(forResource: "Hoshana_Raba", withExtension: "html");
 
            }
            else if eventName.range(of:"Lag BaOmer") != nil
            {
                 return Bundle.main.url(forResource: "Lag_Ba'Omer", withExtension: "html");
 
            }
            else if eventName.range(of:"Leil Selichot") != nil
            {
                 return Bundle.main.url(forResource: "Leil_Selichot", withExtension: "html");
 
            }
            else if eventName.range(of:"Machar Chodesh") != nil
            {
                 return Bundle.main.url(forResource: "Machar_Chodesh", withExtension: "html");
 
            }
            else  if eventName.range(of:"Pesach Chol Hamoed Day 2") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_2", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach Chol Hamoed Day 1") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_1", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Pesach Chol Hamoed Day 3") != nil
                
            {
                 return Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_3", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach I") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Day_1_Shabbat", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach Chol Hamoed Day 4") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_4", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach Chol HaMoed Day 5 Friday") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_5_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach_Day_1") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Day_1_Shabbat", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach VIII") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Day_1_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach_Day_7") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Day_7_Shabbat", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach VII") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Day_7", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach Sheini") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Sheini", withExtension: "html");
 
            }
            else if eventName.range(of:"Purim Katan") != nil||eventName.range(of:"Katan") != nil
            {
                 return Bundle.main.url(forResource: "Purim_Katan", withExtension: "html");
 
            }
            else if eventName.range(of:"Purim") != nil
            {
                 return Bundle.main.url(forResource: "Purim", withExtension: "html");
 
            }
            else if eventName.range(of:"Rosh Hashana I") != nil
            {
                 return Bundle.main.url(forResource: "Rosh_Hashanah_1", withExtension: "html");
 
            }
            else if eventName.range(of:"Rosh Hashanah 2") != nil
            {
                 return Bundle.main.url(forResource: "Rosh_Hashanah_2", withExtension: "html");
 
            }
            else if eventName.range(of:"Sh'mini Atzeret-Simchat Torah") != nil
            {
                 return Bundle.main.url(forResource: "Sh'mini_Atzeret-Simchat_Torah", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Acharei Mot-K'doshim") != nil||eventName.range(of:"Acharei") != nil||eventName.range(of:"K'doshim") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Acharei_Mot-K'doshim", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Acharei_Mot") != nil||eventName.range(of:"Acharei Mot") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Acharei_Mot", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat B'chukotai") != nil||eventName.range(of:"chukotai") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_B'chukotai", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Tisha B'Av") != nil
                
            {
                 return Bundle.main.url(forResource: "Tisha_B'Av", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Yom Yerushalayim") != nil
            {
                 return Bundle.main.url(forResource: "Yom_Yerushalayim", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Yom HaShoah V'hag'vurah") != nil
            {
                 return Bundle.main.url(forResource: "Yom_HaShoah_V'hag'vurah", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Shabbat B'ha'alot'cha") != nil||eventName.range(of:"ha") != nil||eventName.range(of:"alot") != nil||eventName.range(of:"cha") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_B'ha'alot'cha", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat B'har-B'chukotai") != nil || eventName.range(of:"chukotai") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_B'har-B'chukotai", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat B'har") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_B'har", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat B'reishit") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_B'reishit", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat B'shalach-Shabbat Shirah") != nil||eventName.range(of:"shalach-Shabbat_Shirah") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_B'shalach-Shabbat_Shirah", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Balak") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Balak", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Bamidbar") != nil||eventName.range(of:"Bamidbar") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Bamidbar", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Bo") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Bo", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Chanukah Rosh Chodesh") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Chanukah_Rosh_Chodesh", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Chanukah") != nil||eventName.range(of:"Chanukah") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Chanukah", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Chayei Sara") != nil||eventName.range(of:"Chayei Sara") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Chayei_Sara", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Chol HaMoed Pesach") != nil||eventName.range(of:"HaMoed Pesach") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Chol_HaMoed_Pesach", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Chol Hamoed Sukkot") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Chol_Hamoed_Sukkot_Friday", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Parashat Chukat") != nil||eventName.range(of:"Chukat") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Chukat-Balak", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Chukat") != nil||eventName.range(of:"Chukat") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Chukat", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat D'varim-Shabbat Chazon") != nil||eventName.range(of:"varim") != nil||eventName.range(of:"Shabbat_Chazon") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_D'varim-Shabbat_Chazon", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Eikev") != nil||eventName.range(of:"Eikev") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Eikev", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Emor") != nil||eventName.range(of:"Emor") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Emor", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Ha'azinu-Shabbat Shuva") != nil||eventName.range(of:"Shabbat_Shuva") != nil||eventName.range(of:"azinu") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Ha'azinu-Shabbat_Shuva", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Ha'azinu") != nil||eventName.range(of:"azinu") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Ha'azinu", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat HaChodesh") != nil||eventName.range(of:"HaChodesh") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_HaChodesh", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat HaGadol") != nil||eventName.range(of:"HaGadol") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_HaGadol", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat K'doshim") != nil||eventName.range(of:"doshim") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_K'doshim", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Ki Tavo") != nil||eventName.range(of:"Ki_Tavo") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Ki_Tavo", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Ki Teitze") != nil||eventName.range(of:"Teitze") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Ki_Teitze", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Ki Tisa") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Ki_Tisa", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Korach") != nil||eventName.range(of:"Korach") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Korach", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Lech L'cha") != nil||eventName.range(of:"Lech_L'cha") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Lech_L'cha", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat M'tzora") != nil||eventName.range(of:"M'tzora") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_M'tzora", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat M'varchim") != nil||eventName.range(of:"varchim") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_M'varchim", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Mas'ei") != nil||eventName.range(of:"Mas'ei") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Mas'ei", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Matot-Mas'ei") != nil||eventName.range(of:"Matot Mas'ei") != nil
                
            {
                 return Bundle.main.url(forResource: "Shabbat_Matot-Mas'ei", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Matot") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Matot", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Mishpatim") != nil||eventName.range(of:"Mishpatim") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Mishpatim", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat N'tzavim Vayeilech") != nil||eventName.range(of:"tzavim_Vayeilech") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_N'tzavim_Vayeilech", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat N'tzavim") != nil||eventName.range(of:"N'tzavim") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_N'tzavim", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Naso") != nil||eventName.range(of:"Naso") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Naso", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Noach") != nil||eventName.range(of:"Noach") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Noach", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat P'kudei") != nil||eventName.range(of:"kudei") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_P'kudei", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Parah") != nil||eventName.range(of:"Parah") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Parah", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Pinchas") != nil||eventName.range(of:"Pinchas") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Pinchas", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Re'eh") != nil||eventName.range(of:"Re'eh") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Re'eh", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Rosh Chodesh I") != nil||eventName.range(of:"Rosh") != nil||eventName.range(of:"Chodesh_I") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Rosh_Chodesh_I", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Shabbat_Rosh") != nil||eventName.range(of:"Chodesh_II") != nil||eventName.range(of:"Day_Rosh_Chodesh") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Shabbat_Rosh_Chodesh_II_or_One_Day_Rosh_Chodesh", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Shabbat Sh'kalim") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Sh'kalim", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Shabbat") != nil||eventName.range(of:"lach_L") != nil||eventName.range(of:"cha") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Shabbat_Sh'lach_L'cha", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Shabbat Sh'mini") != nil||eventName.range(of:"mini") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Sh'mini", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Sh'mot") != nil||eventName.range(of:"mot") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Sh'mot", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Shoftim") != nil||eventName.range(of:"Shoftim") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Shoftim", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Trumah") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_T'rumah", withExtension: "html");
 
            }
            else if eventName.range(of:"tzaveh") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_T'tzaveh", withExtension: "html");
 
            }
            else if eventName.range(of:"tzora") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Tazria-M'tzora", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Tazria") != nil||eventName.range(of:"Tazria") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Tazria", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Toldot") != nil||eventName.range(of:" Toldot") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Toldot", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Tzav") != nil||eventName.range(of:"Tzav") != nil
                
            {
                 return Bundle.main.url(forResource: "Shabbat_Tzav", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat V'etchanan-Nachamu") != nil||eventName.range(of:"etchanan-Nachamu") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_V'etchanan-Nachamu", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Va'eira") != nil||eventName.range(of:"eira") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Va'eira", withExtension: "html");
 
            }
            else if eventName.range(of:"habbat Vay'chi") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vay'chi", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Shabbat") != nil||eventName.range(of:"Vayakheil-P") != nil||eventName.range(of:"kudei") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Shabbat_Vayakheil-P'kudei", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Shabbat Vayakheil") != nil||eventName.range(of:"Vayakheil") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayakheil", withExtension: "html");
 
            }
                //            else if eventName.range(of:"habbat") != nil||eventName.range(of:"Shabbat_Shuva") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Shabbat_Vayeilech-Shabbat_Shuva", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Shabbat Vayeilech") != nil||eventName.range(of:"Vayeilech") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayeilech", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Vayeira") != nil||eventName.range(of:"Vayeira") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayeira", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Shabbat") != nil||eventName.range(of:"Chanukah_Day_2") != nil
                //
                //            {
                //                 return Bundle.main.url(forResource: "Shabbat_Vayeishev_on_Chanukah_Day_2", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Shabbat Vayeishev") != nil||eventName.range(of:"Vayeishev") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayeishev", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Vayeitzei") != nil||eventName.range(of:"Vayeitzei") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayeitzei", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Vayigash") != nil||eventName.range(of:"Vayigash") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayigash", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Vayikra") != nil||eventName.range(of:"Vayikra") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayikra", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Vayishlach") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayishlach", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Yitro") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Yitro", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Zachor") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Zachor", withExtension: "html");
 
            }
            else if eventName.range(of:"Shavuot Shabbat") != nil
            {
                 return Bundle.main.url(forResource: "Shavuot_Shabbat", withExtension: "html");
 
            }
            else if eventName.range(of:"Shavuot I") != nil
            {
                 return Bundle.main.url(forResource: "Shavuot", withExtension: "html");
 
            }
            else if eventName.range(of:"Shiva") != nil||eventName.range(of:"Tammuz") != nil
            {
                 return Bundle.main.url(forResource: "Shiva_Asar_b'Tammuz", withExtension: "html");
 
            }
            else if eventName.range(of:"Shushan") != nil||eventName.range(of:"Shushan Purim") != nil
            {
                 return Bundle.main.url(forResource: "Shushan_Purim", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot_1") != nil||eventName.range(of:"Shabbat") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_1_Shabbat", withExtension: "html");
 
            }
            else if eventName == "Sukkot I"
                //eventName.range(of:"Sukkot 1") != nil||eventName.range(of:"Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_1_Weekday", withExtension: "html");
 
            }
            else if eventName == "Sukkot 2 Weekday"
                //eventName.range(of:"Sukkot_2") != nil||eventName.range(of:"Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_2_Weekday", withExtension: "html");
 
            }
            else if eventName == "Sukkot 3 Weekday"
                //eventName.range(of:"Sukkot_3") != nil||eventName.range(of:"Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_3_Weekday", withExtension: "html");
 
            }
            else if eventName == "Sukkot 4 Weekday"
                //eventName.range(of:"Sukkot_4") != nil||eventName.range(of:"Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_4_Weekday", withExtension: "html");
 
            }
            else if eventName == "Sukkot 5 Weekday"
                //eventName.range(of:"Sukkot_5") != nil||eventName.range(of:"Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_5_Weekday", withExtension: "html");
 
            }
            else if eventName == "Sukkot 6 Weekday"
                //eventName.range(of:"Sukkot_6") != nil||eventName.range(of:"Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_6_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot") != nil||eventName.range(of:"Preparation") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_Preparation", withExtension: "html");
 
            }
            else if eventName.range(of:"Ta") != nil||eventName.range(of:"anit_Bechorot") != nil
            {
                 return Bundle.main.url(forResource: "Ta'anit_Bechorot-B'dikat_Chametz_Thursday", withExtension: "html");
 
            }
            else if eventName.range(of:"Ta") != nil||eventName.range(of:"anit_Esther") != nil
                
            {
                 return Bundle.main.url(forResource: "Ta'anit_Esther", withExtension: "html");
 
            }
            else if eventName.range(of:"Tisha b'Av") != nil
                
            {
                 return Bundle.main.url(forResource: "Tisha b'Av", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Tisha B'Av") != nil
                //
                //            {
                //                 return Bundle.main.url(forResource: "Tisha_B'Av", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Tu B'Av") != nil
            {
                 return Bundle.main.url(forResource: "Tu_B'Av", withExtension: "html");
 
            }
            else if eventName.range(of:"Tu B'Sh'vat") != nil||eventName.range(of:"BiShvat") != nil
            {
                 return Bundle.main.url(forResource: "Tu_B'Sh'vat", withExtension: "html");
 
            }
            else if eventName.range(of:"Tzom") != nil||eventName.range(of:"Gedaliah") != nil
            {
                 return Bundle.main.url(forResource: "Tzom_Gedaliah", withExtension: "html");
 
            }
            else if eventName.range(of:"Yom Ha'atzma'ut") != nil
            {
                 return Bundle.main.url(forResource: "Yom_Ha'atzma'ut", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Yom HaShoah V'hag'vurah") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Yom_HaShoah_V'hag'vurah", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Yom HaZikaron") != nil||eventName.range(of:"HaZikaron") != nil
            {
                 return Bundle.main.url(forResource: "Yom_HaZikaron", withExtension: "html");
 
            }
            else if eventName.range(of:"Yom Kippur Shabbat") != nil
                
            {
                 return Bundle.main.url(forResource: "Yom_Kippur_Shabbat", withExtension: "html");
 
            }
            else if eventName.range(of:"Yom Kippur") != nil
            {
                 return Bundle.main.url(forResource: "Yom_Kippur", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Yom Yerushalayim") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Yom_Yerushalayim", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Erev Sukkot Friday") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Sukkot", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot I") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_1_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot 2 Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_2_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot 3 Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_3_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot 4 Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_4_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot 5 Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_5_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot 6 Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_6_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Hoshana Raba") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_Preparation", withExtension: "html");
 
            }
            else if eventName == "Candle lighting"
            {
                 return Bundle.main.url(forResource: "Chanukah_Candlelighting", withExtension: "html");
 
            }
            else if eventName == "Rosh Chodesh Adar"{
                 return Bundle.main.url(forResource: "Rosh_Chodesh_Adar_I", withExtension: "html");
 
            }            else if eventName == "Rosh Chodesh Av"
            {
                 return Bundle.main.url(forResource: "Rosh_Chodesh_Av", withExtension: "html");
 
            }
            else if eventName == "Rosh Chodesh Elul"
            {
                 return Bundle.main.url(forResource: "Rosh_Chodesh_Elul", withExtension: "html");
 
            }
            else if eventName == "Rosh Chodesh Cheshvan" || eventName == "Erev Rosh Hashanah Weekday"
            {
                 return Bundle.main.url(forResource: "Rosh_Chodesh_I_Weekday", withExtension: "html");
            }
        

             return Bundle.main.url(forResource: "Rosh_Chodesh_II_or_One_Day_Rosh_Chodesh_Weekday", withExtension: "html");

    }
    
    static func urlForAll(eventName: String) -> URL? {
        
            if eventName.range(of:"Mot") != nil || eventName.range(of:"Acharei") != nil || eventName.range(of:"Acharei_Mot") != nil
            {
                 return Bundle.main.url(forResource: "Acharei_Mot", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Behar-Bechukotai") != nil
            {
                 return Bundle.main.url(forResource: "B'chukotai", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Beha'alotcha") != nil
            {
                 return Bundle.main.url(forResource: "B'haalot'cha", withExtension: "html");
 
            }
            else if eventName.range(of:"chukotai") != nil || eventName.range(of:"har") != nil
            {
                 return Bundle.main.url(forResource: "B'har-B'chukotai", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Behar-Bechukotai") != nil || eventName.range(of:"Parashat Behar") != nil
            {
                 return Bundle.main.url(forResource: "B'har", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Bamidbar") != nil
            {
                 return Bundle.main.url(forResource: "B'midbar", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Bereshit") != nil
            {
                 return Bundle.main.url(forResource: "B'reishit", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Parashat Beshalach") != nil || eventName.range(of:"Beshalach") != nil
            {
                 return Bundle.main.url(forResource: "B'shalach", withExtension: "html");
 
            }
            else if eventName.range(of:"Balak") != nil
            {
                 return Bundle.main.url(forResource: "Balak", withExtension: "html");
 
            }
            else if eventName.range(of:"Bo") != nil
            {
                 return Bundle.main.url(forResource: "Bo", withExtension: "html");
 
            }
            else if eventName.range(of:"Chayei_Sara") != nil || eventName.range(of:"Sara") != nil || eventName.range(of:"Chayei") != nil
            {
                 return Bundle.main.url(forResource: "Chayei_Sara", withExtension: "html");
 
            }
            else if eventName.range(of:"Chukat-Balak") != nil
            {
                 return Bundle.main.url(forResource: "Chukat-Balak", withExtension: "html");
 
            }
            else if eventName.range(of:"Chukat") != nil
            {
                 return Bundle.main.url(forResource: "Chukat", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Devarim") != nil || eventName.range(of:"Devarim") != nil
            {
                 return Bundle.main.url(forResource: "D'varim", withExtension: "html");
 
            }
            else if eventName.range(of:"Eikev") != nil
            {
                 return Bundle.main.url(forResource: "Eikev", withExtension: "html");
 
            }
            else if eventName.range(of:"Emor") != nil || eventName.range(of:"Parashat Emor") != nil
            {
                 return Bundle.main.url(forResource: "Emor", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Ha'Azinu") != nil
            {
                 return Bundle.main.url(forResource: "Haazinu", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Kedoshim") != nil || eventName.range(of:"Kedoshim") != nil
            {
                 return Bundle.main.url(forResource: "K'doshim", withExtension: "html");
 
            }
            else if eventName.range(of:"Ki_Tavo") != nil || eventName.range(of:"Tavo") != nil
            {
                 return Bundle.main.url(forResource: "Ki_Tavo", withExtension: "html");
 
            }
            else if eventName.range(of:"Ki_Teitzei") != nil || eventName.range(of:"Teitzei") != nil
            {
                 return Bundle.main.url(forResource: "Ki_Teitzei", withExtension: "html");
 
            }
            else if eventName.range(of:"Ki_Tisa") != nil || eventName.range(of:"Tisa") != nil
            {
                 return Bundle.main.url(forResource: "Ki_Tisa", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Korach") != nil || eventName.range(of:"Korach") != nil
            {
                 return Bundle.main.url(forResource: "Korach", withExtension: "html");
 
            }
            else if eventName.range(of:"Lech_L'cha") != nil || eventName.range(of:"Lech") != nil || eventName.range(of:"cha") != nil
            {
                 return Bundle.main.url(forResource: "Lech_L'cha", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Tazria-Metzora") != nil
            {
                 return Bundle.main.url(forResource: "M'tzora", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Matot-Masei") != nil
            {
                 return Bundle.main.url(forResource: "Matot-Mas-ei", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Matot-Masei") != nil || eventName.range(of:"Matot-Masei") != nil
            {
                 return Bundle.main.url(forResource: "Mas-ei", withExtension: "html");
 
            }
            else if eventName.range(of:"Matot") != nil
            {
                 return Bundle.main.url(forResource: "Matot", withExtension: "html");
 
            }
            else if eventName.range(of:"Mikeitz-2") != nil
            {
                 return Bundle.main.url(forResource: "Mikeitz-2", withExtension: "html");
 
            }
            else if eventName.range(of:"Mikeitz") != nil || eventName.range(of:"Miketz") != nil
            {
                 return Bundle.main.url(forResource: "Mikeitz", withExtension: "html");
 
            }
            else if eventName.range(of:"Mishpatim") != nil
            {
                 return Bundle.main.url(forResource: "Mishpatim", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Nasso") != nil
            {
                 return Bundle.main.url(forResource: "Naso", withExtension: "html");
 
            }
            else if eventName.range(of:"Nitzavim-Vayeilech") != nil
            {
                 return Bundle.main.url(forResource: "Nitzavim-Vayeilech", withExtension: "html");
 
            }
            else if eventName.range(of:"Nitzavim") != nil
            {
                 return Bundle.main.url(forResource: "Nitzavim", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Noach") != nil
            {
                 return Bundle.main.url(forResource: "Noach", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Vayakhel-Pekudei") != nil || eventName.range(of:"Vayakhel-Pekudei") != nil
            {
                 return Bundle.main.url(forResource: "P'kudei", withExtension: "html");
 
            }
            else if eventName.range(of:"Pinchas") != nil
            {
                 return Bundle.main.url(forResource: "Pinchas", withExtension: "html");
 
            }
            else if eventName.range(of:"R'eih") != nil
            {
                 return Bundle.main.url(forResource: "R'eih", withExtension: "html");
 
            }
            else if eventName.range(of:"Sh'lach") != nil
            {
                 return Bundle.main.url(forResource: "Sh'lach_L'cha", withExtension: "html");
 
            }
            else if eventName.range(of:"Sh'mini") != nil
            {
                 return Bundle.main.url(forResource: "Sh'mini", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Shmini II") != nil
            {
                 return Bundle.main.url(forResource: "Sh'mini_II", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Shmini I") != nil
            {
                 return Bundle.main.url(forResource: "Sh'mini_I", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Shemot") != nil
            {
                 return Bundle.main.url(forResource: "Sh'mot", withExtension: "html");
 
            }
            else if eventName.range(of:"Shoftim") != nil
            {
                 return Bundle.main.url(forResource: "Shof'tim", withExtension: "html");
 
            }
            else if eventName.range(of:"Terumah") != nil
            {
                 return Bundle.main.url(forResource: "T'rumah", withExtension: "html");
 
            }
            else if eventName.range(of:"Tetzaveh") != nil
            {
                 return Bundle.main.url(forResource: "T'tzaveh", withExtension: "html");
 
            }
            else if eventName.range(of:"Tazria-M'tzora") != nil
            {
                 return Bundle.main.url(forResource: "Tazria-M'tzora", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Tazria-Metzora") != nil
            {
                 return Bundle.main.url(forResource: "Tazria", withExtension: "html");
 
            }
            else if eventName.range(of:"Toldot") != nil
            {
                 return Bundle.main.url(forResource: "Tol'dot", withExtension: "html");
 
            }
            else if eventName.range(of:"Tzav") != nil
            {
                 return Bundle.main.url(forResource: "Tzav", withExtension: "html");
 
            }
            else if eventName.range(of:"rachah") != nil
            {
                 return Bundle.main.url(forResource: "V'zot_Hab'rachah", withExtension: "html");
 
            }
            else if eventName.range(of:"Vaera") != nil
            {
                 return Bundle.main.url(forResource: "Va-eira", withExtension: "html");
 
            }
            else if eventName.range(of:"Vaetchanan") != nil
            {
                 return Bundle.main.url(forResource: "Va-et'chanan", withExtension: "html");
 
            }
            else if eventName.range(of:"Vayechi") != nil
            {
                 return Bundle.main.url(forResource: "Va-y'chi", withExtension: "html");
 
            }
            else if eventName.range(of:"Vayakhel") != nil
            {
                 return Bundle.main.url(forResource: "Vayak'heil", withExtension: "html");
 
            }
            else if eventName.range(of:"Vayak’heil-P’kudei") != nil
            {
                 return Bundle.main.url(forResource: "Vayak’heil-P’kudei", withExtension: "html");
 
            }
            else if eventName.range(of:"Vayeilech") != nil
            {
                 return Bundle.main.url(forResource: "Vayeilech", withExtension: "html");
 
            }
            else if eventName.range(of:"Vayeira") != nil
            {
                 return Bundle.main.url(forResource: "Vayeira", withExtension: "html");
 
            }
            else if eventName.range(of:"Vayera") != nil||eventName.range(of:"Vayeira") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayeira", withExtension: "html");
 
            }
            else if eventName.range(of:"Vayeishev") != nil || eventName.range(of:"Vayeshev") != nil
            {
                 return Bundle.main.url(forResource: "Vayeishev", withExtension: "html");
 
            }
            else if eventName.range(of:"Vayeitzei") != nil || eventName.range(of:"Vayetzei") != nil
            {
                 return Bundle.main.url(forResource: "Vayeitzei", withExtension: "html");
 
            }
            else if eventName.range(of:"Vayigash") != nil
            {
                 return Bundle.main.url(forResource: "Vayigash", withExtension: "html");
 
            }
            else if eventName.range(of:"Vayikra") != nil
            {
                 return Bundle.main.url(forResource: "Vayikra", withExtension: "html");
 
            }
            else if eventName.range(of:"Vayishlach") != nil
            {
                 return Bundle.main.url(forResource: "Vayishlach", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Re'eh") != nil||eventName.range(of:"Re'eh") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Re'eh", withExtension: "html");
 
            }
                //                else //eventName.range(of:"Yitro") != nil
                //                {
                //                     return Bundle.main.url(forResource: "Yitro", withExtension: "html");
                //                    let myRequest = NSURLRequest(url: localfilePath!);
                //                    eventDetails.loadRequest(myRequest as URLRequest);
                //                }
                //
                
                ///////////////////////////////////////////////////////////////////
                
            else if eventName.range(of:"Asara B'Tevet") != nil
            {
                 return Bundle.main.url(forResource: "Asara_B'Tevet", withExtension: "html");
 
            }
            else if eventName.range(of:"Aseret Y'mei T'shuva") != nil
            {
                 return Bundle.main.url(forResource: "Aseret_Y'mei_T'shuva", withExtension: "html");
 
            }
            else if eventName.range(of:"B'dikat and Biur Chametz") != nil
            {
                 return Bundle.main.url(forResource: "B'dikat_and_Biur_Chametz", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Chanukah") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_1_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Chanukah: 2 Candles") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_2_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Chanukah: 3 Candles") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_3_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Chanukah: 4 Candles") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_4_Weekday", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Chanukah: 5 Candles") != nil||eventName.range(of:"Erev_Rosh_Chodesh") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Chanukah_5_Weekday_Erev_Rosh_Chodesh _Tevet", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Chanukah: 5 Candles") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_5_Weekday", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Chanukah: 6 Candles") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Chanukah_6_Weekday_Erev_Rosh_Chodesh _Tevet", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
                //            else if eventName.range(of:"Chanukah_6_Weekday") != nil||eventName.range(of:"Rosh_Chodesh") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Chanukah_6_Weekday_Rosh_Chodesh _Tevet_1", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Chanukah: 6 Candles") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_6_Weekday", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Chanukah_7_Weekday") != nil||eventName.range(of:"Rosh_Chodesh ") != nil
                //
                //            {
                //                 return Bundle.main.url(forResource: "Chanukah_7_Weekday_Rosh_Chodesh _Tevet_1", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Chanukah: 7 Candles") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_7_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Chanukah 8 Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_8_Weekday_Rosh_Chodesh _Tevet_1", withExtension: "html");
 
            }
            else if eventName.range(of:"Chanukah: 8 Candles") != nil
            {
                 return Bundle.main.url(forResource: "Chanukah_8_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Counting the Omer") != nil
            {
                 return Bundle.main.url(forResource: "Counting_the_Omer", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Chanukah") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Chanukah", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Erev Pesach") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Pesach-Ta'anit_Bechorot", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Pesach/Ta'anit Bechorot Friday") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Pesach-Ta'anit_Bechorot_Friday", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Purim") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Purim", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Erev_Rosh") != nil||eventName.range(of:"Chodesh_Friday") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Erev_Rosh_Chodesh_Friday", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
                //            else if eventName.range(of:"Erev_Rosh") != nil||eventName.range(of:"Chodesh_Weekday") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Erev_Rosh_Chodesh_Weekday", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Erev Rosh Hashanah Friday") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Rosh_Hashanah_Friday", withExtension: "html");
 
            }
            else if eventName.range(of:"Rosh Hashana 5778") != nil||eventName.range(of:"Hashanah_Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Rosh_Hashanah_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Sh'mini Atzeret-Erev Simchat_Torah") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Sh'mini_Atzeret-Erev_Simchat_Torah_Friday", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Sh'mini Atzeret-Simchat Torah") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Sh'mini_Atzeret-Simchat_Torah", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Shavuot Friday") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Shavuot_Friday", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Shavuot") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Shavuot", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Tisha b'Av") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Tisha_b'Av", withExtension: "html");
 
            }
            else if eventName.range(of:"Erev Yom Kippur Friday") != nil
                
            {
                 return Bundle.main.url(forResource: "Erev_Yom_Kippur", withExtension: "html");
 
            }
            else if eventName.range(of:"Hoshana Raba") != nil
            {
                 return Bundle.main.url(forResource: "Hoshana_Raba", withExtension: "html");
 
            }
            else if eventName.range(of:"Lag BaOmer") != nil
            {
                 return Bundle.main.url(forResource: "Lag_Ba'Omer", withExtension: "html");
 
            }
            else if eventName.range(of:"Leil Selichot") != nil
            {
                 return Bundle.main.url(forResource: "Leil_Selichot", withExtension: "html");
 
            }
            else if eventName.range(of:"Machar Chodesh") != nil
            {
                 return Bundle.main.url(forResource: "Machar_Chodesh", withExtension: "html");
 
            }
            else  if eventName.range(of:"Pesach Chol Hamoed Day 2") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_2", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach Chol Hamoed Day 1") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_1", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Pesach Chol Hamoed Day 3") != nil
                
            {
                 return Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_3", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach I") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Day_1_Shabbat", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach Chol Hamoed Day 4") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_4", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach Chol HaMoed Day 5 Friday") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_5_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach_Day_1") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Day_1_Shabbat", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach VIII") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Day_1_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach_Day_7") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Day_7_Shabbat", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach VII") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Day_7", withExtension: "html");
 
            }
            else if eventName.range(of:"Pesach Sheini") != nil
            {
                 return Bundle.main.url(forResource: "Pesach_Sheini", withExtension: "html");
 
            }
            else if eventName.range(of:"Purim Katan") != nil||eventName.range(of:"Katan") != nil
            {
                 return Bundle.main.url(forResource: "Purim_Katan", withExtension: "html");
 
            }
            else if eventName.range(of:"Purim") != nil
            {
                 return Bundle.main.url(forResource: "Purim", withExtension: "html");
 
            }
            else if eventName.range(of:"Rosh Hashana I") != nil
            {
                 return Bundle.main.url(forResource: "Rosh_Hashanah_1", withExtension: "html");
 
            }
            else if eventName.range(of:"Rosh Hashanah 2") != nil
            {
                 return Bundle.main.url(forResource: "Rosh_Hashanah_2", withExtension: "html");
 
            }
            else if eventName.range(of:"Sh'mini Atzeret-Simchat Torah") != nil
            {
                 return Bundle.main.url(forResource: "Sh'mini_Atzeret-Simchat_Torah", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Acharei Mot-K'doshim") != nil||eventName.range(of:"Acharei") != nil||eventName.range(of:"K'doshim") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Acharei_Mot-K'doshim", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Acharei_Mot") != nil||eventName.range(of:"Acharei Mot") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Acharei_Mot", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat B'chukotai") != nil||eventName.range(of:"chukotai") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_B'chukotai", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Tisha B'Av") != nil
                
            {
                 return Bundle.main.url(forResource: "Tisha_B'Av", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Yom Yerushalayim") != nil
            {
                 return Bundle.main.url(forResource: "Yom_Yerushalayim", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Yom HaShoah V'hag'vurah") != nil
            {
                 return Bundle.main.url(forResource: "Yom_HaShoah_V'hag'vurah", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Shabbat B'ha'alot'cha") != nil||eventName.range(of:"ha") != nil||eventName.range(of:"alot") != nil||eventName.range(of:"cha") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_B'ha'alot'cha", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat B'har-B'chukotai") != nil || eventName.range(of:"chukotai") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_B'har-B'chukotai", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat B'har") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_B'har", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat B'reishit") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_B'reishit", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat B'shalach-Shabbat Shirah") != nil||eventName.range(of:"shalach-Shabbat_Shirah") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_B'shalach-Shabbat_Shirah", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Balak") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Balak", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Bamidbar") != nil||eventName.range(of:"Bamidbar") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Bamidbar", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Bo") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Bo", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Chanukah Rosh Chodesh") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Chanukah_Rosh_Chodesh", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Chanukah") != nil||eventName.range(of:"Chanukah") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Chanukah", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Chayei Sara") != nil||eventName.range(of:"Chayei Sara") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Chayei_Sara", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Chol HaMoed Pesach") != nil||eventName.range(of:"HaMoed Pesach") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Chol_HaMoed_Pesach", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Chol Hamoed Sukkot") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Chol_Hamoed_Sukkot_Friday", withExtension: "html");
 
            }
                
            else if eventName.range(of:"Parashat Chukat") != nil||eventName.range(of:"Chukat") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Chukat-Balak", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Chukat") != nil||eventName.range(of:"Chukat") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Chukat", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat D'varim-Shabbat Chazon") != nil||eventName.range(of:"varim") != nil||eventName.range(of:"Shabbat_Chazon") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_D'varim-Shabbat_Chazon", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Eikev") != nil||eventName.range(of:"Eikev") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Eikev", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Emor") != nil||eventName.range(of:"Emor") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Emor", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Ha'azinu-Shabbat Shuva") != nil||eventName.range(of:"Shabbat_Shuva") != nil||eventName.range(of:"azinu") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Ha'azinu-Shabbat_Shuva", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Ha'azinu") != nil||eventName.range(of:"azinu") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Ha'azinu", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat HaChodesh") != nil||eventName.range(of:"HaChodesh") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_HaChodesh", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat HaGadol") != nil||eventName.range(of:"HaGadol") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_HaGadol", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat K'doshim") != nil||eventName.range(of:"doshim") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_K'doshim", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Ki Tavo") != nil||eventName.range(of:"Ki_Tavo") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Ki_Tavo", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Ki Teitze") != nil||eventName.range(of:"Teitze") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Ki_Teitze", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Ki Tisa") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Ki_Tisa", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Korach") != nil||eventName.range(of:"Korach") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Korach", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Lech L'cha") != nil||eventName.range(of:"Lech_L'cha") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Lech_L'cha", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat M'tzora") != nil||eventName.range(of:"M'tzora") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_M'tzora", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat M'varchim") != nil||eventName.range(of:"varchim") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_M'varchim", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Mas'ei") != nil||eventName.range(of:"Mas'ei") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Mas'ei", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Matot-Mas'ei") != nil||eventName.range(of:"Matot Mas'ei") != nil
                
            {
                 return Bundle.main.url(forResource: "Shabbat_Matot-Mas'ei", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Matot") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Matot", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Mishpatim") != nil||eventName.range(of:"Mishpatim") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Mishpatim", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat N'tzavim Vayeilech") != nil||eventName.range(of:"tzavim_Vayeilech") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_N'tzavim_Vayeilech", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat N'tzavim") != nil||eventName.range(of:"N'tzavim") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_N'tzavim", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Naso") != nil||eventName.range(of:"Naso") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Naso", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Noach") != nil||eventName.range(of:"Noach") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Noach", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat P'kudei") != nil||eventName.range(of:"kudei") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_P'kudei", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Parah") != nil||eventName.range(of:"Parah") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Parah", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Pinchas") != nil||eventName.range(of:"Pinchas") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Pinchas", withExtension: "html");
 
            }
            else if eventName.range(of:"Parashat Re'eh") != nil||eventName.range(of:"Re'eh") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Re'eh", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Rosh Chodesh I") != nil||eventName.range(of:"Rosh") != nil||eventName.range(of:"Chodesh_I") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Rosh_Chodesh_I", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Shabbat_Rosh") != nil||eventName.range(of:"Chodesh_II") != nil||eventName.range(of:"Day_Rosh_Chodesh") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Shabbat_Rosh_Chodesh_II_or_One_Day_Rosh_Chodesh", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Shabbat Sh'kalim") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Sh'kalim", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Shabbat") != nil||eventName.range(of:"lach_L") != nil||eventName.range(of:"cha") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Shabbat_Sh'lach_L'cha", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Shabbat Sh'mini") != nil||eventName.range(of:"mini") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Sh'mini", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Sh'mot") != nil||eventName.range(of:"mot") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Sh'mot", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Shoftim") != nil||eventName.range(of:"Shoftim") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Shoftim", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Trumah") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_T'rumah", withExtension: "html");
 
            }
            else if eventName.range(of:"tzaveh") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_T'tzaveh", withExtension: "html");
 
            }
            else if eventName.range(of:"tzora") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Tazria-M'tzora", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Tazria") != nil||eventName.range(of:"Tazria") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Tazria", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Toldot") != nil||eventName.range(of:" Toldot") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Toldot", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Tzav") != nil||eventName.range(of:"Tzav") != nil
                
            {
                 return Bundle.main.url(forResource: "Shabbat_Tzav", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat V'etchanan-Nachamu") != nil||eventName.range(of:"etchanan-Nachamu") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_V'etchanan-Nachamu", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Va'eira") != nil||eventName.range(of:"eira") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Va'eira", withExtension: "html");
 
            }
            else if eventName.range(of:"habbat Vay'chi") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vay'chi", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Shabbat") != nil||eventName.range(of:"Vayakheil-P") != nil||eventName.range(of:"kudei") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Shabbat_Vayakheil-P'kudei", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Shabbat Vayakheil") != nil||eventName.range(of:"Vayakheil") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayakheil", withExtension: "html");
 
            }
                //            else if eventName.range(of:"habbat") != nil||eventName.range(of:"Shabbat_Shuva") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Shabbat_Vayeilech-Shabbat_Shuva", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Shabbat Vayeilech") != nil||eventName.range(of:"Vayeilech") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayeilech", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Vayeira") != nil||eventName.range(of:"Vayeira") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayeira", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Shabbat") != nil||eventName.range(of:"Chanukah_Day_2") != nil
                //
                //            {
                //                 return Bundle.main.url(forResource: "Shabbat_Vayeishev_on_Chanukah_Day_2", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Shabbat Vayeishev") != nil||eventName.range(of:"Vayeishev") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayeishev", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Vayeitzei") != nil||eventName.range(of:"Vayeitzei") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayeitzei", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Vayigash") != nil||eventName.range(of:"Vayigash") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayigash", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Vayikra") != nil||eventName.range(of:"Vayikra") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayikra", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Vayishlach") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Vayishlach", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Yitro") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Yitro", withExtension: "html");
 
            }
            else if eventName.range(of:"Shabbat Zachor") != nil
            {
                 return Bundle.main.url(forResource: "Shabbat_Zachor", withExtension: "html");
 
            }
            else if eventName.range(of:"Shavuot Shabbat") != nil
            {
                 return Bundle.main.url(forResource: "Shavuot_Shabbat", withExtension: "html");
 
            }
            else if eventName.range(of:"Shavuot I") != nil
            {
                 return Bundle.main.url(forResource: "Shavuot", withExtension: "html");
 
            }
            else if eventName.range(of:"Shiva") != nil||eventName.range(of:"Tammuz") != nil
            {
                 return Bundle.main.url(forResource: "Shiva_Asar_b'Tammuz", withExtension: "html");
 
            }
            else if eventName.range(of:"Shushan") != nil||eventName.range(of:"Shushan Purim") != nil
            {
                 return Bundle.main.url(forResource: "Shushan_Purim", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot_1") != nil||eventName.range(of:"Shabbat") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_1_Shabbat", withExtension: "html");
 
            }
            else if eventName == "Sukkot I"
                //eventName.range(of:"Sukkot 1") != nil||eventName.range(of:"Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_1_Weekday", withExtension: "html");
 
            }
            else if eventName == "Sukkot 2 Weekday"
                //eventName.range(of:"Sukkot_2") != nil||eventName.range(of:"Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_2_Weekday", withExtension: "html");
 
            }
            else if eventName == "Sukkot 3 Weekday"
                //eventName.range(of:"Sukkot_3") != nil||eventName.range(of:"Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_3_Weekday", withExtension: "html");
 
            }
            else if eventName == "Sukkot 4 Weekday"
                //eventName.range(of:"Sukkot_4") != nil||eventName.range(of:"Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_4_Weekday", withExtension: "html");
 
            }
            else if eventName == "Sukkot 5 Weekday"
                //eventName.range(of:"Sukkot_5") != nil||eventName.range(of:"Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_5_Weekday", withExtension: "html");
 
            }
            else if eventName == "Sukkot 6 Weekday"
                //eventName.range(of:"Sukkot_6") != nil||eventName.range(of:"Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_6_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot") != nil||eventName.range(of:"Preparation") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_Preparation", withExtension: "html");
 
            }
            else if eventName.range(of:"Ta") != nil||eventName.range(of:"anit_Bechorot") != nil
            {
                 return Bundle.main.url(forResource: "Ta'anit_Bechorot-B'dikat_Chametz_Thursday", withExtension: "html");
 
            }
            else if eventName.range(of:"Ta") != nil||eventName.range(of:"anit_Esther") != nil
                
            {
                 return Bundle.main.url(forResource: "Ta'anit_Esther", withExtension: "html");
 
            }
            else if eventName.range(of:"Tisha b'Av") != nil
                
            {
                 return Bundle.main.url(forResource: "Tisha b'Av", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Tisha B'Av") != nil
                //
                //            {
                //                 return Bundle.main.url(forResource: "Tisha_B'Av", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Tu B'Av") != nil
            {
                 return Bundle.main.url(forResource: "Tu_B'Av", withExtension: "html");
 
            }
            else if eventName.range(of:"Tu B'Sh'vat") != nil||eventName.range(of:"BiShvat") != nil
            {
                 return Bundle.main.url(forResource: "Tu_B'Sh'vat", withExtension: "html");
 
            }
            else if eventName.range(of:"Tzom") != nil||eventName.range(of:"Gedaliah") != nil
            {
                 return Bundle.main.url(forResource: "Tzom_Gedaliah", withExtension: "html");
 
            }
            else if eventName.range(of:"Yom Ha'atzma'ut") != nil
            {
                 return Bundle.main.url(forResource: "Yom_Ha'atzma'ut", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Yom HaShoah V'hag'vurah") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Yom_HaShoah_V'hag'vurah", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Yom HaZikaron") != nil||eventName.range(of:"HaZikaron") != nil
            {
                 return Bundle.main.url(forResource: "Yom_HaZikaron", withExtension: "html");
 
            }
            else if eventName.range(of:"Yom Kippur Shabbat") != nil
                
            {
                 return Bundle.main.url(forResource: "Yom_Kippur_Shabbat", withExtension: "html");
 
            }
            else if eventName.range(of:"Yom Kippur") != nil
            {
                 return Bundle.main.url(forResource: "Yom_Kippur", withExtension: "html");
 
            }
                //            else if eventName.range(of:"Yom Yerushalayim") != nil
                //            {
                //                 return Bundle.main.url(forResource: "Yom_Yerushalayim", withExtension: "html");
                //                let myRequest = NSURLRequest(url: localfilePath!);
                //                eventDetails.loadRequest(myRequest as URLRequest);
                //            }
            else if eventName.range(of:"Erev Sukkot Friday") != nil
            {
                 return Bundle.main.url(forResource: "Erev_Sukkot", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot I") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_1_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot 2 Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_2_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot 3 Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_3_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot 4 Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_4_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot 5 Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_5_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Sukkot 6 Weekday") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_6_Weekday", withExtension: "html");
 
            }
            else if eventName.range(of:"Hoshana Raba") != nil
            {
                 return Bundle.main.url(forResource: "Sukkot_Preparation", withExtension: "html");
 
            }
            else if eventName == "Candle lighting"
            {
                 return Bundle.main.url(forResource: "Chanukah_Candlelighting", withExtension: "html");
 
            }
            else if eventName == "Rosh Chodesh Adar"{
                 return Bundle.main.url(forResource: "Rosh_Chodesh_Adar_I", withExtension: "html");
 
            }            else if eventName == "Rosh Chodesh Av"
            {
                 return Bundle.main.url(forResource: "Rosh_Chodesh_Av", withExtension: "html");
 
            }
            else if eventName == "Rosh Chodesh Elul"
            {
                 return Bundle.main.url(forResource: "Rosh_Chodesh_Elul", withExtension: "html");
 
            }
            else if eventName == "Rosh Chodesh Cheshvan" || eventName == "Erev Rosh Hashanah Weekday"
            {
                 return Bundle.main.url(forResource: "Rosh_Chodesh_I_Weekday", withExtension: "html");
 
            }
                
            return Bundle.main.url(forResource: "Counting_the_Omer", withExtension: "html");
    }
    
}
