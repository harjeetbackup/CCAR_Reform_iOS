//
//  DetailVC.swift
//  ReformLuach
//
//  Created by u-sss18 on 11/30/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import UIKit

class DetailVC: UIViewController
{
     var eventInfo: CalenderSyncVC!
    var eventType = String()
    var eventName = String()
    
     @IBOutlet weak var eventDetails: UIWebView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
        if eventType == "PARSHIYOT" 
        {
//            if string.range(of:"Swift") != nil {
//                print("exists")
//            }
            if eventName.range(of:"Mot") != nil || eventName.range(of:"Acharei") != nil || eventName.range(of:"Acharei_Mot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Acharei_Mot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
                
            }
            else if eventName.range(of:"Parashat Behar-Bechukotai") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'chukotai", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Beha'alotcha") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'haalot'cha", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"chukotai") != nil || eventName.range(of:"har") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'har-B'chukotai", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Behar-Bechukotai") != nil || eventName.range(of:"Parashat Behar") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'har", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Bamidbar") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'midbar", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Bereshit") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'reishit", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }

            else if eventName.range(of:"Parashat Beshalach") != nil || eventName.range(of:"Beshalach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'shalach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Balak") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Balak", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Bo") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Bo", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Chayei_Sara") != nil || eventName.range(of:"Sara") != nil || eventName.range(of:"Chayei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chayei_Sara", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Chukat-Balak") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chukat-Balak", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Chukat") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chukat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Devarim") != nil || eventName.range(of:"Devarim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "D'varim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Eikev") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Eikev", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Emor") != nil || eventName.range(of:"Parashat Emor") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Emor", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Ha'Azinu") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Haazinu", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Kedoshim") != nil || eventName.range(of:"Kedoshim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "K'doshim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Ki_Tavo") != nil || eventName.range(of:"Tavo") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Ki_Tavo", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Ki_Teitzei") != nil || eventName.range(of:"Teitzei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Ki_Teitzei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Ki_Tisa") != nil || eventName.range(of:"Tisa") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Ki_Tisa", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Korach") != nil || eventName.range(of:"Korach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Korach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Lech_L'cha") != nil || eventName.range(of:"Lech") != nil || eventName.range(of:"cha") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Lech_L'cha", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Tazria-Metzora") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "M'tzora", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Matot-Masei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Matot-Mas-ei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Matot-Masei") != nil || eventName.range(of:"Matot-Masei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Mas-ei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Matot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Matot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Mikeitz-2") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Mikeitz-2", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Mikeitz") != nil || eventName.range(of:"Miketz") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Mikeitz", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Mishpatim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Mishpatim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Nasso") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Naso", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Nitzavim-Vayeilech") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Nitzavim-Vayeilech", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Nitzavim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Nitzavim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Noach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Noach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Vayakhel-Pekudei") != nil || eventName.range(of:"Vayakhel-Pekudei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "P'kudei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Pinchas") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pinchas", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"R'eih") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "R'eih", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Sh'lach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sh'lach_L'cha", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Sh'mini") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sh'mini", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Shmini II") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sh'mini_II", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Shmini I") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sh'mini_I", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
          
            else if eventName.range(of:"Shemot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sh'mot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shoftim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shof'tim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Terumah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "T'rumah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Tetzaveh") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "T'tzaveh", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Tazria-M'tzora") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Tazria-M'tzora", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Tazria-Metzora") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Tazria", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Toldot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Tol'dot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Tzav") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Tzav", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"rachah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "V'zot_Hab'rachah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Vaera") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Va-eira", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Vaetchanan") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Va-et'chanan", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Vayechi") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Va-y'chi", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Vayakhel") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayak'heil", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Vayak’heil-P’kudei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayak’heil-P’kudei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Vayeilech") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayeilech", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Vayeira") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayeira", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Vayera") != nil||eventName.range(of:"Vayeira") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeira", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Vayeishev") != nil || eventName.range(of:"Vayeshev") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayeishev", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Vayeitzei") != nil || eventName.range(of:"Vayetzei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayeitzei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Vayigash") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayigash", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Vayikra") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayikra", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Vayishlach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Vayishlach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Re'eh") != nil||eventName.range(of:"Re'eh") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Re'eh", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else //eventName.range(of:"Yitro") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Yitro", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            
        }
 
