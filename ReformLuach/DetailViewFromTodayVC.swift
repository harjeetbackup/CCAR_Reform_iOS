//
//  DetailViewFromTodayVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 12/9/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import UIKit

class DetailViewFromTodayVC: UIViewController {
    
    
    var eventNameFromToday = String()
    
    @IBOutlet weak var eventDetails: UIWebView!
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
      
            if eventNameFromToday.range(of:"Acharei") != nil || eventNameFromToday.range(of:"Acharei_Mot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Acharei_Mot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Behar-Bechukotai") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'chukotai", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Beha'alotcha") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'haalot'cha", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"chukotai") != nil || eventNameFromToday.range(of:"har") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'har-B'chukotai", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Bamidbar") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'midbar", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Bereshit") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'reishit", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Beshalach") != nil || eventNameFromToday.range(of:"Beshalach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'shalach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Balak") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Balak", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Bo") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Bo", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Chayei_Sara") != nil || eventNameFromToday.range(of:"Sara") != nil || eventNameFromToday.range(of:"Chayei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chayei_Sara", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Chukat-Balak") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chukat-Balak", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Chukat") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chukat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Devarim") != nil || eventNameFromToday.range(of:"Devarim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "D'varim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Eikev") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Eikev", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Emor") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Emor", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Ha'Azinu") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Haazinu", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Kedoshim") != nil || eventNameFromToday.range(of:"Kedoshim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "K'doshim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Ki Tavo") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Ki_Tavo", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Ki Teitzei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Ki_Teitzei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Ki Tisa") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Ki_Tisa", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Korach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Korach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Lech L'cha") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Lech_L'cha", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Matot-Masei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Matot-Mas-ei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Matot-Masei") != nil || eventNameFromToday.range(of:"Matot-Masei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Mas-ei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Matot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Matot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Mikeitz-2") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Mikeitz-2", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Mikeitz") != nil || eventNameFromToday.range(of:"Miketz") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Mikeitz", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Mishpatim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Mishpatim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Naso") != nil
            {
                
                let localfilePath = Bundle.main.url(forResource: "Naso", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Nitzavim-Vayeilech") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Nitzavim-Vayeilech", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Nitzavim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Nitzavim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Noach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Noach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Vayakhel-Pekudei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "P'kudei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Pinchas") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pinchas", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"R'eih") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "R'eih", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sh'lach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sh'lach_L'cha", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shmini") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sh'mini", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shemot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sh'mot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shoftim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shof'tim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Terumah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "T'rumah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Tetzaveh") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "T'tzaveh", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Tazria-M'tzora") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Tazria-M'tzora", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Tazria-Metzora") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Tazria", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Toldot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Tol'dot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Tzav") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Tzav", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"rachah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "V'zot_Hab'rachah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Vaera") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Va-eira", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Vaetchanan") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Va-et'chanan", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Vayechi") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Va-y'chi", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Vayakhel") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayak'heil", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Vayak’heil-P’kudei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayak’heil-P’kudei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Vayeilech") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayeilech", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Vayeira") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayeira", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Vayera") != nil||eventNameFromToday.range(of:"Vayeira") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeira", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Vayeishev") != nil || eventNameFromToday.range(of:"Vayeshev") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayeishev", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Vayeitzei") != nil || eventNameFromToday.range(of:"Vayetzei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayeitzei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Vayigash") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayigash", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Vayikra") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayikra", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Vayishlach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayishlach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Yitro") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Yitro", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Asara B'Tevet") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Asara_B'Tevet", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Aseret Y'mei T'shuva") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Aseret_Y'mei_T'shuva", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"B'dikat and Biur Chametz") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'dikat_and_Biur_Chametz", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Erev Chanukah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_1_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Chanukah: 2 Candles") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_2_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Chanukah: 3 Candles") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_3_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Chanukah: 4 Candles") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_4_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Chanukah: 5 Candles") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_5_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Chanukah: 6 Candles") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_6_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Chanukah: 7 Candles") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_7_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Chanukah 8 Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_8_Weekday_Rosh_Chodesh _Tevet_1", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Chanukah: 8 Candles") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_8_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Counting the Omer") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Counting_the_Omer", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Erev Chanukah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Chanukah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Erev Pesach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Pesach-Ta'anit_Bechorot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Erev Pesach/Ta'anit Bechorot Friday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Pesach-Ta'anit_Bechorot_Friday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Erev Purim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Purim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Erev Rosh Hashanah Friday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Rosh_Hashanah_Friday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Rosh Hashana 5778") != nil||eventNameFromToday.range(of:"Hashanah_Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Rosh_Hashanah_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Erev Sh'mini Atzeret-Erev Simchat_Torah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Sh'mini_Atzeret-Erev_Simchat_Torah_Friday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Erev Sh'mini Atzeret-Simchat Torah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Sh'mini_Atzeret-Simchat_Torah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Erev Shavuot Friday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Shavuot_Friday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Erev Shavuot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Shavuot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Erev Tisha b'Av") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Tisha_b'Av", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Erev Yom Kippur Friday") != nil
                
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Yom_Kippur", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Hoshana Raba") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Hoshana_Raba", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Lag BaOmer") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Lag_Ba'Omer", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Leil Selichot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Leil_Selichot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Machar Chodesh") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Machar_Chodesh", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else  if eventNameFromToday.range(of:"Pesach Chol Hamoed Day 2") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_3", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Pesach Chol Hamoed Day 1") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_2", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Pesach Chol Hamoed Day 3") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_4", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Pesach I") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_1", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Pesach Chol Hamoed Day 4") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_5_Friday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Pesach Chol HaMoed Day 5 Friday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_5_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Pesach_Day_1") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Day_1_Shabbat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Pesach VIII") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Day_1_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Pesach_Day_7") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Day_7_Shabbat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Pesach VII") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Day_7", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Pesach Sheini") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Sheini", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Purim Katan") != nil||eventNameFromToday.range(of:"Katan") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Purim_Katan", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Purim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Purim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Rosh Hashana I") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Hashanah_1", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Rosh Hashanah 2") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Hashanah_2", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sh'mini Atzeret-Simchat Torah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sh'mini_Atzeret-Simchat_Torah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Acharei Mot-K'doshim") != nil||eventNameFromToday.range(of:"Acharei") != nil||eventNameFromToday.range(of:"K'doshim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Acharei_Mot-K'doshim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Acharei_Mot") != nil||eventNameFromToday.range(of:"Acharei Mot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Acharei_Mot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat B'chukotai") != nil||eventNameFromToday.range(of:"chukotai") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_B'chukotai", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat B'ha'alot'cha") != nil||eventNameFromToday.range(of:"ha") != nil||eventNameFromToday.range(of:"alot") != nil||eventNameFromToday.range(of:"cha") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_B'ha'alot'cha", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat B'har-B'chukotai") != nil || eventNameFromToday.range(of:"chukotai") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_B'har-B'chukotai", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat B'har") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_B'har", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat B'reishit") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_B'reishit", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat B'shalach-Shabbat Shirah") != nil||eventNameFromToday.range(of:"shalach-Shabbat_Shirah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_B'shalach-Shabbat_Shirah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Balak") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Balak", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Bamidbar") != nil||eventNameFromToday.range(of:"Bamidbar") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Bamidbar", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Bo") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Bo", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Chanukah Rosh Chodesh") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Chanukah_Rosh_Chodesh", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Chanukah") != nil||eventNameFromToday.range(of:"Chanukah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Chanukah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Chayei Sara") != nil||eventNameFromToday.range(of:"Chayei Sara") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Chayei_Sara", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Chol HaMoed Pesach") != nil||eventNameFromToday.range(of:"HaMoed Pesach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Chol_HaMoed_Pesach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Chol Hamoed Sukkot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Chol_Hamoed_Sukkot_Friday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
                
            else if eventNameFromToday.range(of:"Parashat Chukat") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Chukat-Balak", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Chukat") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Chukat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat D'varim-Shabbat Chazon") != nil||eventNameFromToday.range(of:"varim") != nil||eventNameFromToday.range(of:"Shabbat_Chazon") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_D'varim-Shabbat_Chazon", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Eikev") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Eikev", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Emor") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Emor", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Ha'azinu-Shabbat Shuva") != nil||eventNameFromToday.range(of:"Shabbat_Shuva") != nil||eventNameFromToday.range(of:"azinu") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Ha'azinu-Shabbat_Shuva", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Ha'azinu") != nil||eventNameFromToday.range(of:"azinu") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Ha'azinu", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat HaChodesh") != nil||eventNameFromToday.range(of:"HaChodesh") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_HaChodesh", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat HaGadol") != nil||eventNameFromToday.range(of:"HaGadol") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_HaGadol", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat K'doshim") != nil||eventNameFromToday.range(of:"doshim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_K'doshim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Ki Tavo") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Ki_Tavo", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Ki Teitze") != nil||eventNameFromToday.range(of:"Teitze") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Ki_Teitze", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Ki Tisa") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Ki_Tisa", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Korach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Korach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Lech L'cha") != nil||eventNameFromToday.range(of:"Lech_L'cha") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Lech_L'cha", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat M'tzora") != nil||eventNameFromToday.range(of:"M'tzora") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_M'tzora", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat M'varchim") != nil||eventNameFromToday.range(of:"varchim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_M'varchim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Mas'ei") != nil||eventNameFromToday.range(of:"Mas'ei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Mas'ei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Matot-Mas'ei") != nil||eventNameFromToday.range(of:"Matot Mas'ei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Matot-Mas'ei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Matot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Matot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Mishpatim") != nil||eventNameFromToday.range(of:"Mishpatim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Mishpatim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat N'tzavim Vayeilech") != nil||eventNameFromToday.range(of:"tzavim_Vayeilech") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_N'tzavim_Vayeilech", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat N'tzavim") != nil||eventNameFromToday.range(of:"N'tzavim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_N'tzavim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Naso") != nil||eventNameFromToday.range(of:"Naso") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Naso", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Noach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Noach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat P'kudei") != nil||eventNameFromToday.range(of:"kudei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_P'kudei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Parah") != nil||eventNameFromToday.range(of:"Parah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Parah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Pinchas") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Pinchas", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Parashat Re'eh") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Re'eh", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Rosh Chodesh I") != nil||eventNameFromToday.range(of:"Rosh") != nil||eventNameFromToday.range(of:"Chodesh_I") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Rosh_Chodesh_I", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Sh'kalim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Sh'kalim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Sh'mini") != nil||eventNameFromToday.range(of:"mini") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Sh'mini", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Sh'mot") != nil||eventNameFromToday.range(of:"mot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Sh'mot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Shoftim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Shoftim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Trumah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_T'rumah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"tzaveh") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_T'tzaveh", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"tzora") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Tazria-M'tzora", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Tazria") != nil||eventNameFromToday.range(of:"Tazria") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Tazria", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Toldot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Toldot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Tzav") != nil||eventNameFromToday.range(of:"Tzav") != nil
                
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Tzav", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat V'etchanan-Nachamu") != nil||eventNameFromToday.range(of:"etchanan-Nachamu") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_V'etchanan-Nachamu", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Va'eira") != nil||eventNameFromToday.range(of:"eira") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Va'eira", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"habbat Vay'chi") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vay'chi", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Vayakheil") != nil||eventNameFromToday.range(of:"Vayakheil") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayakheil", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Vayeilech") != nil||eventNameFromToday.range(of:"Vayeilech") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeilech", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Vayeira") != nil||eventNameFromToday.range(of:"Vayeira") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeira", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Vayeishev") != nil||eventNameFromToday.range(of:"Vayeishev") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeishev", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Vayeitzei") != nil||eventNameFromToday.range(of:"Vayeitzei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeitzei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Vayigash") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayigash", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Vayikra") != nil||eventNameFromToday.range(of:"Vayikra") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayikra", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Vayishlach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayishlach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Yitro") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Yitro", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shabbat Zachor") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Zachor", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shavuot Shabbat") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shavuot_Shabbat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shavuot I") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shavuot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shiva") != nil||eventNameFromToday.range(of:"Tammuz") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shiva_Asar_b'Tammuz", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Shushan Purim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shushan_Purim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sukkot_1") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_1_Shabbat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sukkot_1") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_1_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sukkot_2") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_2_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sukkot_3") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_3_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sukkot_4") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_4_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sukkot_5") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_5_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sukkot_6") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_6_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sukkot Preparation") != nil||eventNameFromToday.range(of:"Preparation") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_Preparation", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"anit Bechorot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Ta'anit_Bechorot-B'dikat_Chametz_Thursday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Ta") != nil||eventNameFromToday.range(of:"anit_Esther") != nil
                
            {
                let localfilePath = Bundle.main.url(forResource: "Ta'anit_Esther", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Tisha b'Av") != nil
                
            {
                let localfilePath = Bundle.main.url(forResource: "Tisha b'Av", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Tisha B'Av") != nil
                
            {
                let localfilePath = Bundle.main.url(forResource: "Tisha_B'Av", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Tu B'Av") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Tu_B'Av", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Tu B'Sh'vat") != nil||eventNameFromToday.range(of:"BiShvat") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Tu_B'Sh'vat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Tzom Gedaliah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Tzom_Gedaliah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Yom Ha'atzma'ut") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Yom_Ha'atzma'ut", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Yom HaShoah V'hag'vurah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Yom_HaShoah_V'hag'vurah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Yom HaZikaron") != nil||eventNameFromToday.range(of:"HaZikaron") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Yom_HaZikaron", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Yom Kippur Shabbat") != nil
                
            {
                let localfilePath = Bundle.main.url(forResource: "Yom_Kippur_Shabbat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Yom Kippur") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Yom_Kippur", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Yom Yerushalayim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Yom_Yerushalayim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Erev Sukkot Friday") != nil || eventNameFromToday.range(of:"Erev Sukkot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Sukkot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sukkot I") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_1_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sukkot 2 Weekday") != nil || eventNameFromToday.range(of:"Sukkot II") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_2_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sukkot 3 Weekday") != nil || eventNameFromToday.range(of:"Sukkot III (CH''M)") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_3_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sukkot 4 Weekday") != nil || eventNameFromToday.range(of:"Sukkot IV (CH''M)") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_4_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sukkot 5 Weekday") != nil || eventNameFromToday.range(of:"Sukkot V (CH''M)") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_5_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Sukkot 6 Weekday") != nil || eventNameFromToday.range(of:"Sukkot VI (CH''M)") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_6_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday.range(of:"Hoshana Raba") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_Preparation", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday == "Rosh Chodesh Adar"
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_Adar_I", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday == "Rosh Chodesh Av"
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_Av", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday == "Rosh Chodesh Elul"
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_Elul", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday == "Rosh Chodesh Cheshvan" || eventNameFromToday == "Erev Rosh Hashanah Weekday"
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_I_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventNameFromToday == "Rosh Chodesh Cheshvan"
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_II_or_One_Day_Rosh_Chodesh_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayakheil-P'kudei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
      
       
        
                
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnActionBAck(_ sender: UIButton)
    {
        self .dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
