//
//  CurrencyModel.swift
//  Crypto-Viewer
//
//  Created by François-Xavier on 13/02/2024.
//

import Foundation

enum CurrencyModel: String, CaseIterable {
    
    case btc,eth,ltc,bch,bnb,eos,xrp,xlm,link,dot,yfi,usd,aed,ars,aud,bdt,bhd,bmd,brl,cad,chf,clp,cny,czk,dkk,eur,gbp,gel,hkd,huf,idr,ils,inr,jpy,krw,kwd,lkr,mmk,mxn,myr,ngn,nok,nzd,php,pkr,pln,rub,sar,sek,sgd,thb,tryy,twd,uah,vef,vnd,zar,xdr,xag,xau,bits,sats

    var description: String {
        switch self {
        case .btc : "Bitcoin"
        case .eth : "Ethereum"
        case .ltc : "Litecoin"
        case .bch : "Bitcoin Cash"
        case .bnb : "Binance Coin"
        case .eos : "EOS"
        case .xrp : "XRP"
        case .xlm : "Stellar"
        case .link : "Chainlink"
        case .dot : "Polkadot"
        case .yfi : "Yearn.finance"
        case .usd : "US Dollar"
        case .aed : "United Arab Emirates Dirham"
        case .ars : "Argentine Peso"
        case .aud : "Australian Dollar"
        case .bdt : "Bangladeshi Taka"
        case .bhd : "Bahraini Dinar"
        case .bmd : "Bermudian Dollar"
        case .brl : "Brazilian Real"
        case .cad : "Canadian Dollar"
        case .chf : "Swiss Franc"
        case .clp : "Chilean Peso"
        case .cny : "Chinese Yuan"
        case .czk : "Czech Koruna"
        case .dkk : "Danish Krone"
        case .eur : "Euro"
        case .gbp : "British Pound Sterling"
        case .gel : "Georgian Lari"
        case .hkd : "Hong Kong Dollar"
        case .huf : "Hungarian Forint"
        case .idr : "Indonesian Rupiah"
        case .ils : "Israeli New Shekel"
        case .inr : "Indian Rupee"
        case .jpy : "Japanese Yen"
        case .krw : "South Korean Won"
        case .kwd : "Kuwaiti Dinar"
        case .lkr : "Sri Lankan Rupee"
        case .mmk : "Myanmar Kyat"
        case .mxn : "Mexican Peso"
        case .myr : "Malaysian Ringgit"
        case .ngn : "Nigerian Naira"
        case .nok : "Norwegian Krone"
        case .nzd : "New Zealand Dollar"
        case .php : "Philippine Peso"
        case .pkr : "Pakistani Rupee"
        case .pln : "Polish Złoty"
        case .rub : "Russian Ruble"
        case .sar : "Saudi Riyal"
        case .sek : "Swedish Krona"
        case .sgd : "Singapore Dollar"
        case .thb : "Thai Baht"
        case .tryy : "Turkish Lira"
        case .twd : "New Taiwan Dollar"
        case .uah : "Ukrainian Hryvnia"
        case .vef : "Venezuelan Bolívar"
        case .vnd : "Vietnamese Đồng"
        case .zar : "South African Rand"
        case .xdr : "Special Drawing Rights"
        case .xag : "Silver Ounce"
        case .xau : "Gold Ounce"
        case .bits : "Bits"
        case .sats : "Satoshis"
        }
    }
}
