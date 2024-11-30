'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "f393d3c16b631f36852323de8e583132",
"main.dart.js": "a55abd341d6195ea3cc8c8d967ce0e7d",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin": "a8e3180eb5bb5df174cd96359c59e3cc",
"assets/fonts/MaterialIcons-Regular.otf": "9429359b297c6803061f9a02a931743a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/assets/githubactions.png": "9be43c05d9f4a41cc8628d096cc9c100",
"assets/assets/icons8-python-144.png": "72b1654c58e03fc8da233d2afc82a555",
"assets/assets/icons8-java-144.png": "d895b7834dda35ec3cfb1a0b877bb9c8",
"assets/assets/icons8-github-48.png": "e5b616d9bee9623d08465798ef1ddb80",
"assets/assets/icons8-desktop-96.png": "d7ff9dfee1d8fcfaa6d236a32a398f20",
"assets/assets/back_2.jpeg": "5ff87e7d2f8fef59fd04dced75a69fbd",
"assets/assets/icons8-web-50.png": "523950855f06d8f995d5a96faac2bc1a",
"assets/assets/projects/my_portfolio_project.png": "0c4cf5005dcbbe38e63ee9da94ca2638",
"assets/assets/icons8-programming-96.png": "454adeafc4c0883233d99e0b4e53b4f4",
"assets/assets/icons8-android-144.png": "f70497f76ed89d10289b4c2da106f9c2",
"assets/assets/icons8-docker-144.png": "e58f48a69d4335cce26daac80d62fee0",
"assets/assets/icons8-apple-logo-50.png": "1be8de544ba5972870816d98c71e83d5",
"assets/assets/icons8-instagram-48.png": "b3c9ce60dd1d75ed3f597202c82c05e7",
"assets/assets/animation/backend_service_lottie.json": "caab29c54814e0e689c0c2baa1b84fc4",
"assets/assets/animation/9cnb8OB2zC.json": "e0371f2f59b903413b5335c941e11c02",
"assets/assets/animation/ui_animation.json": "1d69979b9a07b2adaa521e93b974056e",
"assets/assets/animation/scripting_service.json": "33b7845cd9313ab618af3fa4913a2a8e",
"assets/assets/animation/QPNON3mT8Y.json": "d2f809e68b2f9ae8694bd336899e5cfd",
"assets/assets/icons8-flutter-144.png": "11730d08fa60e5d497c6827f65288e85",
"assets/assets/icons8-web-96.png": "2fe5121c89b8cb6cbaf23cb8482897ee",
"assets/assets/icons8-linkedin-48.png": "f33b3032dcc4df0e1c28e472742419d4",
"assets/assets/icons8-android-50.png": "c5a4834c1b6b123a4ca6da3d76f2937d",
"assets/assets/icons8-telegram-48.png": "9a1b77bf240b722d2315096309307f81",
"assets/assets/geeky_monkey.png": "72e3d456f710c8381d083f6e4880f8c5",
"assets/assets/sql.png": "21812f6d8d4844da17453b80216a4445",
"assets/assets/icons8-flask-128.png": "2d6dd433a2ebdc839dbd636377ed9432",
"assets/assets/icons8-dart-144.png": "cdc189d734b00c7dc950bda7bf0d0b63",
"assets/assets/icons8-facebook-48.png": "ceda85dc6354796fd08c69a2032d2b29",
"assets/NOTICES": "a2ac8d29afbd7f569d96a12866829d01",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "6c75edb41a95db8eaf227204c7f39a36",
"assets/AssetManifest.bin.json": "364ae3be850ed45b7ee31b4fcd1a97b8",
"index.html": "ada9882353dc379b6606a34e3a365763",
"/": "ada9882353dc379b6606a34e3a365763",
"manifest.json": "a0bea58ca81645b22c8be06973991b3e",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "f21b77009aa3d2bf8e49b390d379b8a2",
"flutter_bootstrap.js": "a5d83f1e7f505a4d125bd8050c3aa7da"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
