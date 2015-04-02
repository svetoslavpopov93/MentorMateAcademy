//
//  ViewController.m
//  HomeAsssignment_LunchPriceCalculator
//
//  Created by Student17 on 3/26/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelSoup;
@property (weak, nonatomic) IBOutlet UILabel *labelMainDish;
@property (weak, nonatomic) IBOutlet UILabel *labelCocaCola;
@property (weak, nonatomic) IBOutlet UILabel *labelHomeDelivery;
@property (weak, nonatomic) IBOutlet UILabel *labelDesert;
@property (weak, nonatomic) IBOutlet UILabel *labelTotalPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelColaCounter;

@property (weak, nonatomic) IBOutlet UITextField *texfieldSoup;
@property (weak, nonatomic) IBOutlet UITextField *textfieldMainDish;
@property (weak, nonatomic) IBOutlet UITextField *textfieldDesert;
@property (weak, nonatomic) IBOutlet UISlider *sliderCocaCola;
@property (weak, nonatomic) IBOutlet UISwitch *switchHomeDelivery;

@property (nonatomic) float defaultSoupPriceInEuro;
@property (nonatomic) float defaultMainDishPriceInEuro;
@property (nonatomic) float defaultDesertPriceInEuro;
@property (nonatomic) float defaultCocaColaPriceInEuro;
@property (nonatomic) float defaultHomeDeliveryPriceInEuro;


@property (nonatomic) NSString* currentCurrency;

@end

