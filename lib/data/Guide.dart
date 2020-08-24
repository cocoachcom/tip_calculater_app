class Guide {
    String barberHairdresser;
    String barberHairdresserAlert;
    String barberHairdresserTip;
    String barberHairdresserTipType;
    String bartenderAlert;
    String bartenderTip;
    String bartenderTipType;
    String bartenders;
    String bellboys;
    String bellboysAlert;
    String bellboysTip;
    String bellboysTipType;
    String carService;
    String carServiceAlert;
    String carServiceTip;
    String carServiceTipType;
    String concierge;
    String conciergeAlert;
    String conciergeTip;
    String conciergeTipType;
    String countries;
    String gasStation;
    String gasStationAlert;
    String gasStationTip;
    String gasStationTipType;
    String grocery;
    String groceryAlert;
    String groceryTip;
    String groceryTipType;
    String housekeeping;
    String housekeepingAlert;
    String housekeepingTip;
    String housekeepingTipType;
    String massage;
    String massageAlert;
    String massageTip;
    String massageTipType;
    String privateDrivers;
    String privateDriversAlert;
    String privateDriversTip;
    String privateDriversTipType;
    String restaurant;
    String restaurantAlert;
    String restaurantTip;
    String restaurantTipType;
    String salonSpa;
    String salonSpaAlert;
    String salonSpaTip;
    String salonSpaTipType;
    String taxi;
    String taxiAlert;
    String taxiTip;
    String taxiTipType;
    String tourGuideGroup;
    String tourGuideGroupAlert;
    String tourGuideGroupTip;
    String tourGuideGroupTipType;
    String tourGuidePrivate;
    String tourGuidePrivateAlert;
    String tourGuidePrivateTip;
    String tourGuidePrivateTipType;
    String train;
    String trainAlert;
    String trainTip;
    String trainTipType;
    String valet;
    String valetAlert;
    String valetTip;
    String valetTipType;

    Guide({this.barberHairdresser, this.barberHairdresserAlert, this.barberHairdresserTip, this.barberHairdresserTipType, this.bartenderAlert, this.bartenderTip, this.bartenderTipType, this.bartenders, this.bellboys, this.bellboysAlert, this.bellboysTip, this.bellboysTipType, this.carService, this.carServiceAlert, this.carServiceTip, this.carServiceTipType, this.concierge, this.conciergeAlert, this.conciergeTip, this.conciergeTipType, this.countries, this.gasStation, this.gasStationAlert, this.gasStationTip, this.gasStationTipType, this.grocery, this.groceryAlert, this.groceryTip, this.groceryTipType, this.housekeeping, this.housekeepingAlert, this.housekeepingTip, this.housekeepingTipType, this.massage, this.massageAlert, this.massageTip, this.massageTipType, this.privateDrivers, this.privateDriversAlert, this.privateDriversTip, this.privateDriversTipType, this.restaurant, this.restaurantAlert, this.restaurantTip, this.restaurantTipType, this.salonSpa, this.salonSpaAlert, this.salonSpaTip, this.salonSpaTipType, this.taxi, this.taxiAlert, this.taxiTip, this.taxiTipType, this.tourGuideGroup, this.tourGuideGroupAlert, this.tourGuideGroupTip, this.tourGuideGroupTipType, this.tourGuidePrivate, this.tourGuidePrivateAlert, this.tourGuidePrivateTip, this.tourGuidePrivateTipType, this.train, this.trainAlert, this.trainTip, this.trainTipType, this.valet, this.valetAlert, this.valetTip, this.valetTipType});

    factory Guide.fromJson(Map<String, dynamic> json) {
        return Guide(
            barberHairdresser: json['barberHairdresser'] as String,
            barberHairdresserAlert: json['barberHairdresserAlert'],
            barberHairdresserTip: json['barberHairdresserTip'],
            barberHairdresserTipType: json['barberHairdresserTipType'],
            bartenderAlert: json['bartenderAlert'],
            bartenderTip: json['bartenderTip'],
            bartenderTipType: json['bartenderTipType'],
            bartenders: json['bartenders'],
            bellboys: json['bellboys'],
            bellboysAlert: json['bellboysAlert'],
            bellboysTip: json['bellboysTip'],
            bellboysTipType: json['bellboysTipType'],
            carService: json['carService'], 
            carServiceAlert: json['carServiceAlert'], 
            carServiceTip: json['carServiceTip'], 
            carServiceTipType: json['carServiceTipType'], 
            concierge: json['concierge'], 
            conciergeAlert: json['conciergeAlert'], 
            conciergeTip: json['conciergeTip'], 
            conciergeTipType: json['conciergeTipType'], 
            countries: json['countries'], 
            gasStation: json['gasStation'], 
            gasStationAlert: json['gasStationAlert'], 
            gasStationTip: json['gasStationTip'], 
            gasStationTipType: json['gasStationTipType'], 
            grocery: json['grocery'], 
            groceryAlert: json['groceryAlert'], 
            groceryTip: json['groceryTip'], 
            groceryTipType: json['groceryTipType'], 
            housekeeping: json['housekeeping'], 
            housekeepingAlert: json['housekeepingAlert'], 
            housekeepingTip: json['housekeepingTip'], 
            housekeepingTipType: json['housekeepingTipType'], 
            massage: json['massage'], 
            massageAlert: json['massageAlert'], 
            massageTip: json['massageTip'], 
            massageTipType: json['massageTipType'], 
            privateDrivers: json['privateDrivers'], 
            privateDriversAlert: json['privateDriversAlert'], 
            privateDriversTip: json['privateDriversTip'], 
            privateDriversTipType: json['privateDriversTipType'], 
            restaurant: json['restaurant'], 
            restaurantAlert: json['restaurantAlert'], 
            restaurantTip: json['restaurantTip'], 
            restaurantTipType: json['restaurantTipType'], 
            salonSpa: json['salonSpa'], 
            salonSpaAlert: json['salonSpaAlert'], 
            salonSpaTip: json['salonSpaTip'], 
            salonSpaTipType: json['salonSpaTipType'], 
            taxi: json['taxi'], 
            taxiAlert: json['taxiAlert'], 
            taxiTip: json['taxiTip'], 
            taxiTipType: json['taxiTipType'], 
            tourGuideGroup: json['tourGuideGroup'], 
            tourGuideGroupAlert: json['tourGuideGroupAlert'], 
            tourGuideGroupTip: json['tourGuideGroupTip'], 
            tourGuideGroupTipType: json['tourGuideGroupTipType'], 
            tourGuidePrivate: json['tourGuidePrivate'], 
            tourGuidePrivateAlert: json['tourGuidePrivateAlert'], 
            tourGuidePrivateTip: json['tourGuidePrivateTip'], 
            tourGuidePrivateTipType: json['tourGuidePrivateTipType'], 
            train: json['train'], 
            trainAlert: json['trainAlert'], 
            trainTip: json['trainTip'], 
            trainTipType: json['trainTipType'], 
            valet: json['valet'], 
            valetAlert: json['valetAlert'], 
            valetTip: json['valetTip'], 
            valetTipType: json['valetTipType'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['barberHairdresser'] = this.barberHairdresser;
        data['barberHairdresserAlert'] = this.barberHairdresserAlert;
        data['barberHairdresserTip'] = this.barberHairdresserTip;
        data['barberHairdresserTipType'] = this.barberHairdresserTipType;
        data['bartenderAlert'] = this.bartenderAlert;
        data['bartenderTip'] = this.bartenderTip;
        data['bartenderTipType'] = this.bartenderTipType;
        data['bartenders'] = this.bartenders;
        data['bellboys'] = this.bellboys;
        data['bellboysAlert'] = this.bellboysAlert;
        data['bellboysTip'] = this.bellboysTip;
        data['bellboysTipType'] = this.bellboysTipType;
        data['carService'] = this.carService;
        data['carServiceAlert'] = this.carServiceAlert;
        data['carServiceTip'] = this.carServiceTip;
        data['carServiceTipType'] = this.carServiceTipType;
        data['concierge'] = this.concierge;
        data['conciergeAlert'] = this.conciergeAlert;
        data['conciergeTip'] = this.conciergeTip;
        data['conciergeTipType'] = this.conciergeTipType;
        data['countries'] = this.countries;
        data['gasStation'] = this.gasStation;
        data['gasStationAlert'] = this.gasStationAlert;
        data['gasStationTip'] = this.gasStationTip;
        data['gasStationTipType'] = this.gasStationTipType;
        data['grocery'] = this.grocery;
        data['groceryAlert'] = this.groceryAlert;
        data['groceryTip'] = this.groceryTip;
        data['groceryTipType'] = this.groceryTipType;
        data['housekeeping'] = this.housekeeping;
        data['housekeepingAlert'] = this.housekeepingAlert;
        data['housekeepingTip'] = this.housekeepingTip;
        data['housekeepingTipType'] = this.housekeepingTipType;
        data['massage'] = this.massage;
        data['massageAlert'] = this.massageAlert;
        data['massageTip'] = this.massageTip;
        data['massageTipType'] = this.massageTipType;
        data['privateDrivers'] = this.privateDrivers;
        data['privateDriversAlert'] = this.privateDriversAlert;
        data['privateDriversTip'] = this.privateDriversTip;
        data['privateDriversTipType'] = this.privateDriversTipType;
        data['restaurant'] = this.restaurant;
        data['restaurantAlert'] = this.restaurantAlert;
        data['restaurantTip'] = this.restaurantTip;
        data['restaurantTipType'] = this.restaurantTipType;
        data['salonSpa'] = this.salonSpa;
        data['salonSpaAlert'] = this.salonSpaAlert;
        data['salonSpaTip'] = this.salonSpaTip;
        data['salonSpaTipType'] = this.salonSpaTipType;
        data['taxi'] = this.taxi;
        data['taxiAlert'] = this.taxiAlert;
        data['taxiTip'] = this.taxiTip;
        data['taxiTipType'] = this.taxiTipType;
        data['tourGuideGroup'] = this.tourGuideGroup;
        data['tourGuideGroupAlert'] = this.tourGuideGroupAlert;
        data['tourGuideGroupTip'] = this.tourGuideGroupTip;
        data['tourGuideGroupTipType'] = this.tourGuideGroupTipType;
        data['tourGuidePrivate'] = this.tourGuidePrivate;
        data['tourGuidePrivateAlert'] = this.tourGuidePrivateAlert;
        data['tourGuidePrivateTip'] = this.tourGuidePrivateTip;
        data['tourGuidePrivateTipType'] = this.tourGuidePrivateTipType;
        data['train'] = this.train;
        data['trainAlert'] = this.trainAlert;
        data['trainTip'] = this.trainTip;
        data['trainTipType'] = this.trainTipType;
        data['valet'] = this.valet;
        data['valetAlert'] = this.valetAlert;
        data['valetTip'] = this.valetTip;
        data['valetTipType'] = this.valetTipType;
        return data;
    }
}