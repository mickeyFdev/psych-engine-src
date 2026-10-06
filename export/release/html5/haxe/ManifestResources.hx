package;

import haxe.io.Bytes;
import haxe.io.Path;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif (emscripten || webassembly)
			rootPath = "";
			#elseif (console || sys)
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_pixel_latin_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_vcr_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Ffonts%2Ffonts-go-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR2i45592R3y4:FONTy9:classNamey37:__ASSET__assets_fonts_pixel_latin_ttfR5y32:assets%2Ffonts%2Fpixel-latin.ttfR6tgoR2i75864R3R7R8y29:__ASSET__assets_fonts_vcr_ttfR5y24:assets%2Ffonts%2Fvcr.ttfR6tgoR0y43:assets%2Fshared%2Fcharacters%2Fbf-dead.jsonR2i709R3R4R5R13R6tgoR0y38:assets%2Fshared%2Fcharacters%2Fbf.jsonR2i2467R3R4R5R14R6tgoR0y38:assets%2Fshared%2Fcharacters%2Fgf.jsonR2i2326R3R4R5R15R6tgoR0y42:assets%2Fshared%2Fdata%2FcharacterList.txtR2i253R3R4R5R16R6tgoR0y38:assets%2Fshared%2Fdata%2FintroText.txtR2i2329R3R4R5R17R6tgoR0y35:assets%2Fshared%2Fdata%2Freadme.txtR2i223R3R4R5R18R6tgoR0y42:assets%2Fshared%2Fdata%2FspecialThanks.txtR2i300R3R4R5R19R6tgoR0y38:assets%2Fshared%2Fdata%2FstageList.txtR2i61R3R4R5R20R6tgoR0y63:assets%2Fshared%2Fimages%2Fachievements%2Ffriday_night_play.pngR2i7661R3y5:IMAGER5R21R6tgoR0y50:assets%2Fshared%2Fimages%2Fachievements%2Fhype.pngR2i23694R3R22R5R23R6tgoR0y63:assets%2Fshared%2Fimages%2Fachievements%2Flockedachievement.pngR2i1709R3R22R5R24R6tgoR0y57:assets%2Fshared%2Fimages%2Fachievements%2Foversinging.pngR2i19900R3R22R5R25R6tgoR0y53:assets%2Fshared%2Fimages%2Fachievements%2Ftoastie.pngR2i3094R3R22R5R26R6tgoR0y54:assets%2Fshared%2Fimages%2Fachievements%2Ftwo_keys.pngR2i27127R3R22R5R27R6tgoR0y52:assets%2Fshared%2Fimages%2Fachievements%2Fur_bad.pngR2i22017R3R22R5R28R6tgoR0y53:assets%2Fshared%2Fimages%2Fachievements%2Fur_good.pngR2i3467R3R22R5R29R6tgoR0y40:assets%2Fshared%2Fimages%2Falphabet.jsonR2i1643R3R4R5R30R6tgoR0y39:assets%2Fshared%2Fimages%2Falphabet.pngR2i358406R3R22R5R31R6tgoR0y39:assets%2Fshared%2Fimages%2Falphabet.xmlR2i105671R3R4R5R32R6tgoR0y51:assets%2Fshared%2Fimages%2Falphabet_playstation.pngR2i2717R3R22R5R33R6tgoR0y51:assets%2Fshared%2Fimages%2Falphabet_playstation.xmlR2i1209R3R4R5R34R6tgoR0y34:assets%2Fshared%2Fimages%2Fbad.pngR2i11727R3R22R5R35R6tgoR0y54:assets%2Fshared%2Fimages%2Fcampaign_menu_UI_assets.pngR2i3044R3R22R5R36R6tgoR0y54:assets%2Fshared%2Fimages%2Fcampaign_menu_UI_assets.xmlR2i597R3R4R5R37R6tgoR0y53:assets%2Fshared%2Fimages%2Fcharacters%2FBOYFRIEND.pngR2i1483134R3R22R5R38R6tgoR0y53:assets%2Fshared%2Fimages%2Fcharacters%2FBOYFRIEND.xmlR2i52069R3R4R5R39R6tgoR0y58:assets%2Fshared%2Fimages%2Fcharacters%2FBOYFRIEND_DEAD.pngR2i1950123R3R22R5R40R6tgoR0y58:assets%2Fshared%2Fimages%2Fcharacters%2FBOYFRIEND_DEAD.xmlR2i15438R3R4R5R41R6tgoR0y53:assets%2Fshared%2Fimages%2Fcharacters%2FGF_assets.pngR2i3597428R3R22R5R42R6tgoR0y53:assets%2Fshared%2Fimages%2Fcharacters%2FGF_assets.xmlR2i26238R3R4R5R43R6tgoR0y43:assets%2Fshared%2Fimages%2Fcheckboxanim.pngR2i16546R3R22R5R44R6tgoR0y43:assets%2Fshared%2Fimages%2Fcheckboxanim.xmlR2i1976R3R4R5R45R6tgoR0y36:assets%2Fshared%2Fimages%2Fcombo.pngR2i14255R3R22R5R46R6tgoR0y45:assets%2Fshared%2Fimages%2Fcontrollertype.pngR2i2153R3R22R5R47R6tgoR0y43:assets%2Fshared%2Fimages%2Fcredits%2Fbb.pngR2i5485R3R22R5R48R6tgoR0y47:assets%2Fshared%2Fimages%2Fcredits%2Fcheems.pngR2i8944R3R22R5R49R6tgoR0y51:assets%2Fshared%2Fimages%2Fcredits%2Fcrowplexus.pngR2i11150R3R22R5R50R6tgoR0y48:assets%2Fshared%2Fimages%2Fcredits%2Fdiscord.pngR2i1510R3R22R5R51R6tgoR0y49:assets%2Fshared%2Fimages%2Fcredits%2Fevilsk8r.pngR2i7497R3R22R5R52R6tgoR0y47:assets%2Fshared%2Fimages%2Fcredits%2Fflicky.pngR2i6462R3R22R5R53R6tgoR0y45:assets%2Fshared%2Fimages%2Fcredits%2Fkade.pngR2i9684R3R22R5R54R6tgoR0y49:assets%2Fshared%2Fimages%2Fcredits%2Fkamizeta.pngR2i12467R3R22R5R55R6tgoR0y52:assets%2Fshared%2Fimages%2Fcredits%2Fkawaisprite.pngR2i3953R3R22R5R56R6tgoR0y47:assets%2Fshared%2Fimages%2Fcredits%2Fkeoiki.pngR2i3918R3R22R5R57R6tgoR0y49:assets%2Fshared%2Fimages%2Fcredits%2Fmajigsaw.pngR2i7891R3R22R5R58R6tgoR0y51:assets%2Fshared%2Fimages%2Fcredits%2Fmastereric.pngR2i11899R3R22R5R59R6tgoR0y49:assets%2Fshared%2Fimages%2Fcredits%2Fmaxneton.pngR2i9651R3R22R5R60R6tgoR0y53:assets%2Fshared%2Fimages%2Fcredits%2Fmissing_icon.pngR2i4039R3R22R5R61R6tgoR0y54:assets%2Fshared%2Fimages%2Fcredits%2Fninjamuffin99.pngR2i5850R3R22R5R62R6tgoR0y54:assets%2Fshared%2Fimages%2Fcredits%2Fphantomarcade.pngR2i9615R3R22R5R63R6tgoR0y48:assets%2Fshared%2Fimages%2Fcredits%2Friveren.pngR2i12824R3R22R5R64R6tgoR0y52:assets%2Fshared%2Fimages%2Fcredits%2Fshadowmario.pngR2i3679R3R22R5R65R6tgoR0y47:assets%2Fshared%2Fimages%2Fcredits%2Fsqirra.pngR2i8258R3R22R5R66R6tgoR0y54:assets%2Fshared%2Fimages%2Fcredits%2Fsuperpowers04.pngR2i11585R3R22R5R67R6tgoR0y45:assets%2Fshared%2Fimages%2Fdialogue%2Fbf.jsonR2i987R3R4R5R68R6tgoR0y53:assets%2Fshared%2Fimages%2Fdialogue%2FBF_Dialogue.pngR2i540363R3R22R5R69R6tgoR0y53:assets%2Fshared%2Fimages%2Fdialogue%2FBF_Dialogue.xmlR2i4980R3R4R5R70R6tgoR0y45:assets%2Fshared%2Fimages%2Fdialogue%2Fgf.jsonR2i807R3R4R5R71R6tgoR0y53:assets%2Fshared%2Fimages%2Fdialogue%2FGF_Dialogue.pngR2i396276R3R22R5R72R6tgoR0y53:assets%2Fshared%2Fimages%2Fdialogue%2FGF_Dialogue.xmlR2i5287R3R4R5R73R6tgoR0y49:assets%2Fshared%2Fimages%2Feditors%2Fautosave.pngR2i1157R3R22R5R74R6tgoR0y50:assets%2Fshared%2Fimages%2Feditors%2FeventIcon.pngR2i8264R3R22R5R75R6tgoR0y53:assets%2Fshared%2Fimages%2Feditors%2FsilhouetteBF.pngR2i12088R3R22R5R76R6tgoR0y54:assets%2Fshared%2Fimages%2Feditors%2FsilhouetteDad.pngR2i22004R3R22R5R77R6tgoR0y57:assets%2Fshared%2Fimages%2Feditors%2Fvortex_indicator.pngR2i815R3R22R5R78R6tgoR0y37:assets%2Fshared%2Fimages%2Ffunkay.pngR2i367940R3R22R5R79R6tgoR0y44:assets%2Fshared%2Fimages%2FgfDanceTitle.jsonR2i324R3R4R5R80R6tgoR0y43:assets%2Fshared%2Fimages%2FgfDanceTitle.pngR2i745426R3R22R5R81R6tgoR0y43:assets%2Fshared%2Fimages%2FgfDanceTitle.xmlR2i4259R3R4R5R82R6tgoR0y33:assets%2Fshared%2Fimages%2Fgo.pngR2i5889R3R22R5R83R6tgoR0y35:assets%2Fshared%2Fimages%2Fgood.pngR2i11923R3R22R5R84R6tgoR0y40:assets%2Fshared%2Fimages%2FhealthBar.pngR2i551R3R22R5R85R6tgoR0y46:assets%2Fshared%2Fimages%2Ficons%2Ficon-bf.pngR2i14607R3R22R5R86R6tgoR0y47:assets%2Fshared%2Fimages%2Ficons%2Ficon-dad.pngR2i12384R3R22R5R87R6tgoR0y48:assets%2Fshared%2Fimages%2Ficons%2Ficon-face.pngR2i3549R3R22R5R88R6tgoR0y46:assets%2Fshared%2Fimages%2Ficons%2Ficon-gf.pngR2i10205R3R22R5R89R6tgoR0y52:assets%2Fshared%2Fimages%2Floading_screen%2Ficon.pngR2i55787R3R22R5R90R6tgoR0y52:assets%2Fshared%2Fimages%2Floading_screen%2Flogo.pngR2i236431R3R22R5R91R6tgoR0y53:assets%2Fshared%2Fimages%2Floading_screen%2Fpessy.pngR2i2435627R3R22R5R92R6tgoR0y53:assets%2Fshared%2Fimages%2Floading_screen%2Fpessy.xmlR2i15878R3R4R5R93R6tgoR0y41:assets%2Fshared%2Fimages%2FlogoBumpin.pngR2i578147R3R22R5R94R6tgoR0y41:assets%2Fshared%2Fimages%2FlogoBumpin.xmlR2i2177R3R4R5R95R6tgoR0y59:assets%2Fshared%2Fimages%2Fmainmenu%2Fmenu_achievements.pngR2i152399R3R22R5R96R6tgoR0y59:assets%2Fshared%2Fimages%2Fmainmenu%2Fmenu_achievements.xmlR2i2621R3R4R5R97R6tgoR0y54:assets%2Fshared%2Fimages%2Fmainmenu%2Fmenu_credits.pngR2i67411R3R22R5R98R6tgoR0y54:assets%2Fshared%2Fimages%2Fmainmenu%2Fmenu_credits.xmlR2i1339R3R4R5R99R6tgoR0y55:assets%2Fshared%2Fimages%2Fmainmenu%2Fmenu_freeplay.pngR2i68922R3R22R5R100R6tgoR0y55:assets%2Fshared%2Fimages%2Fmainmenu%2Fmenu_freeplay.xmlR2i1345R3R4R5R101R6tgoR0y51:assets%2Fshared%2Fimages%2Fmainmenu%2Fmenu_mods.pngR2i49276R3R22R5R102R6tgoR0y51:assets%2Fshared%2Fimages%2Fmainmenu%2Fmenu_mods.xmlR2i1699R3R4R5R103R6tgoR0y54:assets%2Fshared%2Fimages%2Fmainmenu%2Fmenu_options.pngR2i124798R3R22R5R104R6tgoR0y54:assets%2Fshared%2Fimages%2Fmainmenu%2Fmenu_options.xmlR2i2392R3R4R5R105R6tgoR0y57:assets%2Fshared%2Fimages%2Fmainmenu%2Fmenu_story_mode.pngR2i99201R3R22R5R106R6tgoR0y57:assets%2Fshared%2Fimages%2Fmainmenu%2Fmenu_story_mode.xmlR2i1370R3R4R5R107R6tgoR0y55:assets%2Fshared%2Fimages%2Fmenubackgrounds%2Freadme.txtR2i121R3R4R5R108R6tgoR0y37:assets%2Fshared%2Fimages%2FmenuBG.pngR2i474435R3R22R5R109R6tgoR0y41:assets%2Fshared%2Fimages%2FmenuBGBlue.pngR2i454823R3R22R5R110R6tgoR0y44:assets%2Fshared%2Fimages%2FmenuBGMagenta.pngR2i446604R3R22R5R111R6tgoR0y51:assets%2Fshared%2Fimages%2Fmenucharacters%2Fbf.jsonR2i148R3R4R5R112R6tgoR0y51:assets%2Fshared%2Fimages%2Fmenucharacters%2Fgf.jsonR2i148R3R4R5R113R6tgoR0y55:assets%2Fshared%2Fimages%2Fmenucharacters%2FMenu_BF.pngR2i231974R3R22R5R114R6tgoR0y55:assets%2Fshared%2Fimages%2Fmenucharacters%2FMenu_BF.xmlR2i5582R3R4R5R115R6tgoR0y55:assets%2Fshared%2Fimages%2Fmenucharacters%2FMenu_GF.pngR2i314273R3R22R5R116R6tgoR0y55:assets%2Fshared%2Fimages%2Fmenucharacters%2FMenu_GF.xmlR2i3802R3R4R5R117R6tgoR0y40:assets%2Fshared%2Fimages%2FmenuDesat.pngR2i215613R3R22R5R118R6tgoR0y54:assets%2Fshared%2Fimages%2Fmenudifficulties%2Feasy.pngR2i3453R3R22R5R119R6tgoR0y54:assets%2Fshared%2Fimages%2Fmenudifficulties%2Fhard.pngR2i3880R3R22R5R120R6tgoR0y56:assets%2Fshared%2Fimages%2Fmenudifficulties%2Fnormal.pngR2i4853R3R22R5R121R6tgoR0y42:assets%2Fshared%2Fimages%2FMenu_Tracks.pngR2i1254R3R22R5R122R6tgoR0y46:assets%2Fshared%2Fimages%2FmodsMenuButtons.pngR2i2975R3R22R5R123R6tgoR0y46:assets%2Fshared%2Fimages%2Fnewgrounds_logo.pngR2i40016R3R22R5R124R6tgoR0y57:assets%2Fshared%2Fimages%2FnoteColorMenu%2FcolorWheel.pngR2i83362R3R22R5R125R6tgoR0y51:assets%2Fshared%2Fimages%2FnoteColorMenu%2Fcopy.pngR2i1684R3R22R5R126R6tgoR0y51:assets%2Fshared%2Fimages%2FnoteColorMenu%2Fnote.pngR2i11625R3R22R5R127R6tgoR0y56:assets%2Fshared%2Fimages%2FnoteColorMenu%2FnotePixel.pngR2i429R3R22R5R128R6tgoR0y54:assets%2Fshared%2Fimages%2FnoteColorMenu%2Fpalette.pngR2i288R3R22R5R129R6tgoR0y52:assets%2Fshared%2Fimages%2FnoteColorMenu%2Fpaste.pngR2i1518R3R22R5R130R6tgoR0y47:assets%2Fshared%2Fimages%2FnoteSkins%2Flist.txtR2i11R3R4R5R131R6tgoR0y59:assets%2Fshared%2Fimages%2FnoteSkins%2FNOTE_assets-chip.pngR2i169067R3R22R5R132R6tgoR0y59:assets%2Fshared%2Fimages%2FnoteSkins%2FNOTE_assets-chip.xmlR2i4866R3R4R5R133R6tgoR0y61:assets%2Fshared%2Fimages%2FnoteSkins%2FNOTE_assets-future.pngR2i571497R3R22R5R134R6tgoR0y61:assets%2Fshared%2Fimages%2FnoteSkins%2FNOTE_assets-future.xmlR2i4929R3R4R5R135R6tgoR0y54:assets%2Fshared%2Fimages%2FnoteSkins%2FNOTE_assets.pngR2i653659R3R22R5R136R6tgoR0y54:assets%2Fshared%2Fimages%2FnoteSkins%2FNOTE_assets.xmlR2i4913R3R4R5R137R6tgoR0y50:assets%2Fshared%2Fimages%2FnoteSplashes%2Flist.txtR2i33R3R4R5R138R6tgoR0y67:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes-diamond.jsonR2i1583R3R4R5R139R6tgoR0y66:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes-diamond.pngR2i32456R3R22R5R140R6tgoR0y66:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes-diamond.xmlR2i4415R3R4R5R141R6tgoR0y68:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes-electric.jsonR2i806R3R4R5R142R6tgoR0y67:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes-electric.pngR2i26326R3R22R5R143R6tgoR0y67:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes-electric.xmlR2i2584R3R4R5R144R6tgoR0y68:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes-sparkles.jsonR2i809R3R4R5R145R6tgoR0y67:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes-sparkles.pngR2i22341R3R22R5R146R6tgoR0y67:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes-sparkles.xmlR2i2596R3R4R5R147R6tgoR0y67:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes-vanilla.jsonR2i1543R3R4R5R148R6tgoR0y66:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes-vanilla.pngR2i184255R3R22R5R149R6tgoR0y66:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes-vanilla.xmlR2i4725R3R4R5R150R6tgoR0y59:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes.jsonR2i1519R3R4R5R151R6tgoR0y58:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes.pngR2i33060R3R22R5R152R6tgoR0y58:assets%2Fshared%2Fimages%2FnoteSplashes%2FnoteSplashes.xmlR2i4383R3R4R5R153R6tgoR0y35:assets%2Fshared%2Fimages%2Fnum0.pngR2i1816R3R22R5R154R6tgoR0y35:assets%2Fshared%2Fimages%2Fnum1.pngR2i1779R3R22R5R155R6tgoR0y35:assets%2Fshared%2Fimages%2Fnum2.pngR2i1985R3R22R5R156R6tgoR0y35:assets%2Fshared%2Fimages%2Fnum3.pngR2i1990R3R22R5R157R6tgoR0y35:assets%2Fshared%2Fimages%2Fnum4.pngR2i1955R3R22R5R158R6tgoR0y35:assets%2Fshared%2Fimages%2Fnum5.pngR2i2023R3R22R5R159R6tgoR0y35:assets%2Fshared%2Fimages%2Fnum6.pngR2i2082R3R22R5R160R6tgoR0y35:assets%2Fshared%2Fimages%2Fnum7.pngR2i1881R3R22R5R161R6tgoR0y35:assets%2Fshared%2Fimages%2Fnum8.pngR2i2024R3R22R5R162R6tgoR0y35:assets%2Fshared%2Fimages%2Fnum9.pngR2i1851R3R22R5R163R6tgoR0y50:assets%2Fshared%2Fimages%2FpixelUI%2Fbad-pixel.pngR2i228R3R22R5R164R6tgoR0y52:assets%2Fshared%2Fimages%2FpixelUI%2Fcombo-pixel.pngR2i247R3R22R5R165R6tgoR0y51:assets%2Fshared%2Fimages%2FpixelUI%2Fdate-pixel.pngR2i518R3R22R5R166R6tgoR0y51:assets%2Fshared%2Fimages%2FpixelUI%2Fgood-pixel.pngR2i237R3R22R5R167R6tgoR0y69:assets%2Fshared%2Fimages%2FpixelUI%2FnoteSkins%2FNOTE_assets-chip.pngR2i1480R3R22R5R168R6tgoR0y71:assets%2Fshared%2Fimages%2FpixelUI%2FnoteSkins%2FNOTE_assets-future.pngR2i2351R3R22R5R169R6tgoR0y64:assets%2Fshared%2Fimages%2FpixelUI%2FnoteSkins%2FNOTE_assets.pngR2i3337R3R22R5R170R6tgoR0y73:assets%2Fshared%2Fimages%2FpixelUI%2FnoteSkins%2FNOTE_assetsENDS-chip.pngR2i246R3R22R5R171R6tgoR0y75:assets%2Fshared%2Fimages%2FpixelUI%2FnoteSkins%2FNOTE_assetsENDS-future.pngR2i258R3R22R5R172R6tgoR0y68:assets%2Fshared%2Fimages%2FpixelUI%2FnoteSkins%2FNOTE_assetsENDS.pngR2i202R3R22R5R173R6tgoR0y51:assets%2Fshared%2Fimages%2FpixelUI%2Fnum0-pixel.pngR2i132R3R22R5R174R6tgoR0y51:assets%2Fshared%2Fimages%2FpixelUI%2Fnum1-pixel.pngR2i160R3R22R5R175R6tgoR0y51:assets%2Fshared%2Fimages%2FpixelUI%2Fnum2-pixel.pngR2i139R3R22R5R176R6tgoR0y51:assets%2Fshared%2Fimages%2FpixelUI%2Fnum3-pixel.pngR2i137R3R22R5R177R6tgoR0y51:assets%2Fshared%2Fimages%2FpixelUI%2Fnum4-pixel.pngR2i132R3R22R5R178R6tgoR0y51:assets%2Fshared%2Fimages%2FpixelUI%2Fnum5-pixel.pngR2i135R3R22R5R179R6tgoR0y51:assets%2Fshared%2Fimages%2FpixelUI%2Fnum6-pixel.pngR2i138R3R22R5R180R6tgoR0y51:assets%2Fshared%2Fimages%2FpixelUI%2Fnum7-pixel.pngR2i141R3R22R5R181R6tgoR0y51:assets%2Fshared%2Fimages%2FpixelUI%2Fnum8-pixel.pngR2i129R3R22R5R182R6tgoR0y51:assets%2Fshared%2Fimages%2FpixelUI%2Fnum9-pixel.pngR2i127R3R22R5R183R6tgoR0y52:assets%2Fshared%2Fimages%2FpixelUI%2Fready-pixel.pngR2i531R3R22R5R184R6tgoR0y50:assets%2Fshared%2Fimages%2FpixelUI%2Fset-pixel.pngR2i485R3R22R5R185R6tgoR0y51:assets%2Fshared%2Fimages%2FpixelUI%2Fshit-pixel.pngR2i292R3R22R5R186R6tgoR0y51:assets%2Fshared%2Fimages%2FpixelUI%2Fsick-pixel.pngR2i307R3R22R5R187R6tgoR0y36:assets%2Fshared%2Fimages%2Fready.pngR2i28966R3R22R5R188R6tgoR0y34:assets%2Fshared%2Fimages%2Fset.pngR2i25471R3R22R5R189R6tgoR0y35:assets%2Fshared%2Fimages%2Fshit.pngR2i15319R3R22R5R190R6tgoR0y35:assets%2Fshared%2Fimages%2Fsick.pngR2i19249R3R22R5R191R6tgoR0y44:assets%2Fshared%2Fimages%2Fspeech_bubble.pngR2i189234R3R22R5R192R6tgoR0y44:assets%2Fshared%2Fimages%2Fspeech_bubble.xmlR2i9686R3R4R5R193R6tgoR0y49:assets%2Fshared%2Fimages%2Fstorymenu%2Freadme.txtR2i87R3R4R5R194R6tgoR0y38:assets%2Fshared%2Fimages%2FtimeBar.pngR2i367R3R22R5R195R6tgoR0y41:assets%2Fshared%2Fimages%2FtitleEnter.pngR2i26291R3R22R5R196R6tgoR0y41:assets%2Fshared%2Fimages%2FtitleEnter.xmlR2i518R3R4R5R197R6tgoR0y41:assets%2Fshared%2Fimages%2FunknownMod.pngR2i2387R3R22R5R198R6tgoR2i2400129R3y5:MUSICR5y39:assets%2Fshared%2Fmusic%2Fbreakfast.mp3y9:pathGroupaR200hR6tgoR2i2309657R3R199R5y40:assets%2Fshared%2Fmusic%2FfreakyMenu.mp3R201aR202hR6tgoR2i1535999R3R199R5y38:assets%2Fshared%2Fmusic%2FgameOver.mp3R201aR203hR6tgoR2i288391R3R199R5y41:assets%2Fshared%2Fmusic%2FgameOverEnd.mp3R201aR204hR6tgoR2i2402257R3R199R5y40:assets%2Fshared%2Fmusic%2FoffsetSong.mp3R201aR205hR6tgoR2i9693555R3R199R5y38:assets%2Fshared%2Fmusic%2Ftea-time.mp3R201aR206hR6tgoR2i2418R3R199R5y36:assets%2Fshared%2Fsounds%2FANGRY.mp3R201aR207hR6tgoR2i43182R3R199R5y45:assets%2Fshared%2Fsounds%2FANGRY_TEXT_BOX.mp3R201aR208hR6tgoR2i34480R3R199R5y40:assets%2Fshared%2Fsounds%2Fbadnoise1.mp3R201aR209hR6tgoR2i34480R3R199R5y40:assets%2Fshared%2Fsounds%2Fbadnoise2.mp3R201aR210hR6tgoR2i34480R3R199R5y40:assets%2Fshared%2Fsounds%2Fbadnoise3.mp3R201aR211hR6tgoR2i17762R3R199R5y41:assets%2Fshared%2Fsounds%2FcancelMenu.mp3R201aR212hR6tgoR2i5888R3R199R5y40:assets%2Fshared%2Fsounds%2FclickText.mp3R201aR213hR6tgoR2i91950R3R199R5y42:assets%2Fshared%2Fsounds%2FconfirmMenu.mp3R201aR214hR6tgoR2i7351R3R199R5y39:assets%2Fshared%2Fsounds%2Fdialogue.mp3R201aR215hR6tgoR2i13620R3R199R5y44:assets%2Fshared%2Fsounds%2FdialogueClose.mp3R201aR216hR6tgoR2i83302R3R199R5y43:assets%2Fshared%2Fsounds%2Ffnf_loss_sfx.mp3R201aR217hR6tgoR2i34480R3R199R5y35:assets%2Fshared%2Fsounds%2FGF_1.mp3R201aR218hR6tgoR2i34480R3R199R5y35:assets%2Fshared%2Fsounds%2FGF_2.mp3R201aR219hR6tgoR2i34480R3R199R5y35:assets%2Fshared%2Fsounds%2FGF_3.mp3R201aR220hR6tgoR2i34480R3R199R5y35:assets%2Fshared%2Fsounds%2FGF_4.mp3R201aR221hR6tgoR2i8358R3R199R5y39:assets%2Fshared%2Fsounds%2Fhitsound.mp3R201aR222hR6tgoR2i9155R3R199R5y43:assets%2Fshared%2Fsounds%2Fintro1-pixel.mp3R201aR223hR6tgoR2i11426R3R199R5y37:assets%2Fshared%2Fsounds%2Fintro1.mp3R201aR224hR6tgoR2i9912R3R199R5y43:assets%2Fshared%2Fsounds%2Fintro2-pixel.mp3R201aR225hR6tgoR2i12051R3R199R5y37:assets%2Fshared%2Fsounds%2Fintro2.mp3R201aR226hR6tgoR2i9128R3R199R5y43:assets%2Fshared%2Fsounds%2Fintro3-pixel.mp3R201aR227hR6tgoR2i11582R3R199R5y37:assets%2Fshared%2Fsounds%2Fintro3.mp3R201aR228hR6tgoR2i21651R3R199R5y44:assets%2Fshared%2Fsounds%2FintroGo-pixel.mp3R201aR229hR6tgoR2i13254R3R199R5y38:assets%2Fshared%2Fsounds%2FintroGo.mp3R201aR230hR6tgoR2i6268R3R199R5y45:assets%2Fshared%2Fsounds%2FMetronome_Tick.mp3R201aR231hR6tgoR2i68962R3R199R5y40:assets%2Fshared%2Fsounds%2Fmissnote1.mp3R201aR232hR6tgoR2i68962R3R199R5y40:assets%2Fshared%2Fsounds%2Fmissnote2.mp3R201aR233hR6tgoR2i68962R3R199R5y40:assets%2Fshared%2Fsounds%2Fmissnote3.mp3R201aR234hR6tgoR2i17762R3R199R5y41:assets%2Fshared%2Fsounds%2FscrollMenu.mp3R201aR235hR6tgoR2i42970R3R199R5y37:assets%2Fshared%2Fsounds%2Fsecret.mp3R201aR236hR6tgoR0y45:assets%2Fshared%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R237R6tgoR2i320854R3R199R5y40:assets%2Fshared%2Fsounds%2FsoundTest.mp3R201aR238hR6tgoR0y37:assets%2Fshared%2Fstages%2Freadme.txtR2i31R3R4R5R239R6tgoR0y38:assets%2Fshared%2Fweeks%2FweekList.txtR2i59R3R4R5R240R6tgoR0y51:assets%2Fembed%2Fimages%2Fpsych-ui%2Farrow_down.pngR2i271R3R22R5R241R6tgoR0y49:assets%2Fembed%2Fimages%2Fpsych-ui%2Farrow_up.pngR2i275R3R22R5R242R6tgoR0y49:assets%2Fembed%2Fimages%2Fpsych-ui%2Fcheckbox.pngR2i206R3R22R5R243R6tgoR0y56:assets%2Fembed%2Fimages%2Fpsych-ui%2Fdropdown_button.pngR2i226R3R22R5R244R6tgoR0y46:assets%2Fembed%2Fimages%2Fpsych-ui%2Fradio.pngR2i257R3R22R5R245R6tgoR0y54:assets%2Fembed%2Fimages%2Fpsych-ui%2Fstepper_minus.pngR2i167R3R22R5R246R6tgoR0y53:assets%2Fembed%2Fimages%2Fpsych-ui%2Fstepper_plus.pngR2i177R3R22R5R247R6tgoR0y27:assets%2Fsongs%2Freadme.txtR2i115R3R4R5R248R6tgoR0y19:assets%2Freadme.txtR2i407R3R4R5R249R6tgoR0y35:assets%2Fshared%2Fdata%2Fpt-BR.langR2i12493R3R4R5R250R6tgoR0y62:assets%2Fshared%2Fimages%2Fpt-BR%2Fmainmenu%2Fmenu_credits.pngR2i75937R3R22R5R251R6tgoR0y62:assets%2Fshared%2Fimages%2Fpt-BR%2Fmainmenu%2Fmenu_credits.xmlR2i1344R3R4R5R252R6tgoR0y65:assets%2Fshared%2Fimages%2Fpt-BR%2Fmainmenu%2Fmenu_story_mode.pngR2i104675R3R22R5R253R6tgoR0y65:assets%2Fshared%2Fimages%2Fpt-BR%2Fmainmenu%2Fmenu_story_mode.xmlR2i1381R3R4R5R254R6tgoR0y62:assets%2Fshared%2Fimages%2Fpt-BR%2Fmenudifficulties%2Feasy.pngR2i3656R3R22R5R255R6tgoR0y62:assets%2Fshared%2Fimages%2Fpt-BR%2Fmenudifficulties%2Fhard.pngR2i4514R3R22R5R256R6tgoR0y50:assets%2Fshared%2Fimages%2Fpt-BR%2FMenu_Tracks.pngR2i1885R3R22R5R257R6tgoR0y21:do%20NOT%20readme.txtR2i4326R3R4R5R258R6tgoR2i8220R3R199R5y26:flixel%2Fsounds%2Fbeep.mp3R201aR259y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R199R5y28:flixel%2Fsounds%2Fflixel.mp3R201aR261y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i6840R3y5:SOUNDR5R260R201aR259R260hgoR2i33629R3R263R5R262R201aR261R262hgoR2i15744R3R7R8y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R7R8y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i248R3R22R5R268R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i505R3R22R5R269R6tgoR0y42:flixel%2Fimages%2Ftransitions%2Fcircle.pngR2i824R3R22R5R270R6tgoR0y53:flixel%2Fimages%2Ftransitions%2Fdiagonal_gradient.pngR2i3812R3R22R5R271R6tgoR0y43:flixel%2Fimages%2Ftransitions%2Fdiamond.pngR2i788R3R22R5R272R6tgoR0y42:flixel%2Fimages%2Ftransitions%2Fsquare.pngR2i383R3R22R5R273R6tgoR0y31:flxanimate%2Fimages%2Fpivot.pngR2i300R3R22R5R274R6tgoR0y35:flxanimate%2Fimages%2Findicator.pngR2i129R3R22R5R275R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

	}


}

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_fonts_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_pixel_latin_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_characters_bf_dead_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_characters_bf_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_characters_gf_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_data_characterlist_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_data_introtext_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_data_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_data_specialthanks_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_data_stagelist_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_friday_night_play_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_hype_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_lockedachievement_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_oversinging_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_toastie_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_two_keys_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_ur_bad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_ur_good_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_alphabet_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_alphabet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_alphabet_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_alphabet_playstation_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_alphabet_playstation_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_bad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_campaign_menu_ui_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_campaign_menu_ui_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_dead_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_dead_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_checkboxanim_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_checkboxanim_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_combo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_controllertype_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_bb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_cheems_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_crowplexus_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_discord_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_evilsk8r_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_flicky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_kade_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_kamizeta_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_kawaisprite_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_keoiki_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_majigsaw_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_mastereric_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_maxneton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_missing_icon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_ninjamuffin99_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_phantomarcade_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_riveren_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_shadowmario_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_sqirra_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_superpowers04_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bf_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bf_dialogue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bf_dialogue_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_gf_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_gf_dialogue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_gf_dialogue_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_editors_autosave_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_editors_eventicon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_editors_silhouettebf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_editors_silhouettedad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_editors_vortex_indicator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_funkay_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_gfdancetitle_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_gfdancetitle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_gfdancetitle_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_go_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_good_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_healthbar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_icon_bf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_icon_dad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_icon_face_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_icon_gf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_loading_screen_icon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_loading_screen_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_loading_screen_pessy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_loading_screen_pessy_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_logobumpin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_logobumpin_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_achievements_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_achievements_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_credits_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_credits_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_freeplay_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_freeplay_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_mods_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_mods_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_options_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_options_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_story_mode_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_story_mode_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menubackgrounds_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menubg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menubgblue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menubgmagenta_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_bf_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_gf_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_bf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_bf_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_gf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_gf_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menudesat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menudifficulties_easy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menudifficulties_hard_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menudifficulties_normal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menu_tracks_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_modsmenubuttons_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_newgrounds_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notecolormenu_colorwheel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notecolormenu_copy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notecolormenu_note_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notecolormenu_notepixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notecolormenu_palette_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notecolormenu_paste_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_noteskins_list_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_noteskins_note_assets_chip_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_noteskins_note_assets_chip_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_noteskins_note_assets_future_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_noteskins_note_assets_future_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_noteskins_note_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_noteskins_note_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_list_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_diamond_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_diamond_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_diamond_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_electric_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_electric_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_electric_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_sparkles_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_sparkles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_sparkles_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_vanilla_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_vanilla_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_vanilla_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_num0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_num1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_num2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_num3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_num4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_num5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_num6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_num7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_num8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_num9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_bad_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_combo_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_date_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_good_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_noteskins_note_assets_chip_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_noteskins_note_assets_future_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_noteskins_note_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_noteskins_note_assetsends_chip_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_noteskins_note_assetsends_future_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_noteskins_note_assetsends_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num0_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num1_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num2_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num3_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num4_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num5_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num6_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num7_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num8_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num9_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_ready_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_set_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_shit_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_sick_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_ready_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_set_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_shit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_sick_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_speech_bubble_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_speech_bubble_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_storymenu_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_timebar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_titleenter_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_titleenter_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_unknownmod_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_breakfast_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_freakymenu_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameover_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameoverend_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_offsetsong_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_tea_time_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_angry_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_angry_text_box_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_cancelmenu_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_clicktext_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_confirmmenu_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_dialogue_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_dialogueclose_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_fnf_loss_sfx_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_4_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_hitsound_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro1_pixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro2_pixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro3_pixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_introgo_pixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_introgo_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_metronome_tick_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_scrollmenu_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_secret_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_soundtest_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_stages_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_weeks_weeklist_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_embed_images_psych_ui_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_embed_images_psych_ui_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_embed_images_psych_ui_checkbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_embed_images_psych_ui_dropdown_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_embed_images_psych_ui_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_embed_images_psych_ui_stepper_minus_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_embed_images_psych_ui_stepper_plus_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_data_pt_br_lang extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pt_br_mainmenu_menu_credits_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pt_br_mainmenu_menu_credits_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pt_br_mainmenu_menu_story_mode_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pt_br_mainmenu_menu_story_mode_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pt_br_menudifficulties_easy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pt_br_menudifficulties_hard_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pt_br_menu_tracks_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__do_not_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_circle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diagonal_gradient_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diamond_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_square_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flxanimate_images_pivot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flxanimate_images_indicator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/fonts/fonts-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_fonts_fonts_go_here_txt extends haxe.io.Bytes {}
@:keep @:font("export/release/html5/obj/webfont/pixel-latin.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_pixel_latin_ttf extends lime.text.Font {}
@:keep @:font("export/release/html5/obj/webfont/vcr.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends lime.text.Font {}
@:keep @:file("assets/shared/characters/bf-dead.json") @:noCompletion #if display private #end class __ASSET__assets_shared_characters_bf_dead_json extends haxe.io.Bytes {}
@:keep @:file("assets/shared/characters/bf.json") @:noCompletion #if display private #end class __ASSET__assets_shared_characters_bf_json extends haxe.io.Bytes {}
@:keep @:file("assets/shared/characters/gf.json") @:noCompletion #if display private #end class __ASSET__assets_shared_characters_gf_json extends haxe.io.Bytes {}
@:keep @:file("assets/shared/data/characterList.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_data_characterlist_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/data/introText.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_data_introtext_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/data/readme.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_data_readme_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/data/specialThanks.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_data_specialthanks_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/data/stageList.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_data_stagelist_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/achievements/friday_night_play.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_friday_night_play_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/achievements/hype.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_hype_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/achievements/lockedachievement.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_lockedachievement_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/achievements/oversinging.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_oversinging_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/achievements/toastie.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_toastie_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/achievements/two_keys.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_two_keys_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/achievements/ur_bad.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_ur_bad_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/achievements/ur_good.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_achievements_ur_good_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/alphabet.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_alphabet_json extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/alphabet.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_alphabet_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/alphabet.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_alphabet_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/alphabet_playstation.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_alphabet_playstation_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/alphabet_playstation.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_alphabet_playstation_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/bad.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_bad_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/campaign_menu_UI_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_campaign_menu_ui_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/campaign_menu_UI_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_campaign_menu_ui_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/BOYFRIEND.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/BOYFRIEND.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/BOYFRIEND_DEAD.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_dead_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/BOYFRIEND_DEAD.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_dead_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/GF_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/GF_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/checkboxanim.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_checkboxanim_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/checkboxanim.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_checkboxanim_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/combo.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_combo_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/controllertype.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_controllertype_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/bb.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_bb_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/cheems.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_cheems_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/crowplexus.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_crowplexus_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/discord.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_discord_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/evilsk8r.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_evilsk8r_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/flicky.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_flicky_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/kade.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_kade_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/kamizeta.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_kamizeta_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/kawaisprite.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_kawaisprite_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/keoiki.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_keoiki_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/majigsaw.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_majigsaw_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/mastereric.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_mastereric_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/maxneton.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_maxneton_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/missing_icon.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_missing_icon_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/ninjamuffin99.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_ninjamuffin99_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/phantomarcade.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_phantomarcade_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/riveren.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_riveren_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/shadowmario.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_shadowmario_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/sqirra.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_sqirra_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/credits/superpowers04.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_credits_superpowers04_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/dialogue/bf.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bf_json extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/dialogue/BF_Dialogue.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bf_dialogue_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/dialogue/BF_Dialogue.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bf_dialogue_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/dialogue/gf.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_gf_json extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/dialogue/GF_Dialogue.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_gf_dialogue_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/dialogue/GF_Dialogue.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_gf_dialogue_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/editors/autosave.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_editors_autosave_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/editors/eventIcon.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_editors_eventicon_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/editors/silhouetteBF.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_editors_silhouettebf_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/editors/silhouetteDad.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_editors_silhouettedad_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/editors/vortex_indicator.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_editors_vortex_indicator_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/funkay.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_funkay_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/gfDanceTitle.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_gfdancetitle_json extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/gfDanceTitle.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_gfdancetitle_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/gfDanceTitle.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_gfdancetitle_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/go.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_go_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/good.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_good_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/healthBar.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_healthbar_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/icons/icon-bf.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_icon_bf_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/icons/icon-dad.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_icon_dad_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/icons/icon-face.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_icon_face_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/icons/icon-gf.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_icon_gf_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/loading_screen/icon.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_loading_screen_icon_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/loading_screen/logo.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_loading_screen_logo_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/loading_screen/pessy.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_loading_screen_pessy_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/loading_screen/pessy.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_loading_screen_pessy_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/logoBumpin.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_logobumpin_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/logoBumpin.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_logobumpin_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/mainmenu/menu_achievements.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_achievements_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/mainmenu/menu_achievements.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_achievements_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/mainmenu/menu_credits.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_credits_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/mainmenu/menu_credits.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_credits_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/mainmenu/menu_freeplay.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_freeplay_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/mainmenu/menu_freeplay.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_freeplay_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/mainmenu/menu_mods.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_mods_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/mainmenu/menu_mods.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_mods_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/mainmenu/menu_options.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_options_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/mainmenu/menu_options.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_options_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/mainmenu/menu_story_mode.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_story_mode_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/mainmenu/menu_story_mode.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_mainmenu_menu_story_mode_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/menubackgrounds/readme.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menubackgrounds_readme_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/menuBG.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menubg_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/menuBGBlue.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menubgblue_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/menuBGMagenta.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menubgmagenta_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/menucharacters/bf.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_bf_json extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/menucharacters/gf.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_gf_json extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/menucharacters/Menu_BF.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_bf_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/menucharacters/Menu_BF.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_bf_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/menucharacters/Menu_GF.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_gf_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/menucharacters/Menu_GF.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_gf_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/menuDesat.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menudesat_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/menudifficulties/easy.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menudifficulties_easy_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/menudifficulties/hard.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menudifficulties_hard_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/menudifficulties/normal.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menudifficulties_normal_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/Menu_Tracks.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menu_tracks_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/modsMenuButtons.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_modsmenubuttons_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/newgrounds_logo.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_newgrounds_logo_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/noteColorMenu/colorWheel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notecolormenu_colorwheel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/noteColorMenu/copy.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notecolormenu_copy_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/noteColorMenu/note.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notecolormenu_note_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/noteColorMenu/notePixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notecolormenu_notepixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/noteColorMenu/palette.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notecolormenu_palette_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/noteColorMenu/paste.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notecolormenu_paste_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/noteSkins/list.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_noteskins_list_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/noteSkins/NOTE_assets-chip.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_noteskins_note_assets_chip_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/noteSkins/NOTE_assets-chip.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_noteskins_note_assets_chip_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/noteSkins/NOTE_assets-future.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_noteskins_note_assets_future_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/noteSkins/NOTE_assets-future.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_noteskins_note_assets_future_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/noteSkins/NOTE_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_noteskins_note_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/noteSkins/NOTE_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_noteskins_note_assets_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/noteSplashes/list.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_list_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/noteSplashes/noteSplashes-diamond.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_diamond_json extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/noteSplashes/noteSplashes-diamond.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_diamond_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/noteSplashes/noteSplashes-diamond.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_diamond_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/noteSplashes/noteSplashes-electric.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_electric_json extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/noteSplashes/noteSplashes-electric.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_electric_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/noteSplashes/noteSplashes-electric.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_electric_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/noteSplashes/noteSplashes-sparkles.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_sparkles_json extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/noteSplashes/noteSplashes-sparkles.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_sparkles_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/noteSplashes/noteSplashes-sparkles.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_sparkles_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/noteSplashes/noteSplashes-vanilla.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_vanilla_json extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/noteSplashes/noteSplashes-vanilla.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_vanilla_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/noteSplashes/noteSplashes-vanilla.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_vanilla_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/noteSplashes/noteSplashes.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_json extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/noteSplashes/noteSplashes.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/noteSplashes/noteSplashes.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_notesplashes_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/num0.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_num0_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/num1.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_num1_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/num2.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_num2_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/num3.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_num3_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/num4.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_num4_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/num5.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_num5_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/num6.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_num6_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/num7.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_num7_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/num8.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_num8_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/num9.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_num9_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/bad-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_bad_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/combo-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_combo_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/date-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_date_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/good-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_good_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/noteSkins/NOTE_assets-chip.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_noteskins_note_assets_chip_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/noteSkins/NOTE_assets-future.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_noteskins_note_assets_future_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/noteSkins/NOTE_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_noteskins_note_assets_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/noteSkins/NOTE_assetsENDS-chip.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_noteskins_note_assetsends_chip_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/noteSkins/NOTE_assetsENDS-future.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_noteskins_note_assetsends_future_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/noteSkins/NOTE_assetsENDS.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_noteskins_note_assetsends_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num0-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num0_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num1-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num1_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num2-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num2_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num3-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num3_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num4-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num4_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num5-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num5_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num6-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num6_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num7-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num7_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num8-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num8_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num9-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num9_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/ready-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_ready_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/set-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_set_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/shit-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_shit_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/sick-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_sick_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/ready.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_ready_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/set.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_set_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/shit.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_shit_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/sick.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_sick_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/speech_bubble.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_speech_bubble_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/speech_bubble.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_speech_bubble_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/storymenu/readme.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_storymenu_readme_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/timeBar.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_timebar_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/titleEnter.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_titleenter_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/titleEnter.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_titleenter_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/unknownMod.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_unknownmod_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/music/breakfast.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_music_breakfast_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/freakyMenu.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_music_freakymenu_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/gameOver.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameover_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/gameOverEnd.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameoverend_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/offsetSong.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_music_offsetsong_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/tea-time.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_music_tea_time_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/ANGRY.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_angry_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/ANGRY_TEXT_BOX.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_angry_text_box_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/badnoise1.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/badnoise2.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/badnoise3.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/cancelMenu.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_cancelmenu_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/clickText.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_clicktext_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/confirmMenu.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_confirmmenu_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/dialogue.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_dialogue_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/dialogueClose.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_dialogueclose_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/fnf_loss_sfx.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_fnf_loss_sfx_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/GF_1.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/GF_2.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/GF_3.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/GF_4.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_4_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/hitsound.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_hitsound_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro1-pixel.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro1_pixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro1.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro2-pixel.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro2_pixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro2.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro3-pixel.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro3_pixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro3.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/introGo-pixel.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_introgo_pixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/introGo.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_introgo_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/Metronome_Tick.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_metronome_tick_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/missnote1.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/missnote2.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/missnote3.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/scrollMenu.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_scrollmenu_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/secret.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_secret_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/soundTest.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_soundtest_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/stages/readme.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_stages_readme_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/weeks/weekList.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_weeks_weeklist_txt extends haxe.io.Bytes {}
@:keep @:image("assets/embed/images/psych-ui/arrow_down.png") @:noCompletion #if display private #end class __ASSET__assets_embed_images_psych_ui_arrow_down_png extends lime.graphics.Image {}
@:keep @:image("assets/embed/images/psych-ui/arrow_up.png") @:noCompletion #if display private #end class __ASSET__assets_embed_images_psych_ui_arrow_up_png extends lime.graphics.Image {}
@:keep @:image("assets/embed/images/psych-ui/checkbox.png") @:noCompletion #if display private #end class __ASSET__assets_embed_images_psych_ui_checkbox_png extends lime.graphics.Image {}
@:keep @:image("assets/embed/images/psych-ui/dropdown_button.png") @:noCompletion #if display private #end class __ASSET__assets_embed_images_psych_ui_dropdown_button_png extends lime.graphics.Image {}
@:keep @:image("assets/embed/images/psych-ui/radio.png") @:noCompletion #if display private #end class __ASSET__assets_embed_images_psych_ui_radio_png extends lime.graphics.Image {}
@:keep @:image("assets/embed/images/psych-ui/stepper_minus.png") @:noCompletion #if display private #end class __ASSET__assets_embed_images_psych_ui_stepper_minus_png extends lime.graphics.Image {}
@:keep @:image("assets/embed/images/psych-ui/stepper_plus.png") @:noCompletion #if display private #end class __ASSET__assets_embed_images_psych_ui_stepper_plus_png extends lime.graphics.Image {}
@:keep @:file("assets/songs/readme.txt") @:noCompletion #if display private #end class __ASSET__assets_songs_readme_txt extends haxe.io.Bytes {}
@:keep @:file("assets/week_assets/readme.txt") @:noCompletion #if display private #end class __ASSET__assets_readme_txt extends haxe.io.Bytes {}
@:keep @:file("assets/translations/shared/data/pt-BR.lang") @:noCompletion #if display private #end class __ASSET__assets_shared_data_pt_br_lang extends haxe.io.Bytes {}
@:keep @:image("assets/translations/shared/images/pt-BR/mainmenu/menu_credits.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pt_br_mainmenu_menu_credits_png extends lime.graphics.Image {}
@:keep @:file("assets/translations/shared/images/pt-BR/mainmenu/menu_credits.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pt_br_mainmenu_menu_credits_xml extends haxe.io.Bytes {}
@:keep @:image("assets/translations/shared/images/pt-BR/mainmenu/menu_story_mode.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pt_br_mainmenu_menu_story_mode_png extends lime.graphics.Image {}
@:keep @:file("assets/translations/shared/images/pt-BR/mainmenu/menu_story_mode.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pt_br_mainmenu_menu_story_mode_xml extends haxe.io.Bytes {}
@:keep @:image("assets/translations/shared/images/pt-BR/menudifficulties/easy.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pt_br_menudifficulties_easy_png extends lime.graphics.Image {}
@:keep @:image("assets/translations/shared/images/pt-BR/menudifficulties/hard.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pt_br_menudifficulties_hard_png extends lime.graphics.Image {}
@:keep @:image("assets/translations/shared/images/pt-BR/Menu_Tracks.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pt_br_menu_tracks_png extends lime.graphics.Image {}
@:keep @:file("art/readme.txt") @:noCompletion #if display private #end class __ASSET__do_not_readme_txt extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,6,1/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,6,1/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,6,1/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,6,1/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/release/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/release/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/5,6,1/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/5,6,1/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,2,2/assets/images/transitions/circle.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_circle_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,2,2/assets/images/transitions/diagonal_gradient.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diagonal_gradient_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,2,2/assets/images/transitions/diamond.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diamond_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,2,2/assets/images/transitions/square.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_square_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flxanimate/git/assets/images/pivot.png") @:noCompletion #if display private #end class __ASSET__flxanimate_images_pivot_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flxanimate/git/assets/images/indicator.png") @:noCompletion #if display private #end class __ASSET__flxanimate_images_indicator_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_pixel_latin_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_pixel_latin_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/pixel-latin"; #else ascender = 1125; descender = -250; height = 1375; numGlyphs = 263; underlinePosition = -143; underlineThickness = 20; unitsPerEM = 1000; #end name = "Pixel Arial 11 Bold Latin"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/vcr"; #else ascender = 1800; descender = 0; height = 2000; numGlyphs = 204; underlinePosition = -292; underlineThickness = 150; unitsPerEM = 2048; #end name = "VCR OSD Mono"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_pixel_latin_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_pixel_latin_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_pixel_latin_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_vcr_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_vcr_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_pixel_latin_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_pixel_latin_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_pixel_latin_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_vcr_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_vcr_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end