@implementation ViewController
{
    NSInteger soupCount;
    NSInteger mainDishCount;
    NSInteger desertCount;
    float colaCount;
    BOOL hasHomeDelivery;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentCurrency = @"EUR";
    self.defaultSoupPriceInEuro = 2;
    self.defaultMainDishPriceInEuro = 4.5;
    self.defaultDesertPriceInEuro = 1.5;
    self.defaultCocaColaPriceInEuro = 2;
    self.defaultHomeDeliveryPriceInEuro = 10;
    
    self.labelSoup.text = @"Soup - 2 EUR";
    self.labelMainDish.text = @"Main Dish - 4.5 EUR";
    self.labelDesert.text = @"Desert - 1.5 EUR";
    self.labelCocaCola.text = @"CocaCola - 2 EUR/liter";
    self.labelHomeDelivery.text = @"Home Delivery - 10 EUR";
    self.labelTotalPrice.text = @"0.00 EUR";
    self.labelColaCounter.text = @"0.0l";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (float)calculateProducts{
    float currencyMultiplier = 0;
    
    if ([self.currentCurrency isEqualToString:@"USD"]) {
        currencyMultiplier = 1.075;
    }
    else if ([self.currentCurrency isEqualToString:@"BGN"]){
        currencyMultiplier = 1.95;
    }
    else{
        currencyMultiplier = 1;
    }
    
    float finalPrice = 0;
    float soupsTotalPrice = (soupCount * self.defaultSoupPriceInEuro) * currencyMultiplier;
    float mainDishTotalPrice = (mainDishCount * self.defaultMainDishPriceInEuro) * currencyMultiplier;
    float desertTotalPrice = (desertCount * self.defaultDesertPriceInEuro) * currencyMultiplier;
    float cocaColaTotalPrice = (colaCount * self.defaultCocaColaPriceInEuro) * currencyMultiplier;

    
    float homeDeliveryTotalPrice;
    
    if (self.switchHomeDelivery.on) {
        homeDeliveryTotalPrice = self.defaultHomeDeliveryPriceInEuro * currencyMultiplier;
    }
    else{
        homeDeliveryTotalPrice = 0;
    }
    
    finalPrice = soupsTotalPrice + mainDishTotalPrice + desertTotalPrice + cocaColaTotalPrice + homeDeliveryTotalPrice;
    
    return finalPrice;
}

- (IBAction)currencyButtonActionUSD:(id)sender {
    self.currentCurrency = @"USD";
    self.labelSoup.text = @"Soup - 2.15 USD";
    self.labelMainDish.text = @"Main Dish - 4.9 USD";
    self.labelDesert.text = @"Desert - 1.65 USD";
    self.labelCocaCola.text = @"CocaCola - 2.15 USD/liter";
    self.labelHomeDelivery.text = @"Home Delivery - 10.90 USD";
}

- (IBAction)currencyButtonActionEUR:(id)sender {
    self.currentCurrency = @"EUR";
    self.labelSoup.text = @"Soup - 2 EUR";
    self.labelMainDish.text = @"Main Dish - 4.5 EUR";
    self.labelDesert.text = @"Desert - 1.5 EUR";
    self.labelCocaCola.text = @"CocaCola - 2 EUR/liter";
    self.labelHomeDelivery.text = @"Home Delivery - 10 EUR";
}

- (IBAction)currencyButtonActionBGN:(id)sender {
    self.currentCurrency = @"BGN";
    self.labelSoup.text = @"Soup - 3.9 BGN";
    self.labelMainDish.text = @"Main Dish - 8.80 BGN";
    self.labelDesert.text = @"Desert - 2.9 BGN";
    self.labelCocaCola.text = @"CocaCola - 3.9 BGN/liter";
    self.labelHomeDelivery.text = @"Home Delivery - 19.55 BGN";
}

- (IBAction)soupButtonActionPlus:(id)sender {
    if (self.texfieldSoup.text.integerValue < 10) {
        soupCount = self.texfieldSoup.text.integerValue + 1;
        self.texfieldSoup.text = [NSString stringWithFormat:@"%li", (long)soupCount];
    }
}
- (IBAction)soupButtonActionMinus:(id)sender {
    soupCount = self.texfieldSoup.text.integerValue -1;
    if (soupCount <= 0) {
        soupCount = 0;
    }
    self.texfieldSoup.text = [NSString stringWithFormat:@"%li", (long)soupCount];
}

- (IBAction)mainDishButtonActionPlus:(id)sender {
    if (self.textfieldMainDish.text.integerValue < 10) {
        mainDishCount = self.textfieldMainDish.text.integerValue + 1;
        self.textfieldMainDish.text = [NSString stringWithFormat:@"%li", (long)mainDishCount];
    }
}

- (IBAction)mainDishButtonActionMinus:(id)sender {
    mainDishCount = self.textfieldMainDish.text.integerValue - 1;
    
    if (mainDishCount <= 0) {
        mainDishCount = 0;
    }
    
    self.textfieldMainDish.text = [NSString stringWithFormat:@"%li", (long)mainDishCount];
}

- (IBAction)desertButtonActionPlus:(id)sender {
    if (self.textfieldDesert.text.integerValue < 10) {
        desertCount = self.textfieldDesert.text.integerValue + 1;
        self.textfieldDesert.text = [NSString stringWithFormat:@"%li", (long)desertCount];
    }
}

- (IBAction)desertButtonActionMinus:(id)sender {
    desertCount = self.textfieldDesert.text.integerValue - 1;
    
    if (desertCount <= 0) {
        desertCount = 0;
    }
    
    self.textfieldDesert.text = [NSString stringWithFormat:@"%li", (long)desertCount];
}

- (IBAction)cocaColaSliderAction:(id)sender {
    [self.sliderCocaCola setValue:((int)((self.sliderCocaCola.value * 10) / 5) * 0.5) animated:NO];
    colaCount = self.sliderCocaCola.value;
    self.labelColaCounter.text = [NSString stringWithFormat:@"%0.1fl", self.sliderCocaCola.value];
}

- (IBAction)calculateButtonAction:(id)sender {
    float totalPrice =[self calculateProducts];
    self.labelTotalPrice.text = [NSString stringWithFormat:@"%.2f %@", totalPrice, self.currentCurrency];
}
- (IBAction)didValidateOnInputEnd:(id)sender {
    UITextField *current = (UITextField*)sender;
    
    if (current.text.integerValue > 10) {
        current.text= @"10";
    }
    
    if (current.text.integerValue < 0) {
        current.text = @"0";
    }
}

@end
