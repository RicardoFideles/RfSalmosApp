//
//  BannerHelper.m
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 01/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "BannerHelper.h"
#import "GADBannerView.h"

@implementation BannerHelper


+ (void) showWithViewController:(UIViewController *)viewController {
    
    GADBannerView *bannerView_;
    
    
    bannerView_ = [[GADBannerView alloc]
                   initWithFrame:CGRectMake(0.0,
                                            viewController.view.frame.size.height -
                                            GAD_SIZE_320x50.height,
                                            GAD_SIZE_320x50.width,
                                            GAD_SIZE_320x50.height)];
    
    // Especificar o "identificador do bloco de anúncios". Este é seu ID de editor da AdMob.
    bannerView_.adUnitID = @"ca-app-pub-3454917145399398/9876834358";
    
    // Permitir que o tempo de execução saiba qual UIViewController deve ser restaurado depois de levar
    // o usuário para onde quer que o anúncio vá e adicioná-lo à hierarquia de visualização.
    bannerView_.rootViewController = viewController;
    [viewController.view addSubview:bannerView_];
    
    GADRequest *request = [GADRequest request];
    request.testDevices = [NSArray arrayWithObjects:GAD_SIMULATOR_ID, nil];
    
    // Iniciar uma solicitação genérica para carregá-la com um anúncio.
    [bannerView_ loadRequest:request];
    
}

@end