//////// Holiday List ........
       else if eventType == "HOLIDAYS"
        {
            if eventName.range(of:"Asara B'Tevet") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Asara_B'Tevet", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Aseret Y'mei T'shuva") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Aseret_Y'mei_T'shuva", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"B'dikat and Biur Chametz") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "B'dikat_and_Biur_Chametz", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Erev Chanukah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_1_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Chanukah: 2 Candles") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_2_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Chanukah: 3 Candles") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_3_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Chanukah: 4 Candles") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_4_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
//            else if eventName.range(of:"Chanukah: 5 Candles") != nil||eventName.range(of:"Erev_Rosh_Chodesh") != nil
//            {
//                let localfilePath = Bundle.main.url(forResource: "Chanukah_5_Weekday_Erev_Rosh_Chodesh _Tevet", withExtension: "html");
//                let myRequest = NSURLRequest(url: localfilePath!);
//                eventDetails.loadRequest(myRequest as URLRequest);
//            }
            else if eventName.range(of:"Chanukah: 5 Candles") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_5_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
//            else if eventName.range(of:"Chanukah: 6 Candles") != nil
//            {
//                let localfilePath = Bundle.main.url(forResource: "Chanukah_6_Weekday_Erev_Rosh_Chodesh _Tevet", withExtension: "html");
//                let myRequest = NSURLRequest(url: localfilePath!);
//                eventDetails.loadRequest(myRequest as URLRequest);
//            }
//            else if eventName.range(of:"Chanukah_6_Weekday") != nil||eventName.range(of:"Rosh_Chodesh") != nil
//            {
//                let localfilePath = Bundle.main.url(forResource: "Chanukah_6_Weekday_Rosh_Chodesh _Tevet_1", withExtension: "html");
//                let myRequest = NSURLRequest(url: localfilePath!);
//                eventDetails.loadRequest(myRequest as URLRequest);
//            }
            else if eventName.range(of:"Chanukah: 6 Candles") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_6_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
//            else if eventName.range(of:"Chanukah_7_Weekday") != nil||eventName.range(of:"Rosh_Chodesh ") != nil
//
//            {
//                let localfilePath = Bundle.main.url(forResource: "Chanukah_7_Weekday_Rosh_Chodesh _Tevet_1", withExtension: "html");
//                let myRequest = NSURLRequest(url: localfilePath!);
//                eventDetails.loadRequest(myRequest as URLRequest);
//            }
            else if eventName.range(of:"Chanukah: 7 Candles") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_7_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Chanukah 8 Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_8_Weekday_Rosh_Chodesh _Tevet_1", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Chanukah: 8 Candles") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_8_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Counting the Omer") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Counting_the_Omer", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Erev Chanukah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Chanukah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            
            else if eventName.range(of:"Erev Pesach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Pesach-Ta'anit_Bechorot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Erev Pesach/Ta'anit Bechorot Friday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Pesach-Ta'anit_Bechorot_Friday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Erev Purim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Purim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
//            else if eventName.range(of:"Erev_Rosh") != nil||eventName.range(of:"Chodesh_Friday") != nil
//            {
//                let localfilePath = Bundle.main.url(forResource: "Erev_Rosh_Chodesh_Friday", withExtension: "html");
//                let myRequest = NSURLRequest(url: localfilePath!);
//                eventDetails.loadRequest(myRequest as URLRequest);
//            }
//            else if eventName.range(of:"Erev_Rosh") != nil||eventName.range(of:"Chodesh_Weekday") != nil
//            {
//                let localfilePath = Bundle.main.url(forResource: "Erev_Rosh_Chodesh_Weekday", withExtension: "html");
//                let myRequest = NSURLRequest(url: localfilePath!);
//                eventDetails.loadRequest(myRequest as URLRequest);
//            }
            else if eventName.range(of:"Erev Rosh Hashanah Friday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Rosh_Hashanah_Friday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Rosh Hashana 5778") != nil||eventName.range(of:"Hashanah_Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Rosh_Hashanah_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Erev Sh'mini Atzeret-Erev Simchat_Torah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Sh'mini_Atzeret-Erev_Simchat_Torah_Friday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Erev Sh'mini Atzeret-Simchat Torah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Sh'mini_Atzeret-Simchat_Torah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Erev Shavuot Friday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Shavuot_Friday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Erev Shavuot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Shavuot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Erev Tisha b'Av") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Tisha_b'Av", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Erev Yom Kippur Friday") != nil
                
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Yom_Kippur", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Hoshana Raba") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Hoshana_Raba", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Lag BaOmer") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Lag_Ba'Omer", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Leil Selichot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Leil_Selichot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Machar Chodesh") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Machar_Chodesh", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else  if eventName.range(of:"Pesach Chol Hamoed Day 2") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_2", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Pesach Chol Hamoed Day 1") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_1", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            
            else if eventName.range(of:"Pesach Chol Hamoed Day 3") != nil
                
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_3", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Pesach I") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Day_1_Shabbat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Pesach Chol Hamoed Day 4") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_4", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Pesach Chol HaMoed Day 5 Friday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_5_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Pesach_Day_1") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Day_1_Shabbat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Pesach VIII") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Day_1_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Pesach_Day_7") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Day_7_Shabbat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Pesach VII") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Day_7", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Pesach Sheini") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Pesach_Sheini", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Purim Katan") != nil||eventName.range(of:"Katan") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Purim_Katan", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Purim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Purim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Rosh Hashana I") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Hashanah_1", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Rosh Hashanah 2") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Hashanah_2", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Sh'mini Atzeret-Simchat Torah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sh'mini_Atzeret-Simchat_Torah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Acharei Mot-K'doshim") != nil||eventName.range(of:"Acharei") != nil||eventName.range(of:"K'doshim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Acharei_Mot-K'doshim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Acharei_Mot") != nil||eventName.range(of:"Acharei Mot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Acharei_Mot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat B'chukotai") != nil||eventName.range(of:"chukotai") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_B'chukotai", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
                
            else if eventName.range(of:"Tisha B'Av") != nil
                
            {
                let localfilePath = Bundle.main.url(forResource: "Tisha_B'Av", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
                
            else if eventName.range(of:"Yom Yerushalayim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Yom_Yerushalayim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
                
            else if eventName.range(of:"Yom HaShoah V'hag'vurah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Yom_HaShoah_V'hag'vurah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
                
            else if eventName.range(of:"Shabbat B'ha'alot'cha") != nil||eventName.range(of:"ha") != nil||eventName.range(of:"alot") != nil||eventName.range(of:"cha") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_B'ha'alot'cha", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat B'har-B'chukotai") != nil || eventName.range(of:"chukotai") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_B'har-B'chukotai", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat B'har") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_B'har", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat B'reishit") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_B'reishit", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat B'shalach-Shabbat Shirah") != nil||eventName.range(of:"shalach-Shabbat_Shirah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_B'shalach-Shabbat_Shirah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Balak") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Balak", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Bamidbar") != nil||eventName.range(of:"Bamidbar") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Bamidbar", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Bo") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Bo", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Chanukah Rosh Chodesh") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Chanukah_Rosh_Chodesh", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Chanukah") != nil||eventName.range(of:"Chanukah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Chanukah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Chayei Sara") != nil||eventName.range(of:"Chayei Sara") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Chayei_Sara", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Chol HaMoed Pesach") != nil||eventName.range(of:"HaMoed Pesach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Chol_HaMoed_Pesach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Chol Hamoed Sukkot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Chol_Hamoed_Sukkot_Friday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            
            else if eventName.range(of:"Parashat Chukat") != nil||eventName.range(of:"Chukat") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Chukat-Balak", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Chukat") != nil||eventName.range(of:"Chukat") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Chukat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat D'varim-Shabbat Chazon") != nil||eventName.range(of:"varim") != nil||eventName.range(of:"Shabbat_Chazon") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_D'varim-Shabbat_Chazon", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Eikev") != nil||eventName.range(of:"Eikev") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Eikev", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Emor") != nil||eventName.range(of:"Emor") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Emor", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Ha'azinu-Shabbat Shuva") != nil||eventName.range(of:"Shabbat_Shuva") != nil||eventName.range(of:"azinu") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Ha'azinu-Shabbat_Shuva", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Ha'azinu") != nil||eventName.range(of:"azinu") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Ha'azinu", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat HaChodesh") != nil||eventName.range(of:"HaChodesh") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_HaChodesh", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat HaGadol") != nil||eventName.range(of:"HaGadol") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_HaGadol", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat K'doshim") != nil||eventName.range(of:"doshim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_K'doshim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Ki Tavo") != nil||eventName.range(of:"Ki_Tavo") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Ki_Tavo", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Ki Teitze") != nil||eventName.range(of:"Teitze") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Ki_Teitze", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Ki Tisa") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Ki_Tisa", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Korach") != nil||eventName.range(of:"Korach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Korach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Lech L'cha") != nil||eventName.range(of:"Lech_L'cha") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Lech_L'cha", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat M'tzora") != nil||eventName.range(of:"M'tzora") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_M'tzora", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat M'varchim") != nil||eventName.range(of:"varchim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_M'varchim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Mas'ei") != nil||eventName.range(of:"Mas'ei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Mas'ei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Matot-Mas'ei") != nil||eventName.range(of:"Matot Mas'ei") != nil
                
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Matot-Mas'ei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Matot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Matot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Mishpatim") != nil||eventName.range(of:"Mishpatim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Mishpatim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat N'tzavim Vayeilech") != nil||eventName.range(of:"tzavim_Vayeilech") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_N'tzavim_Vayeilech", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat N'tzavim") != nil||eventName.range(of:"N'tzavim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_N'tzavim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Naso") != nil||eventName.range(of:"Naso") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Naso", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Noach") != nil||eventName.range(of:"Noach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Noach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat P'kudei") != nil||eventName.range(of:"kudei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_P'kudei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Parah") != nil||eventName.range(of:"Parah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Parah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Pinchas") != nil||eventName.range(of:"Pinchas") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Pinchas", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Parashat Re'eh") != nil||eventName.range(of:"Re'eh") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Re'eh", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Rosh Chodesh I") != nil||eventName.range(of:"Rosh") != nil||eventName.range(of:"Chodesh_I") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Rosh_Chodesh_I", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
//            else if eventName.range(of:"Shabbat_Rosh") != nil||eventName.range(of:"Chodesh_II") != nil||eventName.range(of:"Day_Rosh_Chodesh") != nil
//            {
//                let localfilePath = Bundle.main.url(forResource: "Shabbat_Rosh_Chodesh_II_or_One_Day_Rosh_Chodesh", withExtension: "html");
//                let myRequest = NSURLRequest(url: localfilePath!);
//                eventDetails.loadRequest(myRequest as URLRequest);
//            }
            else if eventName.range(of:"Shabbat Sh'kalim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Sh'kalim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
//            else if eventName.range(of:"Shabbat") != nil||eventName.range(of:"lach_L") != nil||eventName.range(of:"cha") != nil
//            {
//                let localfilePath = Bundle.main.url(forResource: "Shabbat_Sh'lach_L'cha", withExtension: "html");
//                let myRequest = NSURLRequest(url: localfilePath!);
//                eventDetails.loadRequest(myRequest as URLRequest);
//            }
            else if eventName.range(of:"Shabbat Sh'mini") != nil||eventName.range(of:"mini") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Sh'mini", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Sh'mot") != nil||eventName.range(of:"mot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Sh'mot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Shoftim") != nil||eventName.range(of:"Shoftim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Shoftim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Trumah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_T'rumah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"tzaveh") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_T'tzaveh", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"tzora") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Tazria-M'tzora", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Tazria") != nil||eventName.range(of:"Tazria") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Tazria", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Toldot") != nil||eventName.range(of:" Toldot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Toldot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Tzav") != nil||eventName.range(of:"Tzav") != nil
                
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Tzav", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat V'etchanan-Nachamu") != nil||eventName.range(of:"etchanan-Nachamu") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_V'etchanan-Nachamu", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Va'eira") != nil||eventName.range(of:"eira") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Va'eira", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"habbat Vay'chi") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vay'chi", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
//            else if eventName.range(of:"Shabbat") != nil||eventName.range(of:"Vayakheil-P") != nil||eventName.range(of:"kudei") != nil
//            {
//                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayakheil-P'kudei", withExtension: "html");
//                let myRequest = NSURLRequest(url: localfilePath!);
//                eventDetails.loadRequest(myRequest as URLRequest);
//            }
            else if eventName.range(of:"Shabbat Vayakheil") != nil||eventName.range(of:"Vayakheil") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayakheil", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
