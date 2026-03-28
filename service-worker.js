const CACHE_NAME = "clinident-v1";

const urlsToCache = [
  "index.html",
  "manifest.json",
  "icon.png",
  "img/logo.png" // agrega aquí todas tus imágenes
];

// INSTALACIÓN
self.addEventListener("install", function(event) {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        console.log("Cache abierto");
        return cache.addAll(urlsToCache);
      })
  );
});

// ACTIVACIÓN (limpia versiones viejas)
self.addEventListener("activate", function(event) {
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cache => {
          if (cache !== CACHE_NAME) {
            return caches.delete(cache);
          }
        })
      );
    })
  );
});

// FETCH (sirve archivos desde cache)
self.addEventListener("fetch", function(event) {
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        return response || fetch(event.request);
      })
  );
});