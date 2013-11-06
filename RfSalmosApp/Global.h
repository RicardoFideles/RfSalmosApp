//
//  Global.h
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 05/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

//---------------------------
// PRD
//---------------------------
#define K_PRD NO

//---------------------------
// App Store
//---------------------------

#define K_APP_STORE_LINK @"http://itunes.apple.com/app/id584819461" // TODO: remover id do vairio. Usar link abaixo (id720781998)
//#define K_APP_STORE_LINK @"http://itunes.apple.com/app/id720781998"


//---------------------------
// URL
//---------------------------
#define K_API_CAPA @"http://extra.globo.com/api/capa/v1/ultimas.json"
#define K_API_EDITORIA @"http://extra.globo.com/api/v1/App/%@/conteudo.json?tiposDeConteudo=news"
#define K_API_PHOTOGALLERY @"http://extra.globo.com/api/v1/App/ece_frontpage/conteudo.json?tiposDeConteudo=gallery,galleryVertical,superFotogaleria"


//---------------------------
// BANNER
//---------------------------
#define K_BANNER_HEIGHT 50
#define K_BANNER_SPLASH_CODE @"x01"
#define K_BANNER_CODE @"x33"

#define K_BANNER_SEGMENT_DEFAULT @"capa"

#define K_BANNER_URL @"http://ads.globo.com/RealMedia/ads/adstream_sx.ads/ogcapp/extranoticias/%@/%d@%@?ios%@"

//---------------------------
// GOOGLE ANALYTICS
//---------------------------
#define K_GOOGLE_ANALYTICS_PRD_ID @"UA-1531962-81"
#define K_GOOGLE_ANALYTICS_DSV_ID @"UA-1531962-82"

#define K_GOOGLE_ANALYTICS_CAPA @"/capa"
#define K_GOOGLE_ANALYTICS_CAPA_DE_EDITORIA @"/%@"
#define K_GOOGLE_ANALYTICS_CAPA_DE_FOTOGALERIAS @"/fotogalerias"
#define K_GOOGLE_ANALYTICS_MATERIA @"/%@/%@"
#define K_GOOGLE_ANALYTICS_CONFIGURACOES @"/menu-configuracoes"
#define K_GOOGLE_ANALYTICS_CONFIGURACOES_FONTE @"/menu-configuracoes/alterar-fonte"
#define K_GOOGLE_ANALYTICS_CONFIGURACOES_TERMOS_USO @"/menu-configuracoes/termos-de-uso"
#define K_GOOGLE_ANALYTICS_CONFIGURACOES_POLITICA_PRIVACIDADE @"/menu-configuracoes/politica-privacidade"

#define K_GOOGLE_ANALYTICS_CATEGORY_NAVEGACAO @"Menu navegacao"
#define K_GOOGLE_ANALYTICS_CATEGORY_CONFIGURACOES @"Menu configuracoes"
#define K_GOOGLE_ANALYTICS_CATEGORY_VIDEOS @"Videos"
#define K_GOOGLE_ANALYTICS_CATEGORY_MATERIAS @"Materias"
#define K_GOOGLE_ANALYTICS_CATEGORY_FOTOGALERIAS @"Fotogalerias"

#define K_GOOGLE_ANALYTICS_ACTION_NAVEGACAO @"Exibe menu de navegacao"
#define K_GOOGLE_ANALYTICS_ACTION_INFORMAR_PROBLEMA @"Informar problema"
#define K_GOOGLE_ANALYTICS_ACTION_COMPARTILHAR @"Compartilhar"
#define K_GOOGLE_ANALYTICS_ACTION_AVALIAR_APP @"Avaliar aplicativo"
#define K_GOOGLE_ANALYTICS_ACTION_TOCAR @"Tocar"
#define K_GOOGLE_ANALYTICS_ACTION_NAVEGACAO_LATERAL @"Navegacao lateral"
#define K_GOOGLE_ANALYTICS_ACTION_TOQUE_THUMB @"Toque em thumb"

//---------------------------
// TIME
//---------------------------
#define K_PULL_TO_REFRESH_MINIMUM_TIME_IN_SECONDS 2.0


//---------------------------
// COLOR
//---------------------------
#define K_COLOR_MENU_GRAY [UIColor colorWithRed:240/255.f green:240/255.f blue:240/255.f alpha:1.0]


//---------------------------
// IMAGE
//---------------------------
#define K_IMAGE_API_SIZE @"/w107h60-PROP/"
#define K_IMAGE_BREAKING_NEWS_SIZE @"/w640h360-PROP/"
#define K_IMAGE_THUMB_SIZE @"/w311h175-PROP/"


//---------------------------
// FONT SIZE
//---------------------------
#define K_FONT_SIZE_SMALL 12.0
#define K_FONT_SIZE_REGULAR 15.0
#define K_FONT_SIZE_LARGE 18.0


//---------------------------
// NSUSERDEFAULTS KEYS
//---------------------------
#define K_KEY_FONT_SIZE @"fontSize"

//---------------------------
// EMAIL
//---------------------------
#define K_ALERT_TITLE_EMAIL_NOT_CONFIGURATE @"Não há e-mail cadastrado"
#define K_ALERT_TEXT_EMAIL_NOT_CONFIGURATE @"Você precisa configurar uma conta de e-mail em ajustes » Mail, Contatos, Calendários."

//---------------------------
// CHECK SYSTEM VERSION
//---------------------------
#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)