
var Module;

if (typeof Module === 'undefined') Module = eval('(function() { try { return Module || {} } catch(e) { return {} } })()');

if (!Module.expectedDataFileDownloads) {
  Module.expectedDataFileDownloads = 0;
  Module.finishedDataFileDownloads = 0;
}
Module.expectedDataFileDownloads++;
(function() {
 var loadPackage = function(metadata) {

    var PACKAGE_PATH;
    if (typeof window === 'object') {
      PACKAGE_PATH = window['encodeURIComponent'](window.location.pathname.toString().substring(0, window.location.pathname.toString().lastIndexOf('/')) + '/');
    } else if (typeof location !== 'undefined') {
      // worker
      PACKAGE_PATH = encodeURIComponent(location.pathname.toString().substring(0, location.pathname.toString().lastIndexOf('/')) + '/');
    } else {
      throw 'using preloaded data can only be done on a web page or in a web worker';
    }
    var PACKAGE_NAME = 'game.data';
    var REMOTE_PACKAGE_BASE = 'game.data';
    if (typeof Module['locateFilePackage'] === 'function' && !Module['locateFile']) {
      Module['locateFile'] = Module['locateFilePackage'];
      Module.printErr('warning: you defined Module.locateFilePackage, that has been renamed to Module.locateFile (using your locateFilePackage for now)');
    }
    var REMOTE_PACKAGE_NAME = typeof Module['locateFile'] === 'function' ?
                              Module['locateFile'](REMOTE_PACKAGE_BASE) :
                              ((Module['filePackagePrefixURL'] || '') + REMOTE_PACKAGE_BASE);
  
    var REMOTE_PACKAGE_SIZE = metadata.remote_package_size;
    var PACKAGE_UUID = metadata.package_uuid;
  
    function fetchRemotePackage(packageName, packageSize, callback, errback) {
      var xhr = new XMLHttpRequest();
      xhr.open('GET', packageName, true);
      xhr.responseType = 'arraybuffer';
      xhr.onprogress = function(event) {
        var url = packageName;
        var size = packageSize;
        if (event.total) size = event.total;
        if (event.loaded) {
          if (!xhr.addedTotal) {
            xhr.addedTotal = true;
            if (!Module.dataFileDownloads) Module.dataFileDownloads = {};
            Module.dataFileDownloads[url] = {
              loaded: event.loaded,
              total: size
            };
          } else {
            Module.dataFileDownloads[url].loaded = event.loaded;
          }
          var total = 0;
          var loaded = 0;
          var num = 0;
          for (var download in Module.dataFileDownloads) {
          var data = Module.dataFileDownloads[download];
            total += data.total;
            loaded += data.loaded;
            num++;
          }
          total = Math.ceil(total * Module.expectedDataFileDownloads/num);
          if (Module['setStatus']) Module['setStatus']('Downloading data... (' + loaded + '/' + total + ')');
        } else if (!Module.dataFileDownloads) {
          if (Module['setStatus']) Module['setStatus']('Downloading data...');
        }
      };
      xhr.onload = function(event) {
        var packageData = xhr.response;
        callback(packageData);
      };
      xhr.send(null);
    };

    function handleError(error) {
      console.error('package error:', error);
    };
  
      var fetched = null, fetchedCallback = null;
      fetchRemotePackage(REMOTE_PACKAGE_NAME, REMOTE_PACKAGE_SIZE, function(data) {
        if (fetchedCallback) {
          fetchedCallback(data);
          fetchedCallback = null;
        } else {
          fetched = data;
        }
      }, handleError);
    
  function runWithFS() {

    function assert(check, msg) {
      if (!check) throw msg + new Error().stack;
    }
Module['FS_createPath']('/', '.git', true, true);
Module['FS_createPath']('/.git', 'hooks', true, true);
Module['FS_createPath']('/.git', 'info', true, true);
Module['FS_createPath']('/.git', 'logs', true, true);
Module['FS_createPath']('/.git/logs', 'refs', true, true);
Module['FS_createPath']('/.git/logs/refs', 'heads', true, true);
Module['FS_createPath']('/.git/logs/refs', 'remotes', true, true);
Module['FS_createPath']('/.git/logs/refs/remotes', 'origin', true, true);
Module['FS_createPath']('/.git', 'objects', true, true);
Module['FS_createPath']('/.git/objects', 'pack', true, true);
Module['FS_createPath']('/.git', 'refs', true, true);
Module['FS_createPath']('/.git/refs', 'heads', true, true);
Module['FS_createPath']('/.git/refs', 'remotes', true, true);
Module['FS_createPath']('/.git/refs/remotes', 'origin', true, true);
Module['FS_createPath']('/', 'assets', true, true);
Module['FS_createPath']('/assets', 'maps', true, true);
Module['FS_createPath']('/assets', 'music', true, true);
Module['FS_createPath']('/assets', 'sprites', true, true);
Module['FS_createPath']('/assets', 'tilesets', true, true);
Module['FS_createPath']('/assets', 'ui', true, true);
Module['FS_createPath']('/', 'lib', true, true);
Module['FS_createPath']('/lib', 'sti', true, true);
Module['FS_createPath']('/lib/sti', 'plugins', true, true);

    function DataRequest(start, end, crunched, audio) {
      this.start = start;
      this.end = end;
      this.crunched = crunched;
      this.audio = audio;
    }
    DataRequest.prototype = {
      requests: {},
      open: function(mode, name) {
        this.name = name;
        this.requests[name] = this;
        Module['addRunDependency']('fp ' + this.name);
      },
      send: function() {},
      onload: function() {
        var byteArray = this.byteArray.subarray(this.start, this.end);

          this.finish(byteArray);

      },
      finish: function(byteArray) {
        var that = this;

        Module['FS_createDataFile'](this.name, null, byteArray, true, true, true); // canOwn this data in the filesystem, it is a slide into the heap that will never change
        Module['removeRunDependency']('fp ' + that.name);

        this.requests[this.name] = null;
      },
    };

        var files = metadata.files;
        for (i = 0; i < files.length; ++i) {
          new DataRequest(files[i].start, files[i].end, files[i].crunched, files[i].audio).open('GET', files[i].filename);
        }

  
    function processPackageData(arrayBuffer) {
      Module.finishedDataFileDownloads++;
      assert(arrayBuffer, 'Loading data file failed.');
      assert(arrayBuffer instanceof ArrayBuffer, 'bad input to processPackageData');
      var byteArray = new Uint8Array(arrayBuffer);
      var curr;
      
        // copy the entire loaded file into a spot in the heap. Files will refer to slices in that. They cannot be freed though
        // (we may be allocating before malloc is ready, during startup).
        if (Module['SPLIT_MEMORY']) Module.printErr('warning: you should run the file packager with --no-heap-copy when SPLIT_MEMORY is used, otherwise copying into the heap may fail due to the splitting');
        var ptr = Module['getMemory'](byteArray.length);
        Module['HEAPU8'].set(byteArray, ptr);
        DataRequest.prototype.byteArray = Module['HEAPU8'].subarray(ptr, ptr+byteArray.length);
  
          var files = metadata.files;
          for (i = 0; i < files.length; ++i) {
            DataRequest.prototype.requests[files[i].filename].onload();
          }
              Module['removeRunDependency']('datafile_game.data');

    };
    Module['addRunDependency']('datafile_game.data');
  
    if (!Module.preloadResults) Module.preloadResults = {};
  
      Module.preloadResults[PACKAGE_NAME] = {fromCache: false};
      if (fetched) {
        processPackageData(fetched);
        fetched = null;
      } else {
        fetchedCallback = processPackageData;
      }
    
  }
  if (Module['calledRun']) {
    runWithFS();
  } else {
    if (!Module['preRun']) Module['preRun'] = [];
    Module["preRun"].push(runWithFS); // FS is not initialized yet, wait for it
  }

 }
 loadPackage({"files": [{"audio": 0, "start": 0, "crunched": 0, "end": 729, "filename": "/COPYING"}, {"audio": 0, "start": 729, "crunched": 0, "end": 791, "filename": "/README.md"}, {"audio": 0, "start": 791, "crunched": 0, "end": 2189, "filename": "/conf.lua"}, {"audio": 0, "start": 2189, "crunched": 0, "end": 3605, "filename": "/main.lua"}, {"audio": 0, "start": 3605, "crunched": 0, "end": 6454, "filename": "/mapHandler.lua"}, {"audio": 0, "start": 6454, "crunched": 0, "end": 7259, "filename": "/menuHandler.lua"}, {"audio": 0, "start": 7259, "crunched": 0, "end": 8151, "filename": "/soundHandler.lua"}, {"audio": 0, "start": 8151, "crunched": 0, "end": 8174, "filename": "/.git/HEAD"}, {"audio": 0, "start": 8174, "crunched": 0, "end": 8429, "filename": "/.git/config"}, {"audio": 0, "start": 8429, "crunched": 0, "end": 8502, "filename": "/.git/description"}, {"audio": 0, "start": 8502, "crunched": 0, "end": 11000, "filename": "/.git/index"}, {"audio": 0, "start": 11000, "crunched": 0, "end": 11114, "filename": "/.git/packed-refs"}, {"audio": 0, "start": 11114, "crunched": 0, "end": 11592, "filename": "/.git/hooks/applypatch-msg.sample"}, {"audio": 0, "start": 11592, "crunched": 0, "end": 12488, "filename": "/.git/hooks/commit-msg.sample"}, {"audio": 0, "start": 12488, "crunched": 0, "end": 15815, "filename": "/.git/hooks/fsmonitor-watchman.sample"}, {"audio": 0, "start": 15815, "crunched": 0, "end": 16004, "filename": "/.git/hooks/post-update.sample"}, {"audio": 0, "start": 16004, "crunched": 0, "end": 16428, "filename": "/.git/hooks/pre-applypatch.sample"}, {"audio": 0, "start": 16428, "crunched": 0, "end": 18070, "filename": "/.git/hooks/pre-commit.sample"}, {"audio": 0, "start": 18070, "crunched": 0, "end": 19418, "filename": "/.git/hooks/pre-push.sample"}, {"audio": 0, "start": 19418, "crunched": 0, "end": 24316, "filename": "/.git/hooks/pre-rebase.sample"}, {"audio": 0, "start": 24316, "crunched": 0, "end": 24860, "filename": "/.git/hooks/pre-receive.sample"}, {"audio": 0, "start": 24860, "crunched": 0, "end": 26352, "filename": "/.git/hooks/prepare-commit-msg.sample"}, {"audio": 0, "start": 26352, "crunched": 0, "end": 29962, "filename": "/.git/hooks/update.sample"}, {"audio": 0, "start": 29962, "crunched": 0, "end": 30202, "filename": "/.git/info/exclude"}, {"audio": 0, "start": 30202, "crunched": 0, "end": 30374, "filename": "/.git/logs/HEAD"}, {"audio": 0, "start": 30374, "crunched": 0, "end": 30546, "filename": "/.git/logs/refs/heads/master"}, {"audio": 0, "start": 30546, "crunched": 0, "end": 30718, "filename": "/.git/logs/refs/remotes/origin/HEAD"}, {"audio": 0, "start": 30718, "crunched": 0, "end": 35626, "filename": "/.git/objects/pack/pack-945aae0f17b5624ae7a1fbe470b68b47bbda832c.idx"}, {"audio": 0, "start": 35626, "crunched": 0, "end": 5046684, "filename": "/.git/objects/pack/pack-945aae0f17b5624ae7a1fbe470b68b47bbda832c.pack"}, {"audio": 0, "start": 5046684, "crunched": 0, "end": 5046725, "filename": "/.git/refs/heads/master"}, {"audio": 0, "start": 5046725, "crunched": 0, "end": 5046757, "filename": "/.git/refs/remotes/origin/HEAD"}, {"audio": 0, "start": 5046757, "crunched": 0, "end": 5086582, "filename": "/assets/maps/pizza.lua"}, {"audio": 0, "start": 5086582, "crunched": 0, "end": 5126420, "filename": "/assets/maps/test.lua"}, {"audio": 0, "start": 5126420, "crunched": 0, "end": 5150224, "filename": "/assets/maps/test.tmx"}, {"audio": 1, "start": 5150224, "crunched": 0, "end": 8503752, "filename": "/assets/music/Canadian_Sorry.wav"}, {"audio": 1, "start": 8503752, "crunched": 0, "end": 10698210, "filename": "/assets/music/Maple_Syruptitle.wav"}, {"audio": 1, "start": 10698210, "crunched": 0, "end": 11183611, "filename": "/assets/music/title-intro.ogg"}, {"audio": 1, "start": 11183611, "crunched": 0, "end": 11669468, "filename": "/assets/music/title-loop.ogg"}, {"audio": 0, "start": 11669468, "crunched": 0, "end": 11678413, "filename": "/assets/sprites/player.png"}, {"audio": 0, "start": 11678413, "crunched": 0, "end": 11684948, "filename": "/assets/sprites/trump.png"}, {"audio": 0, "start": 11684948, "crunched": 0, "end": 11802119, "filename": "/assets/tilesets/test.png"}, {"audio": 0, "start": 11802119, "crunched": 0, "end": 11823272, "filename": "/assets/ui/logo.png"}, {"audio": 0, "start": 11823272, "crunched": 0, "end": 11868733, "filename": "/lib/Gspot.lua"}, {"audio": 0, "start": 11868733, "crunched": 0, "end": 11890900, "filename": "/lib/bump.lua"}, {"audio": 0, "start": 11890900, "crunched": 0, "end": 11891816, "filename": "/lib/bump_debug.lua"}, {"audio": 0, "start": 11891816, "crunched": 0, "end": 11893911, "filename": "/lib/sti/graphics.lua"}, {"audio": 0, "start": 11893911, "crunched": 0, "end": 11935143, "filename": "/lib/sti/init.lua"}, {"audio": 0, "start": 11935143, "crunched": 0, "end": 11939849, "filename": "/lib/sti/utils.lua"}, {"audio": 0, "start": 11939849, "crunched": 0, "end": 11948731, "filename": "/lib/sti/plugins/box2d.lua"}, {"audio": 0, "start": 11948731, "crunched": 0, "end": 11954546, "filename": "/lib/sti/plugins/bump.lua"}], "remote_package_size": 11954546, "package_uuid": "16be654b-b5c2-4093-b5a4-4ed8cc444e2a"});

})();
