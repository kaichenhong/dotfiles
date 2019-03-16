/* mozilla firefox user preference (user.js)
 * 
 *
 * Arch linux wiki => Firefox/Tweaks
 * https://wiki.archlinux.org/index.php/Firefox/Tweaks#Turn_off_the_disk_cache
 *
 * Arch linux wiki => Firefox/Privacy
 * https://wiki.archlinux.org/index.php/Firefox/Privacy
 *
 * Arch linux wiki => Firefox
 * https://wiki.archlinux.org/index.php/Firefox
 *
 *
 * others
 * https://github.com/ghacksuserjs/ghacks-user.js
 * https://github.com/pyllyukko/user.js/#what-does-it-do
 *
 *
 * !!! Note that removing or "commenting out" a preference line from the user.js file will not remove changes written to the prefs.js file.
 * !!! Since the same preferences are now written to the prefs.js file, a second step is needed.
 * !!! Reset the preference via about:config or restore a backup copy of the prefs.js file to undo preferences that have been set in the user.js file. ***/



/************************************/
/***** User preference settings *****/
/************************************/

/* newtabpage pinned website */
user_pref("browser.newtabpage.pinned", "[
	{\"url\":\"https://www.facebook.com/#\",\"label\":\"facebook\",\"baseDomain\":\"facebook.com\"},
	{\"url\":\"https://term.ptt.cc/\",\"label\":\"PttChrome\",\"baseDomain\":\"term.ptt.cc\"},
	{\"url\":\"https://www.google.com.tw/\",\"label\":\"google\",\"baseDomain\":\"google.com.tw\"},
	{\"url\":\"https://www.youtube.com/?hl=zh-TW&gl=TW\",\"label\":\"youtube\",\"baseDomain\":\"youtube.com\"},
	{\"url\":\"https://www06.eyny.com/\",\"label\":\"eyny\",\"baseDomain\":\"eyny.com\"},
	{\"url\":\"https://www.gamer.com.tw/\",\"label\":\"gamer\",\"baseDomain\":\"gamer.com.tw\"},
	{\"url\":\"https://www.coolaler.com/home/\",\"label\":\"coolaler\",\"baseDomain\":\"coolaler.com\"},
	{\"url\":\"https://www.coolpc.com.tw/phpBB2/portal.php\",\"label\":\"coolpc\",\"baseDomain\":\"coolpc.com.tw\"},
	{\"url\":\"https://www.nctu.edu.tw/\",\"label\":\"nctu\"},
	{\"url\":\"https://www.eprice.com.tw/\",\"label\":\"eprice\"},
	{\"url\":\"https://drive.google.com/drive/u/1/my-drive\",\"label\":\"drive.google\"},
	{\"url\":\"https://shadowverse.gamewith.jp/\",\"baseDomain\":\"shadowverse.gamewith.jp\"},
	{\"url\":\"https://imascg-slstage-wiki.gamerch.com/\",\"baseDomain\":\"imascg-slstage-wiki.gamerch.com\"},
	{\"url\":\"https://imasml-theater-wiki.gamerch.com/\",\"baseDomain\":\"imasml-theater-wiki.gamerch.com\"},
	{\"url\":\"https://pad.skyozora.com/\",\"label\":\"pad.skyozora\",\"baseDomain\":\"pad.skyozora.com\"},
	{\"url\":\"https://docs.opencv.org/3.3.0/\",\"label\":\"OpenCV-API\",\"baseDomain\":\"docs.opencv.org\"}]");

/* mouse click on URL bar's behavior */
user_pref("browser.urlbar.clickSelectsAll", true);
user_pref("browser.urlbar.doubleClickSelectsAll", false);

/* middle-click behavior */
user_pref("middlemouse.paste", false);
user_pref("general.autoScroll", true);  // default for Windows browsers.



/*****************/
/***** CACHE *****/
/*****************/

/* disable disk cache */
user_pref("browser.cache.disk.enable", false);
user_pref("browser.cache.disk.capacity", 0);
user_pref("browser.cache.disk.smart_size.enabled", false);
user_pref("browser.cache.disk.smart_size.first_run", false);

/* disable disk cache for SSL pages
 * 
 * http://kb.mozillazine.org/Browser.cache.disk_cache_ssl
 *
 *
 * browser.cache.disk.enable and network.http.use-cache must be set to true if you wish to enable disk caching of SSL pages.
 * If this preference is set to false, browser.cache.memory.enable and network.http.use-cache must be set to true if you wish to enable memory caching of SSL pages. ***/
user_pref("browser.cache.disk_cache_ssl", false);

/* enable memory cache */
user_pref("browser.cache.memory.enable", true);	 // default is true.
user_pref("browser.cache.memory.capacity", -1);  // -1 for automatic.

user_pref("network.http.use-cache", true);  // default is true.



/**************************************/
/***** SESSIONS & SESSION RESTORE *****/
/**************************************/

/* disable storing extra session data [SETUP-CHROME]
 *
 * extra session data contains contents of forms, scrollbar positions, cookies and POST data
 * define on which sites to save extra session data:
 * 0=everywhere, 1=unencrypted sites, 2=nowhere ***/
   // user_pref("browser.sessionstore.privacy_level", 2);


/* disable resuming session from crash */
   // user_pref("browser.sessionstore.resume_from_crash", false);


/* set the minimum interval between session save operations
 *
 * Increasing this can help on older machines and some websites, as well as reducing writes, see [1]
 * Default is 15000 (15 secs). Try 30000 (30 secs), 60000 (1 min) etc
 * [SETUP-CHROME] This can also affect entries in the "Recently Closed Tabs" feature:
 * i.e. the longer the interval the more chance a quick tab open/close won't be captured.
 * This longer interval *may* affect history but we cannot replicate any history not recorded
 * [1] https://bugzilla.mozilla.org/1304389 ***/
user_pref("browser.sessionstore.interval", 30000);



/*********************************/
/***** HARDWARE ACCELERATION *****/
/*********************************/

/* disable hardware acceleration */
   // user_pref("layers.acceleration.disabled", true);

/* blocked graphics features, see [1]. OMTC, WebGL, ...(WebGL not on Arch wiki firefox tweaks)
 * [1] https://wiki.mozilla.org/Blocklisting/Blocked_Graphics_Drivers#On_X11
 *
 * force-enable OpenGL Off-Main-Thread Compositing(OMTC) 
 *
 * Basic software OMTC is enabled by default.
 * To check if OpenGL OMTC is enabled, go to about:support and under the "Graphics" section look for "Compositing".
 * If it reports "Basic", OpenGL OMTC is disabled; if it reports "OpenGL" it is enabled.
 * firefox crash and window becomes black, get Unflushed glGetGraphicsResetStatus: 0x92bb(in .xsession-errors) error when system resume. ***/
user_pref("layers.acceleration.force-enabled", true);

/* force-enable WebGL
 * WebGL is a potential security risk, see [1]
 * Set webgl.disabled to true in about:config if you want to disable it.
 * [1] https://security.stackexchange.com/questions/13799/is-webgl-a-security-concern */
user_pref("webgl.disabled", true);
   // user_pref("webgl.force-enabled", true);

/* force-enable WebGL anti-aliasing */
   // user_pref("webgl.msaa-force", true);

/* enable Accelerated Azure Canvas */
   // user_pref("gfx.canvas.azure.accelerated", true);
		


/**************************************/
/***** ENHANCE SECURITY & PRIVACY *****/
/**************************************/

/* anti-fingerprinting */
   // user_pref("privacy.resistFingerprinting", true);

/* enable tracking protection */
user_pref("privacy.trackingprotection.enabled", true);

/* prevent WebRTC exposes LAN IP address */
user_pref("media.peerconnection.ice.default_address_only", true);
   // user_pref("media.peerconnection.enabled", false);  // only if you want to completely disable WebRTC

/* Do Not Track Header (DNT) 
 * The Do Not Track header may be used to fingerprint your browser, since most users leave the option disabled. ***/
user_pref("privacy.donottrackheader.enabled", false);

/* disable geolocation */
user_pref("geo.enabled", false);

/* safe browsing service
 * safe Browsing offers phishing protection and malware checks, however it may send user information (e.g. URL, file hashes, etc.) to third parties like Google.
 * in addition disable download checking, by setting browser.safebrowsing.downloads.enabled to false. ***/
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);
user_pref("browser.safebrowsing.downloads.enabled", false);

/* disable WebGL
 * see HARDWARE ACCELERATION ***/
