
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
Module['FS_createPath']('/.git/objects', '01', true, true);
Module['FS_createPath']('/.git/objects', '02', true, true);
Module['FS_createPath']('/.git/objects', '2e', true, true);
Module['FS_createPath']('/.git/objects', '35', true, true);
Module['FS_createPath']('/.git/objects', '3e', true, true);
Module['FS_createPath']('/.git/objects', '40', true, true);
Module['FS_createPath']('/.git/objects', '4b', true, true);
Module['FS_createPath']('/.git/objects', '57', true, true);
Module['FS_createPath']('/.git/objects', '64', true, true);
Module['FS_createPath']('/.git/objects', '96', true, true);
Module['FS_createPath']('/.git/objects', '9b', true, true);
Module['FS_createPath']('/.git/objects', 'a2', true, true);
Module['FS_createPath']('/.git/objects', 'b0', true, true);
Module['FS_createPath']('/.git/objects', 'bf', true, true);
Module['FS_createPath']('/.git/objects', 'c7', true, true);
Module['FS_createPath']('/.git/objects', 'cf', true, true);
Module['FS_createPath']('/.git/objects', 'd0', true, true);
Module['FS_createPath']('/.git/objects', 'd2', true, true);
Module['FS_createPath']('/.git/objects', 'd6', true, true);
Module['FS_createPath']('/.git/objects', 'e8', true, true);
Module['FS_createPath']('/.git/objects', 'ec', true, true);
Module['FS_createPath']('/.git/objects', 'ee', true, true);
Module['FS_createPath']('/.git/objects', 'f9', true, true);
Module['FS_createPath']('/.git/objects', 'pack', true, true);
Module['FS_createPath']('/.git', 'refs', true, true);
Module['FS_createPath']('/.git/refs', 'heads', true, true);
Module['FS_createPath']('/.git/refs', 'remotes', true, true);
Module['FS_createPath']('/.git/refs/remotes', 'origin', true, true);
Module['FS_createPath']('/.git', 'worktrees', true, true);
Module['FS_createPath']('/.git/worktrees', 'gh-pages', true, true);
Module['FS_createPath']('/.git/worktrees/gh-pages', 'logs', true, true);
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
 loadPackage({"files": [{"audio": 0, "start": 0, "crunched": 0, "end": 729, "filename": "/COPYING"}, {"audio": 0, "start": 729, "crunched": 0, "end": 791, "filename": "/README.md"}, {"audio": 0, "start": 791, "crunched": 0, "end": 2189, "filename": "/conf.lua"}, {"audio": 0, "start": 2189, "crunched": 0, "end": 3764, "filename": "/main.lua"}, {"audio": 0, "start": 3764, "crunched": 0, "end": 6088, "filename": "/mapHandler.lua"}, {"audio": 0, "start": 6088, "crunched": 0, "end": 6893, "filename": "/menuHandler.lua"}, {"audio": 0, "start": 6893, "crunched": 0, "end": 7785, "filename": "/soundHandler.lua"}, {"audio": 0, "start": 7785, "crunched": 0, "end": 8094, "filename": "/.git/COMMIT_EDITMSG"}, {"audio": 0, "start": 8094, "crunched": 0, "end": 8285, "filename": "/.git/FETCH_HEAD"}, {"audio": 0, "start": 8285, "crunched": 0, "end": 8308, "filename": "/.git/HEAD"}, {"audio": 0, "start": 8308, "crunched": 0, "end": 8349, "filename": "/.git/ORIG_HEAD"}, {"audio": 0, "start": 8349, "crunched": 0, "end": 8670, "filename": "/.git/config"}, {"audio": 0, "start": 8670, "crunched": 0, "end": 8743, "filename": "/.git/description"}, {"audio": 0, "start": 8743, "crunched": 0, "end": 11456, "filename": "/.git/index"}, {"audio": 0, "start": 11456, "crunched": 0, "end": 11640, "filename": "/.git/packed-refs"}, {"audio": 0, "start": 11640, "crunched": 0, "end": 12118, "filename": "/.git/hooks/applypatch-msg.sample"}, {"audio": 0, "start": 12118, "crunched": 0, "end": 13014, "filename": "/.git/hooks/commit-msg.sample"}, {"audio": 0, "start": 13014, "crunched": 0, "end": 16341, "filename": "/.git/hooks/fsmonitor-watchman.sample"}, {"audio": 0, "start": 16341, "crunched": 0, "end": 16530, "filename": "/.git/hooks/post-update.sample"}, {"audio": 0, "start": 16530, "crunched": 0, "end": 16954, "filename": "/.git/hooks/pre-applypatch.sample"}, {"audio": 0, "start": 16954, "crunched": 0, "end": 18596, "filename": "/.git/hooks/pre-commit.sample"}, {"audio": 0, "start": 18596, "crunched": 0, "end": 19944, "filename": "/.git/hooks/pre-push.sample"}, {"audio": 0, "start": 19944, "crunched": 0, "end": 24842, "filename": "/.git/hooks/pre-rebase.sample"}, {"audio": 0, "start": 24842, "crunched": 0, "end": 25386, "filename": "/.git/hooks/pre-receive.sample"}, {"audio": 0, "start": 25386, "crunched": 0, "end": 26878, "filename": "/.git/hooks/prepare-commit-msg.sample"}, {"audio": 0, "start": 26878, "crunched": 0, "end": 30488, "filename": "/.git/hooks/update.sample"}, {"audio": 0, "start": 30488, "crunched": 0, "end": 30728, "filename": "/.git/info/exclude"}, {"audio": 0, "start": 30728, "crunched": 0, "end": 31701, "filename": "/.git/logs/HEAD"}, {"audio": 0, "start": 31701, "crunched": 0, "end": 31880, "filename": "/.git/logs/refs/heads/gh-pages"}, {"audio": 0, "start": 31880, "crunched": 0, "end": 32513, "filename": "/.git/logs/refs/heads/master"}, {"audio": 0, "start": 32513, "crunched": 0, "end": 32685, "filename": "/.git/logs/refs/remotes/origin/HEAD"}, {"audio": 0, "start": 32685, "crunched": 0, "end": 33121, "filename": "/.git/logs/refs/remotes/origin/master"}, {"audio": 0, "start": 33121, "crunched": 0, "end": 33284, "filename": "/.git/objects/01/6a65493509f33468d03abbd94d3312fd9a63f7"}, {"audio": 0, "start": 33284, "crunched": 0, "end": 34473, "filename": "/.git/objects/02/850e1039c46a51391764663b3aeacaabc6ff66"}, {"audio": 0, "start": 34473, "crunched": 0, "end": 34773, "filename": "/.git/objects/2e/cb1172d825764345933030768de98e84c285b2"}, {"audio": 0, "start": 34773, "crunched": 0, "end": 34937, "filename": "/.git/objects/35/c176103394ca96016bffb1944d6a1dc8d9f9dd"}, {"audio": 0, "start": 34937, "crunched": 0, "end": 35131, "filename": "/.git/objects/3e/d60531eb3ebad4853bb22afb45f3f792eb062d"}, {"audio": 0, "start": 35131, "crunched": 0, "end": 36693, "filename": "/.git/objects/40/0ff77fc3c1789293af220136dcbe01fafeeb33"}, {"audio": 0, "start": 36693, "crunched": 0, "end": 37563, "filename": "/.git/objects/4b/29ad1b3ae0174e02cb007fd011f8bd7ea980bd"}, {"audio": 0, "start": 37563, "crunched": 0, "end": 37862, "filename": "/.git/objects/57/0ad97de4b2bcd5b1af6c005ed0c8a899ea29b8"}, {"audio": 0, "start": 37862, "crunched": 0, "end": 173084, "filename": "/.git/objects/64/5c12961233fc163eeb98e4f5f1cef2ec1b2d57"}, {"audio": 0, "start": 173084, "crunched": 0, "end": 173383, "filename": "/.git/objects/96/9580a0e8a1b735d09b008749068da4e80c1220"}, {"audio": 0, "start": 173383, "crunched": 0, "end": 174289, "filename": "/.git/objects/9b/17c1362def103b97a538cd5c05e5e22b00965e"}, {"audio": 0, "start": 174289, "crunched": 0, "end": 176525, "filename": "/.git/objects/a2/e4ba6582c7978b0218ed8c3167355e12e5168a"}, {"audio": 0, "start": 176525, "crunched": 0, "end": 176689, "filename": "/.git/objects/b0/a091ccef718930f45968587cb9d5fa51f343f0"}, {"audio": 0, "start": 176689, "crunched": 0, "end": 176801, "filename": "/.git/objects/bf/e90df8a78a83b2c0b4e9c38e9fd7c760105ca0"}, {"audio": 0, "start": 176801, "crunched": 0, "end": 176925, "filename": "/.git/objects/c7/1763a75a642559fb33446e8d80bf7f556b420b"}, {"audio": 0, "start": 176925, "crunched": 0, "end": 178501, "filename": "/.git/objects/cf/762db4933935df7a4a76d17e017c8c4552760e"}, {"audio": 0, "start": 178501, "crunched": 0, "end": 179190, "filename": "/.git/objects/d0/099023ec3d0ad485de6d9b3ccc0a2603d1191e"}, {"audio": 0, "start": 179190, "crunched": 0, "end": 179301, "filename": "/.git/objects/d2/6bfae92234251b6225cc7cec5b85741c5d02ae"}, {"audio": 0, "start": 179301, "crunched": 0, "end": 179922, "filename": "/.git/objects/d6/d0d286f874b1e4f0acfd7db13664548062e22d"}, {"audio": 0, "start": 179922, "crunched": 0, "end": 182159, "filename": "/.git/objects/e8/949760b99312d2fcea889c5b90faa727636841"}, {"audio": 0, "start": 182159, "crunched": 0, "end": 184400, "filename": "/.git/objects/ec/8cc255b6b9dccde4e4582f73c78ab91f61cade"}, {"audio": 0, "start": 184400, "crunched": 0, "end": 184585, "filename": "/.git/objects/ee/8f7d830c00585f092c8cb38cb026ceb2c81c16"}, {"audio": 0, "start": 184585, "crunched": 0, "end": 185246, "filename": "/.git/objects/f9/802c51d4ff6944b5c3584d3cb431c1accde2b5"}, {"audio": 0, "start": 185246, "crunched": 0, "end": 190350, "filename": "/.git/objects/pack/pack-032aa336c280e2cf8afcb1df3e77ec8cb5a18705.idx"}, {"audio": 0, "start": 190350, "crunched": 0, "end": 22883912, "filename": "/.git/objects/pack/pack-032aa336c280e2cf8afcb1df3e77ec8cb5a18705.pack"}, {"audio": 0, "start": 22883912, "crunched": 0, "end": 22883953, "filename": "/.git/refs/heads/gh-pages"}, {"audio": 0, "start": 22883953, "crunched": 0, "end": 22883994, "filename": "/.git/refs/heads/master"}, {"audio": 0, "start": 22883994, "crunched": 0, "end": 22884026, "filename": "/.git/refs/remotes/origin/HEAD"}, {"audio": 0, "start": 22884026, "crunched": 0, "end": 22884067, "filename": "/.git/refs/remotes/origin/master"}, {"audio": 0, "start": 22884067, "crunched": 0, "end": 22884092, "filename": "/.git/worktrees/gh-pages/HEAD"}, {"audio": 0, "start": 22884092, "crunched": 0, "end": 22884133, "filename": "/.git/worktrees/gh-pages/ORIG_HEAD"}, {"audio": 0, "start": 22884133, "crunched": 0, "end": 22884139, "filename": "/.git/worktrees/gh-pages/commondir"}, {"audio": 0, "start": 22884139, "crunched": 0, "end": 22884184, "filename": "/.git/worktrees/gh-pages/gitdir"}, {"audio": 0, "start": 22884184, "crunched": 0, "end": 22884625, "filename": "/.git/worktrees/gh-pages/index"}, {"audio": 0, "start": 22884625, "crunched": 0, "end": 22884776, "filename": "/.git/worktrees/gh-pages/logs/HEAD"}, {"audio": 0, "start": 22884776, "crunched": 0, "end": 22925202, "filename": "/assets/maps/pizza.lua"}, {"audio": 0, "start": 22925202, "crunched": 0, "end": 22965629, "filename": "/assets/maps/test.lua"}, {"audio": 0, "start": 22965629, "crunched": 0, "end": 22989546, "filename": "/assets/maps/test.tmx"}, {"audio": 1, "start": 22989546, "crunched": 0, "end": 26343074, "filename": "/assets/music/Canadian_Sorry.wav"}, {"audio": 1, "start": 26343074, "crunched": 0, "end": 28537532, "filename": "/assets/music/Maple_Syruptitle.wav"}, {"audio": 1, "start": 28537532, "crunched": 0, "end": 29022933, "filename": "/assets/music/title-intro.ogg"}, {"audio": 1, "start": 29022933, "crunched": 0, "end": 29508790, "filename": "/assets/music/title-loop.ogg"}, {"audio": 0, "start": 29508790, "crunched": 0, "end": 29644091, "filename": "/assets/sprites/pizzaEntrance.png"}, {"audio": 0, "start": 29644091, "crunched": 0, "end": 29653036, "filename": "/assets/sprites/player.png"}, {"audio": 0, "start": 29653036, "crunched": 0, "end": 29659571, "filename": "/assets/sprites/trump.png"}, {"audio": 0, "start": 29659571, "crunched": 0, "end": 29776742, "filename": "/assets/tilesets/test.png"}, {"audio": 0, "start": 29776742, "crunched": 0, "end": 29797895, "filename": "/assets/ui/logo.png"}, {"audio": 0, "start": 29797895, "crunched": 0, "end": 29843356, "filename": "/lib/Gspot.lua"}, {"audio": 0, "start": 29843356, "crunched": 0, "end": 29865523, "filename": "/lib/bump.lua"}, {"audio": 0, "start": 29865523, "crunched": 0, "end": 29866439, "filename": "/lib/bump_debug.lua"}, {"audio": 0, "start": 29866439, "crunched": 0, "end": 29870094, "filename": "/lib/main.lua"}, {"audio": 0, "start": 29870094, "crunched": 0, "end": 29872189, "filename": "/lib/sti/graphics.lua"}, {"audio": 0, "start": 29872189, "crunched": 0, "end": 29913421, "filename": "/lib/sti/init.lua"}, {"audio": 0, "start": 29913421, "crunched": 0, "end": 29918127, "filename": "/lib/sti/utils.lua"}, {"audio": 0, "start": 29918127, "crunched": 0, "end": 29927009, "filename": "/lib/sti/plugins/box2d.lua"}, {"audio": 0, "start": 29927009, "crunched": 0, "end": 29932824, "filename": "/lib/sti/plugins/bump.lua"}], "remote_package_size": 29932824, "package_uuid": "27c2123f-d815-48b3-bc1c-e688ee5456d0"});

})();
