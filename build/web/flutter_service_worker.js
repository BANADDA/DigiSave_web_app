'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"index.html": "bfa6b5b0f8200f1a4adc6b22351dcb18",
"/": "bfa6b5b0f8200f1a4adc6b22351dcb18",
"version.json": "e9eb58db72d407be27e9fa052224c304",
"main.dart.js": "deca3773d62fdbdada66e5626774d8cb",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/icons/Figma_file.svg": "0ae328b79325e7615054aed3147c81f9",
"assets/icons/media_file.svg": "2ac15c968f8a8cea571a0f3e9f238a66",
"assets/icons/menu_profile.svg": "fe56f998a7c1b307809ea3653a1b62f9",
"assets/icons/menu_notification.svg": "460268d6e4bdeab56538d7020cc4b326",
"assets/icons/Documents.svg": "51896b51d35e28711cf4bd218bde185d",
"assets/icons/xd_file.svg": "38913b108e39bcd55988050d2d80194c",
"assets/icons/google_drive.svg": "9a3005a58d47a11bfeffc11ddd3567c1",
"assets/icons/excel_file.svg": "dc91b258ecf87f5731fb2ab9ae15a3ec",
"assets/icons/one_drive.svg": "aa908c0a29eb795606799385cdfc8592",
"assets/icons/doc_file.svg": "552a02a5a3dbaee682de14573f0ca9f3",
"assets/icons/menu_store.svg": "2fd4ae47fd0fca084e50a600dda008cd",
"assets/icons/menu_task.svg": "1a02d1c14f49a765da34487d23a3093b",
"assets/icons/folder.svg": "40a82e74e930ac73aa6ccb85d8c5a29c",
"assets/icons/Search.svg": "396d519c18918ed763d741f4ba90243a",
"assets/icons/pdf_file.svg": "ca854643eeee7bedba7a1d550e2ba94f",
"assets/icons/drop_box.svg": "3295157e194179743d6093de9f1ff254",
"assets/icons/logo.svg": "b3af0c077a73709c992d7e075b76ce33",
"assets/icons/media.svg": "059dfe46bd2d92e30bf361c2f7055c3b",
"assets/icons/menu_tran.svg": "6c95fa7ae6679737dc57efd2ccbb0e57",
"assets/icons/unknown.svg": "b2f3cdc507252d75dea079282f14614f",
"assets/icons/menu_doc.svg": "09673c2879de2db9646345011dbaa7bb",
"assets/icons/menu_setting.svg": "d0e24d5d0956729e0e2ab09cb4327e32",
"assets/icons/menu_dashboard.svg": "b2cdf62e9ce9ca35f3fc72f1c1fcc7d4",
"assets/icons/sound_file.svg": "fe212d5edfddd0786319edf50601ec73",
"assets/NOTICES": "81dc125682d4c638a8ce663618e89aaa",
"assets/fonts/MaterialIcons-Regular.otf": "622db87e3f45df8e62c7c8d2d412e923",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.json": "f7868948b10bc5682292af0a60f20a29",
"assets/assets/icons/Figma_file.svg": "0ae328b79325e7615054aed3147c81f9",
"assets/assets/icons/media_file.svg": "2ac15c968f8a8cea571a0f3e9f238a66",
"assets/assets/icons/menu_profile.svg": "fe56f998a7c1b307809ea3653a1b62f9",
"assets/assets/icons/menu_notification.svg": "460268d6e4bdeab56538d7020cc4b326",
"assets/assets/icons/Documents.svg": "51896b51d35e28711cf4bd218bde185d",
"assets/assets/icons/xd_file.svg": "38913b108e39bcd55988050d2d80194c",
"assets/assets/icons/google_drive.svg": "9a3005a58d47a11bfeffc11ddd3567c1",
"assets/assets/icons/excel_file.svg": "dc91b258ecf87f5731fb2ab9ae15a3ec",
"assets/assets/icons/one_drive.svg": "aa908c0a29eb795606799385cdfc8592",
"assets/assets/icons/doc_file.svg": "552a02a5a3dbaee682de14573f0ca9f3",
"assets/assets/icons/menu_store.svg": "2fd4ae47fd0fca084e50a600dda008cd",
"assets/assets/icons/menu_task.svg": "1a02d1c14f49a765da34487d23a3093b",
"assets/assets/icons/folder.svg": "40a82e74e930ac73aa6ccb85d8c5a29c",
"assets/assets/icons/Search.svg": "396d519c18918ed763d741f4ba90243a",
"assets/assets/icons/pdf_file.svg": "ca854643eeee7bedba7a1d550e2ba94f",
"assets/assets/icons/drop_box.svg": "3295157e194179743d6093de9f1ff254",
"assets/assets/icons/logo.svg": "b3af0c077a73709c992d7e075b76ce33",
"assets/assets/icons/media.svg": "059dfe46bd2d92e30bf361c2f7055c3b",
"assets/assets/icons/menu_tran.svg": "6c95fa7ae6679737dc57efd2ccbb0e57",
"assets/assets/icons/unknown.svg": "b2f3cdc507252d75dea079282f14614f",
"assets/assets/icons/menu_doc.svg": "09673c2879de2db9646345011dbaa7bb",
"assets/assets/icons/menu_setting.svg": "d0e24d5d0956729e0e2ab09cb4327e32",
"assets/assets/icons/menu_dashboard.svg": "b2cdf62e9ce9ca35f3fc72f1c1fcc7d4",
"assets/assets/icons/sound_file.svg": "fe212d5edfddd0786319edf50601ec73",
"assets/assets/images/female.png": "74312e5dee6da037f1ec4e4b3a2a1fe0",
"assets/assets/images/logo.png": "46a28c0ab0262d5239e6f2fc44bf0768",
"assets/assets/images/users6.png": "537917e91d8350888d5c3c6cda92fbe6",
"assets/assets/images/agent.png": "9fff805a8bb6a67aad4b47ec564a24b5",
"assets/assets/images/user7.png": "2fb3d8f0f052458169837276027f94a8",
"assets/assets/images/users5.png": "b9bf7d0225a65150dcfd74d01215c9d2",
"assets/assets/images/users8.png": "70ead40db220917b359c432c18295278",
"assets/assets/images/profile_pic.png": "5f56c3070f1c066ae15ecad12fb44f54",
"assets/assets/images/male.png": "5b3f434f99372ad48586093680c2dace",
"assets/assets/images/1078313.png": "2e96b97c2d072370ca972fe9381fdef3",
"assets/assets/images/others.png": "44fd84042e124bd575b109cb5dbdc9dc",
"assets/assets/images/local_group.jpg": "ac8b56a5a68c0122fcb29b032b66dfcb",
"assets/loading.gif": "7a63480a257cdcc94fea9fa407908cbf",
"assets/AssetManifest.bin": "98dc80ff1a5f0bce552b869c95e77982",
"assets/images/female.png": "74312e5dee6da037f1ec4e4b3a2a1fe0",
"assets/images/logo.png": "6ac96ed1d21ed7fff3fa311a148a7a16",
"assets/images/users6.png": "537917e91d8350888d5c3c6cda92fbe6",
"assets/images/agent.png": "9fff805a8bb6a67aad4b47ec564a24b5",
"assets/images/user7.png": "2fb3d8f0f052458169837276027f94a8",
"assets/images/users5.png": "b9bf7d0225a65150dcfd74d01215c9d2",
"assets/images/users8.png": "70ead40db220917b359c432c18295278",
"assets/images/profile_pic.png": "5f56c3070f1c066ae15ecad12fb44f54",
"assets/images/male.png": "5b3f434f99372ad48586093680c2dace",
"assets/images/1078313.png": "2e96b97c2d072370ca972fe9381fdef3",
"assets/images/others.png": "44fd84042e124bd575b109cb5dbdc9dc",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "6ac96ed1d21ed7fff3fa311a148a7a16",
"manifest.json": "df8ee12e5d40a884cc23acd0588bda1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