//            else if eventName.range(of:"habbat") != nil||eventName.range(of:"Shabbat_Shuva") != nil
//            {
//                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeilech-Shabbat_Shuva", withExtension: "html");
//                let myRequest = NSURLRequest(url: localfilePath!);
//                eventDetails.loadRequest(myRequest as URLRequest);
//            }
            else if eventName.range(of:"Shabbat Vayeilech") != nil||eventName.range(of:"Vayeilech") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeilech", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Vayeira") != nil||eventName.range(of:"Vayeira") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeira", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
//            else if eventName.range(of:"Shabbat") != nil||eventName.range(of:"Chanukah_Day_2") != nil
//
//            {
//                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeishev_on_Chanukah_Day_2", withExtension: "html");
//                let myRequest = NSURLRequest(url: localfilePath!);
//                eventDetails.loadRequest(myRequest as URLRequest);
//            }
            else if eventName.range(of:"Shabbat Vayeishev") != nil||eventName.range(of:"Vayeishev") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeishev", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Vayeitzei") != nil||eventName.range(of:"Vayeitzei") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeitzei", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Vayigash") != nil||eventName.range(of:"Vayigash") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayigash", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Vayikra") != nil||eventName.range(of:"Vayikra") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayikra", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Vayishlach") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayishlach", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Yitro") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Yitro", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shabbat Zachor") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shabbat_Zachor", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shavuot Shabbat") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shavuot_Shabbat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shavuot I") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shavuot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shiva") != nil||eventName.range(of:"Tammuz") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shiva_Asar_b'Tammuz", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Shushan") != nil||eventName.range(of:"Shushan Purim") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Shushan_Purim", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Sukkot_1") != nil||eventName.range(of:"Shabbat") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_1_Shabbat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName == "Sukkot I"
                //eventName.range(of:"Sukkot 1") != nil||eventName.range(of:"Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_1_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName == "Sukkot 2 Weekday"
                //eventName.range(of:"Sukkot_2") != nil||eventName.range(of:"Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_2_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName == "Sukkot 3 Weekday"
                //eventName.range(of:"Sukkot_3") != nil||eventName.range(of:"Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_3_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName == "Sukkot 4 Weekday"
                //eventName.range(of:"Sukkot_4") != nil||eventName.range(of:"Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_4_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName == "Sukkot 5 Weekday"
                //eventName.range(of:"Sukkot_5") != nil||eventName.range(of:"Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_5_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName == "Sukkot 6 Weekday"
                //eventName.range(of:"Sukkot_6") != nil||eventName.range(of:"Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_6_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Sukkot") != nil||eventName.range(of:"Preparation") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_Preparation", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Ta") != nil||eventName.range(of:"anit_Bechorot") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Ta'anit_Bechorot-B'dikat_Chametz_Thursday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Ta") != nil||eventName.range(of:"anit_Esther") != nil
                
            {
                let localfilePath = Bundle.main.url(forResource: "Ta'anit_Esther", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Tisha b'Av") != nil
                
            {
                let localfilePath = Bundle.main.url(forResource: "Tisha b'Av", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
//            else if eventName.range(of:"Tisha B'Av") != nil
//
//            {
//                let localfilePath = Bundle.main.url(forResource: "Tisha_B'Av", withExtension: "html");
//                let myRequest = NSURLRequest(url: localfilePath!);
//                eventDetails.loadRequest(myRequest as URLRequest);
//            }
            else if eventName.range(of:"Tu B'Av") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Tu_B'Av", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Tu B'Sh'vat") != nil||eventName.range(of:"BiShvat") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Tu_B'Sh'vat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Tzom") != nil||eventName.range(of:"Gedaliah") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Tzom_Gedaliah", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Yom Ha'atzma'ut") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Yom_Ha'atzma'ut", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
//            else if eventName.range(of:"Yom HaShoah V'hag'vurah") != nil
//            {
//                let localfilePath = Bundle.main.url(forResource: "Yom_HaShoah_V'hag'vurah", withExtension: "html");
//                let myRequest = NSURLRequest(url: localfilePath!);
//                eventDetails.loadRequest(myRequest as URLRequest);
//            }
            else if eventName.range(of:"Yom HaZikaron") != nil||eventName.range(of:"HaZikaron") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Yom_HaZikaron", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Yom Kippur Shabbat") != nil
                
            {
                let localfilePath = Bundle.main.url(forResource: "Yom_Kippur_Shabbat", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Yom Kippur") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Yom_Kippur", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
//            else if eventName.range(of:"Yom Yerushalayim") != nil
//            {
//                let localfilePath = Bundle.main.url(forResource: "Yom_Yerushalayim", withExtension: "html");
//                let myRequest = NSURLRequest(url: localfilePath!);
//                eventDetails.loadRequest(myRequest as URLRequest);
//            }
            else if eventName.range(of:"Erev Sukkot Friday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Erev_Sukkot", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Sukkot I") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_1_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Sukkot 2 Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_2_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Sukkot 3 Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_3_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Sukkot 4 Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_4_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Sukkot 5 Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_5_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Sukkot 6 Weekday") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_6_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName.range(of:"Hoshana Raba") != nil
            {
                let localfilePath = Bundle.main.url(forResource: "Sukkot_Preparation", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName == "Candle lighting"
            {
                let localfilePath = Bundle.main.url(forResource: "Chanukah_Candlelighting", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName == "Rosh Chodesh Adar"{
                let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_Adar_I", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }            else if eventName == "Rosh Chodesh Av"
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_Av", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName == "Rosh Chodesh Elul"
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_Elul", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName == "Rosh Chodesh Cheshvan" || eventName == "Erev Rosh Hashanah Weekday"
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_I_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
                
            else
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_II_or_One_Day_Rosh_Chodesh_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
        }
            
               /////////////////////
            
            
            
      
        if eventType == "ROSH CHODESH"
        {
            if eventName == "Rosh Chodesh Adar"
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_Adar_I", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName == "Rosh Chodesh Av"
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_Av", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName == "Rosh Chodesh Elul"
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_Elul", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
            else if eventName == "Rosh Chodesh Cheshvan" || eventName == "Erev Rosh Hashanah Weekday"
            {
                let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_I_Weekday", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
           
            else
            {
                let localfilePath = Bundle.main.url(forResource: "Counting_the_Omer", withExtension: "html");
                let myRequest = NSURLRequest(url: localfilePath!);
                eventDetails.loadRequest(myRequest as URLRequest);
            }
        }
 
        
        if eventType == "ALL"{
            
           
                //            if string.range(of:"Swift") != nil {
                //                print("exists")
                //            }
                if eventName.range(of:"Mot") != nil || eventName.range(of:"Acharei") != nil || eventName.range(of:"Acharei_Mot") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Acharei_Mot", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Behar-Bechukotai") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "B'chukotai", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Beha'alotcha") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "B'haalot'cha", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"chukotai") != nil || eventName.range(of:"har") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "B'har-B'chukotai", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Behar-Bechukotai") != nil || eventName.range(of:"Parashat Behar") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "B'har", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Bamidbar") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "B'midbar", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Bereshit") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "B'reishit", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    
                else if eventName.range(of:"Parashat Beshalach") != nil || eventName.range(of:"Beshalach") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "B'shalach", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Balak") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Balak", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Bo") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Bo", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Chayei_Sara") != nil || eventName.range(of:"Sara") != nil || eventName.range(of:"Chayei") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Chayei_Sara", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Chukat-Balak") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Chukat-Balak", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Chukat") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Chukat", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Devarim") != nil || eventName.range(of:"Devarim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "D'varim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Eikev") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Eikev", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Emor") != nil || eventName.range(of:"Parashat Emor") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Emor", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Ha'Azinu") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Haazinu", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Kedoshim") != nil || eventName.range(of:"Kedoshim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "K'doshim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Ki_Tavo") != nil || eventName.range(of:"Tavo") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Ki_Tavo", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Ki_Teitzei") != nil || eventName.range(of:"Teitzei") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Ki_Teitzei", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Ki_Tisa") != nil || eventName.range(of:"Tisa") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Ki_Tisa", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Korach") != nil || eventName.range(of:"Korach") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Korach", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Lech_L'cha") != nil || eventName.range(of:"Lech") != nil || eventName.range(of:"cha") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Lech_L'cha", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Tazria-Metzora") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "M'tzora", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Matot-Masei") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Matot-Mas-ei", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Matot-Masei") != nil || eventName.range(of:"Matot-Masei") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Mas-ei", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Matot") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Matot", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Mikeitz-2") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Mikeitz-2", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Mikeitz") != nil || eventName.range(of:"Miketz") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Mikeitz", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Mishpatim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Mishpatim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Nasso") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Naso", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Nitzavim-Vayeilech") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Nitzavim-Vayeilech", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Nitzavim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Nitzavim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Noach") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Noach", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Vayakhel-Pekudei") != nil || eventName.range(of:"Vayakhel-Pekudei") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "P'kudei", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Pinchas") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Pinchas", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"R'eih") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "R'eih", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Sh'lach") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sh'lach_L'cha", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Sh'mini") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sh'mini", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Shmini II") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sh'mini_II", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Shmini I") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sh'mini_I", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    
                else if eventName.range(of:"Shemot") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sh'mot", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shoftim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shof'tim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Terumah") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "T'rumah", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Tetzaveh") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "T'tzaveh", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Tazria-M'tzora") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Tazria-M'tzora", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Tazria-Metzora") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Tazria", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Toldot") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Tol'dot", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Tzav") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Tzav", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"rachah") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "V'zot_Hab'rachah", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Vaera") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Va-eira", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Vaetchanan") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Va-et'chanan", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Vayechi") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Va-y'chi", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Vayakhel") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Vayak'heil", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Vayak’heil-P’kudei") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Vayak’heil-P’kudei", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Vayeilech") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Vayeilech", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Vayeira") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Vayeira", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Vayera") != nil||eventName.range(of:"Vayeira") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeira", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Vayeishev") != nil || eventName.range(of:"Vayeshev") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Vayeishev", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Vayeitzei") != nil || eventName.range(of:"Vayetzei") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Vayeitzei", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Vayigash") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Vayigash", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Vayikra") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Vayikra", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Vayishlach") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Vayishlach", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Re'eh") != nil||eventName.range(of:"Re'eh") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Re'eh", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
//                else //eventName.range(of:"Yitro") != nil
//                {
//                    let localfilePath = Bundle.main.url(forResource: "Yitro", withExtension: "html");
//                    let myRequest = NSURLRequest(url: localfilePath!);
//                    eventDetails.loadRequest(myRequest as URLRequest);
//                }
//
            
         ///////////////////////////////////////////////////////////////////
            
           else if eventName.range(of:"Asara B'Tevet") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Asara_B'Tevet", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Aseret Y'mei T'shuva") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Aseret_Y'mei_T'shuva", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"B'dikat and Biur Chametz") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "B'dikat_and_Biur_Chametz", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Erev Chanukah") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Chanukah_1_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Chanukah: 2 Candles") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Chanukah_2_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Chanukah: 3 Candles") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Chanukah_3_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Chanukah: 4 Candles") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Chanukah_4_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    //            else if eventName.range(of:"Chanukah: 5 Candles") != nil||eventName.range(of:"Erev_Rosh_Chodesh") != nil
                    //            {
                    //                let localfilePath = Bundle.main.url(forResource: "Chanukah_5_Weekday_Erev_Rosh_Chodesh _Tevet", withExtension: "html");
                    //                let myRequest = NSURLRequest(url: localfilePath!);
                    //                eventDetails.loadRequest(myRequest as URLRequest);
                    //            }
                else if eventName.range(of:"Chanukah: 5 Candles") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Chanukah_5_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    //            else if eventName.range(of:"Chanukah: 6 Candles") != nil
                    //            {
                    //                let localfilePath = Bundle.main.url(forResource: "Chanukah_6_Weekday_Erev_Rosh_Chodesh _Tevet", withExtension: "html");
                    //                let myRequest = NSURLRequest(url: localfilePath!);
                    //                eventDetails.loadRequest(myRequest as URLRequest);
                    //            }
                    //            else if eventName.range(of:"Chanukah_6_Weekday") != nil||eventName.range(of:"Rosh_Chodesh") != nil
                    //            {
                    //                let localfilePath = Bundle.main.url(forResource: "Chanukah_6_Weekday_Rosh_Chodesh _Tevet_1", withExtension: "html");
                    //                let myRequest = NSURLRequest(url: localfilePath!);
                    //                eventDetails.loadRequest(myRequest as URLRequest);
                    //            }
                else if eventName.range(of:"Chanukah: 6 Candles") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Chanukah_6_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    //            else if eventName.range(of:"Chanukah_7_Weekday") != nil||eventName.range(of:"Rosh_Chodesh ") != nil
                    //
                    //            {
                    //                let localfilePath = Bundle.main.url(forResource: "Chanukah_7_Weekday_Rosh_Chodesh _Tevet_1", withExtension: "html");
                    //                let myRequest = NSURLRequest(url: localfilePath!);
                    //                eventDetails.loadRequest(myRequest as URLRequest);
                    //            }
                else if eventName.range(of:"Chanukah: 7 Candles") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Chanukah_7_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Chanukah 8 Weekday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Chanukah_8_Weekday_Rosh_Chodesh _Tevet_1", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Chanukah: 8 Candles") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Chanukah_8_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Counting the Omer") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Counting_the_Omer", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Erev Chanukah") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Erev_Chanukah", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    
                else if eventName.range(of:"Erev Pesach") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Erev_Pesach-Ta'anit_Bechorot", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Erev Pesach/Ta'anit Bechorot Friday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Erev_Pesach-Ta'anit_Bechorot_Friday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Erev Purim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Erev_Purim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    //            else if eventName.range(of:"Erev_Rosh") != nil||eventName.range(of:"Chodesh_Friday") != nil
                    //            {
                    //                let localfilePath = Bundle.main.url(forResource: "Erev_Rosh_Chodesh_Friday", withExtension: "html");
                    //                let myRequest = NSURLRequest(url: localfilePath!);
                    //                eventDetails.loadRequest(myRequest as URLRequest);
                    //            }
                    //            else if eventName.range(of:"Erev_Rosh") != nil||eventName.range(of:"Chodesh_Weekday") != nil
                    //            {
                    //                let localfilePath = Bundle.main.url(forResource: "Erev_Rosh_Chodesh_Weekday", withExtension: "html");
                    //                let myRequest = NSURLRequest(url: localfilePath!);
                    //                eventDetails.loadRequest(myRequest as URLRequest);
                    //            }
                else if eventName.range(of:"Erev Rosh Hashanah Friday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Erev_Rosh_Hashanah_Friday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Rosh Hashana 5778") != nil||eventName.range(of:"Hashanah_Weekday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Erev_Rosh_Hashanah_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Erev Sh'mini Atzeret-Erev Simchat_Torah") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Erev_Sh'mini_Atzeret-Erev_Simchat_Torah_Friday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Erev Sh'mini Atzeret-Simchat Torah") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Erev_Sh'mini_Atzeret-Simchat_Torah", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Erev Shavuot Friday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Erev_Shavuot_Friday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Erev Shavuot") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Erev_Shavuot", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Erev Tisha b'Av") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Erev_Tisha_b'Av", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Erev Yom Kippur Friday") != nil
                    
                {
                    let localfilePath = Bundle.main.url(forResource: "Erev_Yom_Kippur", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Hoshana Raba") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Hoshana_Raba", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Lag BaOmer") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Lag_Ba'Omer", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Leil Selichot") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Leil_Selichot", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Machar Chodesh") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Machar_Chodesh", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else  if eventName.range(of:"Pesach Chol Hamoed Day 2") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_2", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Pesach Chol Hamoed Day 1") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_1", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    
                else if eventName.range(of:"Pesach Chol Hamoed Day 3") != nil
                    
                {
                    let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_3", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Pesach I") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Pesach_Day_1_Shabbat", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Pesach Chol Hamoed Day 4") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_4", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Pesach Chol HaMoed Day 5 Friday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Pesach_Chol_Hamoed_Day_5_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Pesach_Day_1") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Pesach_Day_1_Shabbat", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Pesach VIII") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Pesach_Day_1_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Pesach_Day_7") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Pesach_Day_7_Shabbat", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Pesach VII") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Pesach_Day_7", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Pesach Sheini") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Pesach_Sheini", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Purim Katan") != nil||eventName.range(of:"Katan") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Purim_Katan", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Purim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Purim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Rosh Hashana I") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Rosh_Hashanah_1", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Rosh Hashanah 2") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Rosh_Hashanah_2", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Sh'mini Atzeret-Simchat Torah") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sh'mini_Atzeret-Simchat_Torah", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Acharei Mot-K'doshim") != nil||eventName.range(of:"Acharei") != nil||eventName.range(of:"K'doshim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Acharei_Mot-K'doshim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Acharei_Mot") != nil||eventName.range(of:"Acharei Mot") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Acharei_Mot", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat B'chukotai") != nil||eventName.range(of:"chukotai") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_B'chukotai", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    
                else if eventName.range(of:"Tisha B'Av") != nil
                    
                {
                    let localfilePath = Bundle.main.url(forResource: "Tisha_B'Av", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    
                else if eventName.range(of:"Yom Yerushalayim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Yom_Yerushalayim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    
                else if eventName.range(of:"Yom HaShoah V'hag'vurah") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Yom_HaShoah_V'hag'vurah", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    
                else if eventName.range(of:"Shabbat B'ha'alot'cha") != nil||eventName.range(of:"ha") != nil||eventName.range(of:"alot") != nil||eventName.range(of:"cha") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_B'ha'alot'cha", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat B'har-B'chukotai") != nil || eventName.range(of:"chukotai") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_B'har-B'chukotai", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat B'har") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_B'har", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat B'reishit") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_B'reishit", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat B'shalach-Shabbat Shirah") != nil||eventName.range(of:"shalach-Shabbat_Shirah") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_B'shalach-Shabbat_Shirah", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Balak") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Balak", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Bamidbar") != nil||eventName.range(of:"Bamidbar") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Bamidbar", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Bo") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Bo", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Chanukah Rosh Chodesh") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Chanukah_Rosh_Chodesh", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Chanukah") != nil||eventName.range(of:"Chanukah") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Chanukah", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Chayei Sara") != nil||eventName.range(of:"Chayei Sara") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Chayei_Sara", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Chol HaMoed Pesach") != nil||eventName.range(of:"HaMoed Pesach") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Chol_HaMoed_Pesach", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Chol Hamoed Sukkot") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Chol_Hamoed_Sukkot_Friday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    
                else if eventName.range(of:"Parashat Chukat") != nil||eventName.range(of:"Chukat") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Chukat-Balak", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Chukat") != nil||eventName.range(of:"Chukat") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Chukat", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat D'varim-Shabbat Chazon") != nil||eventName.range(of:"varim") != nil||eventName.range(of:"Shabbat_Chazon") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_D'varim-Shabbat_Chazon", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Eikev") != nil||eventName.range(of:"Eikev") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Eikev", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Emor") != nil||eventName.range(of:"Emor") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Emor", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Ha'azinu-Shabbat Shuva") != nil||eventName.range(of:"Shabbat_Shuva") != nil||eventName.range(of:"azinu") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Ha'azinu-Shabbat_Shuva", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Ha'azinu") != nil||eventName.range(of:"azinu") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Ha'azinu", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat HaChodesh") != nil||eventName.range(of:"HaChodesh") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_HaChodesh", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat HaGadol") != nil||eventName.range(of:"HaGadol") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_HaGadol", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat K'doshim") != nil||eventName.range(of:"doshim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_K'doshim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Ki Tavo") != nil||eventName.range(of:"Ki_Tavo") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Ki_Tavo", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Ki Teitze") != nil||eventName.range(of:"Teitze") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Ki_Teitze", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Ki Tisa") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Ki_Tisa", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Korach") != nil||eventName.range(of:"Korach") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Korach", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Lech L'cha") != nil||eventName.range(of:"Lech_L'cha") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Lech_L'cha", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat M'tzora") != nil||eventName.range(of:"M'tzora") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_M'tzora", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat M'varchim") != nil||eventName.range(of:"varchim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_M'varchim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Mas'ei") != nil||eventName.range(of:"Mas'ei") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Mas'ei", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Matot-Mas'ei") != nil||eventName.range(of:"Matot Mas'ei") != nil
                    
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Matot-Mas'ei", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Matot") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Matot", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Mishpatim") != nil||eventName.range(of:"Mishpatim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Mishpatim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat N'tzavim Vayeilech") != nil||eventName.range(of:"tzavim_Vayeilech") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_N'tzavim_Vayeilech", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat N'tzavim") != nil||eventName.range(of:"N'tzavim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_N'tzavim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Naso") != nil||eventName.range(of:"Naso") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Naso", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Noach") != nil||eventName.range(of:"Noach") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Noach", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat P'kudei") != nil||eventName.range(of:"kudei") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_P'kudei", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Parah") != nil||eventName.range(of:"Parah") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Parah", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Pinchas") != nil||eventName.range(of:"Pinchas") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Pinchas", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Parashat Re'eh") != nil||eventName.range(of:"Re'eh") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Re'eh", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Rosh Chodesh I") != nil||eventName.range(of:"Rosh") != nil||eventName.range(of:"Chodesh_I") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Rosh_Chodesh_I", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    //            else if eventName.range(of:"Shabbat_Rosh") != nil||eventName.range(of:"Chodesh_II") != nil||eventName.range(of:"Day_Rosh_Chodesh") != nil
                    //            {
                    //                let localfilePath = Bundle.main.url(forResource: "Shabbat_Rosh_Chodesh_II_or_One_Day_Rosh_Chodesh", withExtension: "html");
                    //                let myRequest = NSURLRequest(url: localfilePath!);
                    //                eventDetails.loadRequest(myRequest as URLRequest);
                    //            }
                else if eventName.range(of:"Shabbat Sh'kalim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Sh'kalim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    //            else if eventName.range(of:"Shabbat") != nil||eventName.range(of:"lach_L") != nil||eventName.range(of:"cha") != nil
                    //            {
                    //                let localfilePath = Bundle.main.url(forResource: "Shabbat_Sh'lach_L'cha", withExtension: "html");
                    //                let myRequest = NSURLRequest(url: localfilePath!);
                    //                eventDetails.loadRequest(myRequest as URLRequest);
                    //            }
                else if eventName.range(of:"Shabbat Sh'mini") != nil||eventName.range(of:"mini") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Sh'mini", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Sh'mot") != nil||eventName.range(of:"mot") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Sh'mot", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Shoftim") != nil||eventName.range(of:"Shoftim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Shoftim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Trumah") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_T'rumah", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"tzaveh") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_T'tzaveh", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"tzora") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Tazria-M'tzora", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Tazria") != nil||eventName.range(of:"Tazria") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Tazria", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Toldot") != nil||eventName.range(of:" Toldot") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Toldot", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Tzav") != nil||eventName.range(of:"Tzav") != nil
                    
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Tzav", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat V'etchanan-Nachamu") != nil||eventName.range(of:"etchanan-Nachamu") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_V'etchanan-Nachamu", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Va'eira") != nil||eventName.range(of:"eira") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Va'eira", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"habbat Vay'chi") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Vay'chi", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    //            else if eventName.range(of:"Shabbat") != nil||eventName.range(of:"Vayakheil-P") != nil||eventName.range(of:"kudei") != nil
                    //            {
                    //                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayakheil-P'kudei", withExtension: "html");
                    //                let myRequest = NSURLRequest(url: localfilePath!);
                    //                eventDetails.loadRequest(myRequest as URLRequest);
                    //            }
                else if eventName.range(of:"Shabbat Vayakheil") != nil||eventName.range(of:"Vayakheil") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayakheil", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    //            else if eventName.range(of:"habbat") != nil||eventName.range(of:"Shabbat_Shuva") != nil
                    //            {
                    //                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeilech-Shabbat_Shuva", withExtension: "html");
                    //                let myRequest = NSURLRequest(url: localfilePath!);
                    //                eventDetails.loadRequest(myRequest as URLRequest);
                    //            }
                else if eventName.range(of:"Shabbat Vayeilech") != nil||eventName.range(of:"Vayeilech") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeilech", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Vayeira") != nil||eventName.range(of:"Vayeira") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeira", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    //            else if eventName.range(of:"Shabbat") != nil||eventName.range(of:"Chanukah_Day_2") != nil
                    //
                    //            {
                    //                let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeishev_on_Chanukah_Day_2", withExtension: "html");
                    //                let myRequest = NSURLRequest(url: localfilePath!);
                    //                eventDetails.loadRequest(myRequest as URLRequest);
                    //            }
                else if eventName.range(of:"Shabbat Vayeishev") != nil||eventName.range(of:"Vayeishev") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeishev", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Vayeitzei") != nil||eventName.range(of:"Vayeitzei") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayeitzei", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Vayigash") != nil||eventName.range(of:"Vayigash") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayigash", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Vayikra") != nil||eventName.range(of:"Vayikra") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayikra", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Vayishlach") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Vayishlach", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Yitro") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Yitro", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shabbat Zachor") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shabbat_Zachor", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shavuot Shabbat") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shavuot_Shabbat", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shavuot I") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shavuot", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shiva") != nil||eventName.range(of:"Tammuz") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shiva_Asar_b'Tammuz", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Shushan") != nil||eventName.range(of:"Shushan Purim") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Shushan_Purim", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Sukkot_1") != nil||eventName.range(of:"Shabbat") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_1_Shabbat", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName == "Sukkot I"
                    //eventName.range(of:"Sukkot 1") != nil||eventName.range(of:"Weekday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_1_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName == "Sukkot 2 Weekday"
                    //eventName.range(of:"Sukkot_2") != nil||eventName.range(of:"Weekday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_2_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName == "Sukkot 3 Weekday"
                    //eventName.range(of:"Sukkot_3") != nil||eventName.range(of:"Weekday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_3_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName == "Sukkot 4 Weekday"
                    //eventName.range(of:"Sukkot_4") != nil||eventName.range(of:"Weekday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_4_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName == "Sukkot 5 Weekday"
                    //eventName.range(of:"Sukkot_5") != nil||eventName.range(of:"Weekday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_5_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName == "Sukkot 6 Weekday"
                    //eventName.range(of:"Sukkot_6") != nil||eventName.range(of:"Weekday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_6_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Sukkot") != nil||eventName.range(of:"Preparation") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_Preparation", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Ta") != nil||eventName.range(of:"anit_Bechorot") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Ta'anit_Bechorot-B'dikat_Chametz_Thursday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Ta") != nil||eventName.range(of:"anit_Esther") != nil
                    
                {
                    let localfilePath = Bundle.main.url(forResource: "Ta'anit_Esther", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Tisha b'Av") != nil
                    
                {
                    let localfilePath = Bundle.main.url(forResource: "Tisha b'Av", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    //            else if eventName.range(of:"Tisha B'Av") != nil
                    //
                    //            {
                    //                let localfilePath = Bundle.main.url(forResource: "Tisha_B'Av", withExtension: "html");
                    //                let myRequest = NSURLRequest(url: localfilePath!);
                    //                eventDetails.loadRequest(myRequest as URLRequest);
                    //            }
                else if eventName.range(of:"Tu B'Av") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Tu_B'Av", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Tu B'Sh'vat") != nil||eventName.range(of:"BiShvat") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Tu_B'Sh'vat", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Tzom") != nil||eventName.range(of:"Gedaliah") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Tzom_Gedaliah", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Yom Ha'atzma'ut") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Yom_Ha'atzma'ut", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    //            else if eventName.range(of:"Yom HaShoah V'hag'vurah") != nil
                    //            {
                    //                let localfilePath = Bundle.main.url(forResource: "Yom_HaShoah_V'hag'vurah", withExtension: "html");
                    //                let myRequest = NSURLRequest(url: localfilePath!);
                    //                eventDetails.loadRequest(myRequest as URLRequest);
                    //            }
                else if eventName.range(of:"Yom HaZikaron") != nil||eventName.range(of:"HaZikaron") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Yom_HaZikaron", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Yom Kippur Shabbat") != nil
                    
                {
                    let localfilePath = Bundle.main.url(forResource: "Yom_Kippur_Shabbat", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Yom Kippur") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Yom_Kippur", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    //            else if eventName.range(of:"Yom Yerushalayim") != nil
                    //            {
                    //                let localfilePath = Bundle.main.url(forResource: "Yom_Yerushalayim", withExtension: "html");
                    //                let myRequest = NSURLRequest(url: localfilePath!);
                    //                eventDetails.loadRequest(myRequest as URLRequest);
                    //            }
                else if eventName.range(of:"Erev Sukkot Friday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Erev_Sukkot", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Sukkot I") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_1_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Sukkot 2 Weekday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_2_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Sukkot 3 Weekday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_3_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Sukkot 4 Weekday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_4_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Sukkot 5 Weekday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_5_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Sukkot 6 Weekday") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_6_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName.range(of:"Hoshana Raba") != nil
                {
                    let localfilePath = Bundle.main.url(forResource: "Sukkot_Preparation", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName == "Candle lighting"
                {
                    let localfilePath = Bundle.main.url(forResource: "Chanukah_Candlelighting", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName == "Rosh Chodesh Adar"{
                    let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_Adar_I", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }            else if eventName == "Rosh Chodesh Av"
                {
                    let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_Av", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName == "Rosh Chodesh Elul"
                {
                    let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_Elul", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                else if eventName == "Rosh Chodesh Cheshvan" || eventName == "Erev Rosh Hashanah Weekday"
                {
                    let localfilePath = Bundle.main.url(forResource: "Rosh_Chodesh_I_Weekday", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
                    
                else
                {
                    let localfilePath = Bundle.main.url(forResource: "Counting_the_Omer", withExtension: "html");
                    let myRequest = NSURLRequest(url: localfilePath!);
                    eventDetails.loadRequest(myRequest as URLRequest);
                }
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnActionBAck(_ sender: UIButton)
    {
        self .dismiss(animated: false, completion: nil)
    }

  
    

}
