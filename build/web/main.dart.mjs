// Compiles a dart2wasm-generated main module from `source` which can then
// be instantiated via the `instantiate` method.
//
// `source` needs to be a `Response` object (or promise thereof) e.g. created
// via the `fetch()` JS API.
export async function compileStreaming(source) {
  const builtins = {builtins: ['js-string'], importedStringConstants: ''};
  return new CompiledApp(
      await _compileStreaming(source, builtins), builtins);
}

// Compiles a dart2wasm-generated wasm module from `bytes` which is then
// instantiable via the `instantiate` method.
export async function compile(bytes) {
  const builtins = {builtins: ['js-string'], importedStringConstants: ''};
  return new CompiledApp(await WebAssembly.compile(bytes, builtins), builtins);
}

let _isCompileStreamingSupported;
async function _compileStreaming(source, builtins) {
  _isCompileStreamingSupported ??= WebAssembly.compileStreaming(
    new Response(
      new Uint8Array([0,97,115,109,1,0,0,0,1,4,1,96,0,0,2,23,1,14,119,97,115,109,58,106,115,45,115,116,114,105,110,103,4,99,97,115,116,0,0]),
      {headers: {'Content-Type': 'application/wasm'}},
    ),
    builtins,
  ).then(() => false, (e) => e instanceof WebAssembly.CompileError);
  if (await _isCompileStreamingSupported) {
    return WebAssembly.compileStreaming(source, builtins);
  }
  return WebAssembly.compile(await (await source).arrayBuffer(), builtins);
}

class CompiledApp {
  constructor(module, builtins) {
    this.module = module;
    this.builtins = builtins;
  }

  // The second argument is an options object containing:
  // `loadDeferredModules` is a JS function that takes an array of module names
  //   matching wasm files produced by the dart2wasm compiler. It also takes a
  //   callback that should be invoked for each loaded module with 2 arguments:
  //   (1) the module name, (2) the loaded module in a format supported by
  //   `WebAssembly.compile` or `WebAssembly.compileStreaming`. The callback
  //   returns a Promise that resolves when the module is instantiated.
  //   loadDeferredModules should return a Promise that resolves when all the
  //   modules have been loaded and the callback promises have resolved.
  // `loadDeferredId` is a JS function that takes load ID produced by the
  //   compiler when the `use-load-ids` option is passed. Each load ID maps to
  //   one or more wasm files as specified in the emitted JSON file. It also
  //   takes a callback that should be invoked for each loaded module with 2
  //   arguments: (1) the module name, (2) the loaded module in a format
  //   supported by `WebAssembly.compile` or `WebAssembly.compileStreaming`.
  //   The callback returns a Promise that resolves when the module is
  //   instantiated.
  //   loadDeferredId should return a Promise that resolves when all the
  //   modules have been loaded and the callback promises have resolved.
  async instantiate(additionalImports, {loadDeferredModules, loadDeferredId} = {}) {
    let dartInstance;

    // Prints to the console
    function printToConsole(value) {
      if (typeof dartPrint == "function") {
        dartPrint(value);
        return;
      }
      if (typeof console == "object" && typeof console.log != "undefined") {
        console.log(value);
        return;
      }
      if (typeof print == "function") {
        print(value);
        return;
      }

      throw "Unable to print message: " + value;
    }

    // A special symbol attached to functions that wrap Dart functions.
    const jsWrappedDartFunctionSymbol = Symbol("JSWrappedDartFunction");

    function finalizeWrapper(dartFunction, wrapped) {
      wrapped.dartFunction = dartFunction;
      wrapped[jsWrappedDartFunctionSymbol] = true;
      return wrapped;
    }

    // Imports
    const dart2wasm = {
            AB: x0 => new Int16Array(x0),
      AC: (o, start, length) => new Uint8Array(o.buffer, o.byteOffset + start, length),
      AD: (x0,x1,x2) => x0.addEventListener(x1,x2),
      AE: (o, i) => o[i],
      AF: x0 => x0.tiltY,
      AG: (x0,x1) => x0.querySelectorAll(x1),
      AH: (x0,x1) => x0.writeText(x1),
      AI: x0 => x0.offsetWidth,
      AJ: (x0,x1) => x0.decode(x1),
      AK: x0 => x0.assetManifest,
      B: s => printToConsole(s),
      BB: x0 => new Uint16Array(x0),
      BC: (o, start, length) => new Int8Array(o.buffer, o.byteOffset + start, length),
      BD: (x0,x1,x2) => x0.setAttribute(x1,x2),
      BE: o => o.length,
      BF: x0 => x0.tiltX,
      BG: (x0,x1) => x0.requestAnimationFrame(x1),
      BH: x0 => x0.unlock(),
      BI: x0 => x0.stopPropagation(),
      BJ: x0 => x0.image,
      BK: x0 => x0.buildConfig,
      C: Function.prototype.call.bind(Number.prototype.toString),
      CB: x0 => new Int32Array(x0),
      CC: (x0,x1) => x0.querySelector(x1),
      CD: (x0,x1) => x0.closest(x1),
      CE: o => {
        if (o === undefined) return 1;
        var type = typeof o;
        if (type === 'boolean') return 2;
        if (type === 'number') return 3;
        if (type === 'string') return 4;
        if (o instanceof Array) return 5;
        if (ArrayBuffer.isView(o)) {
          if (o instanceof Int8Array) return 6;
          if (o instanceof Uint8Array) return 7;
          if (o instanceof Uint8ClampedArray) return 8;
          if (o instanceof Int16Array) return 9;
          if (o instanceof Uint16Array) return 10;
          if (o instanceof Int32Array) return 11;
          if (o instanceof Uint32Array) return 12;
          if (o instanceof Float32Array) return 13;
          if (o instanceof Float64Array) return 14;
          if (o instanceof DataView) return 15;
        }
        if (o instanceof ArrayBuffer) return 16;
        // Feature check for `SharedArrayBuffer` before doing a type-check.
        if (globalThis.SharedArrayBuffer !== undefined &&
            o instanceof SharedArrayBuffer) {
            return 17;
        }
        if (o instanceof Promise) return 18;
        return 19;
      },
      CF: x0 => x0.pointerType,
      CG: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      CH: (x0,x1) => x0.lock(x1),
      CI: x0 => x0.disabled,
      CJ: x0 => x0.close(),
      CK: x0 => x0.length,
      D: Function.prototype.call.bind(BigInt.prototype.toString),
      DB: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmI32ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      DC: (x0,x1) => x0.item(x1),
      DD: (ms, c) =>
      setTimeout(() => dartInstance.exports.$invokeCallback(c),ms),
      DE: x0 => x0.language,
      DF: x0 => x0.pointerId,
      DG: x0 => x0.now(),
      DH: x0 => x0.orientation,
      DI: (x0,x1) => { x0.min = x1 },
      DJ: (x0,x1,x2,x3,x4) => ({type: x0,data: x1,premultiplyAlpha: x2,colorSpaceConversion: x3,preferAnimation: x4}),
      DK: x0 => x0.getReader(),
      E: (exn) => {
        let stackString = exn.toString();
        let frames = stackString.split('\n');
        let drop = 4;
        if (frames[0].startsWith('Error')) {
            drop += 1;
        }
        return frames.slice(drop).join('\n');
      },
      EB: x0 => new Uint32Array(x0),
      EC: x0 => x0.length,
      ED: (handle) => clearTimeout(handle),
      EE: (x0,x1,x2,x3) => x0.register(x1,x2,x3),
      EF: x0 => x0.getCoalescedEvents(),
      EG: x0 => x0.performance,
      EH: (x0,x1) => x0.querySelector(x1),
      EI: (x0,x1) => { x0.max = x1 },
      EJ: x0 => new window.ImageDecoder(x0),
      EK: x0 => x0.value,
      F: () => new Error().stack,
      FB: x0 => new Float32Array(x0),
      FC: (x0,x1) => x0.querySelectorAll(x1),
      FD: x0 => x0.maxTouchPoints,
      FE: () => globalThis.window.FinalizationRegistry,
      FF: s => s.trimLeft(),
      FG: (d, digits) => d.toFixed(digits),
      FH: (x0,x1) => { x0.title = x1 },
      FI: (x0,x1) => { x0.disabled = x1 },
      FJ: x0 => x0.name,
      FK: x0 => x0.done,
      G: s => JSON.stringify(s),
      GB: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmF32ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      GC: (x0,x1) => x0.getAttribute(x1),
      GD: x0 => x0.platform,
      GE: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      GF: s => s.toUpperCase(),
      GG: x0 => x0.maxHeight,
      GH: (x0,x1) => x0.vibrate(x1),
      GI: (x0,x1) => { x0.scrollLeft = x1 },
      GJ: x0 => x0.repetitionCount,
      GK: x0 => x0.read(),
      H: Function.prototype.call.bind(Number.prototype.toString),
      HB: x0 => new Float64Array(x0),
      HC: x0 => x0.remove(),
      HD: s => new Date(s * 1000).getTimezoneOffset() * 60,
      HE: x0 => new window.FinalizationRegistry(x0),
      HF: (x0,x1) => x0[x1],
      HG: x0 => x0.maxWidth,
      HH: x0 => x0.arrayBuffer(),
      HI: (x0,x1) => { x0.spellcheck = x1 },
      HJ: x0 => x0.frameCount,
      HK: x0 => x0.body,
      I: Function.prototype.call.bind(String.prototype.indexOf),
      IB: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmF64ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      IC: (x0,x1) => x0.appendChild(x1),
      ID: Date.now,
      IE: (x0,x1) => x0.unregister(x1),
      IF: x0 => x0.length,
      IG: x0 => x0.minHeight,
      IH: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof ArrayBuffer) return 1;
        if (globalThis.SharedArrayBuffer !== undefined &&
            o instanceof SharedArrayBuffer) {
          return 2;
        }
        return 3;
      },
      II: (x0,x1) => { x0.disabled = x1 },
      IJ: x0 => x0.selectedTrack,
      IK: (x0,x1) => new OffscreenCanvas(x0,x1),
      J: (s, p, i) => s.lastIndexOf(p, i),
      JB: x0 => new ArrayBuffer(x0),
      JC: (x0,x1) => x0.append(x1),
      JD: (x0,x1) => x0.contains(x1),
      JE: x0 => x0.preventDefault(),
      JF: (x0,x1) => x0.exec(x1),
      JG: x0 => x0.minWidth,
      JH: x0 => x0.status,
      JI: (a, i) => a.splice(i, 1),
      JJ: x0 => x0.completed,
      JK: x0 => x0.assetBase,
      K: (exn) => {
        if (exn instanceof Error) {
          return exn.stack;
        } else {
          return null;
        }
      },
      KB: (x0,x1,x2) => new Uint8Array(x0,x1,x2),
      KC: (x0,x1,x2,x3) => x0.setProperty(x1,x2,x3),
      KD: (decoder, codeUnits) => decoder.decode(codeUnits),
      KE: x0 => x0.parent,
      KF: x0 => x0.index,
      KG: (x0,x1) => x0.removeProperty(x1),
      KH: (x0,x1) => x0.fetch(x1),
      KI: a => a.pop(),
      KJ: x0 => x0.ready,
      KK: x0 => x0.loader,
      L: o => o === undefined,
      LB: (x0,x1,x2) => new DataView(x0,x1,x2),
      LC: x0 => x0.style,
      LD: () => new TextDecoder("utf-8", {fatal: true}),
      LE: x0 => x0.timeStamp,
      LF: x0 => x0.pop(),
      LG: (x0,x1) => x0.add(x1),
      LH: x0 => x0.content,
      LI: x0 => new WeakRef(x0),
      LJ: x0 => x0.tracks,
      LK: () => globalThis._flutter,
      M: o => String(o),
      MB: (o, p) => o[p],
      MC: x0 => x0.debugShowSemanticsNodes,
      MD: () => new TextDecoder("utf-8", {fatal: false}),
      ME: (x0,x1) => x0.hasAttribute(x1),
      MF: x0 => x0.flags,
      MG: x0 => x0.data,
      MH: x0 => x0.document,
      MI: x0 => x0.deref(),
      MJ: () => globalThis.window.ImageDecoder,
      N: (c) =>
      queueMicrotask(() => dartInstance.exports.$invokeCallback(c)),
      NB: (o) => new DataView(o.buffer, o.byteOffset, o.byteLength),
      NC: o => o,
      ND: (a, i, v) => a[i] = v,
      NE: x0 => x0.type,
      NF: (a, s) => a.join(s),
      NG: (x0,x1) => x0.removeAttribute(x1),
      NH: () => typeof dartUseDateNowForTicks !== "undefined",
      NI: () => globalThis.WeakRef,
      NJ: (x0,x1,x2,x3,x4,x5,x6,x7,x8,x9) => x0.drawImage(x1,x2,x3,x4,x5,x6,x7,x8,x9),
      O: (x0,x1) => x0.didCreateEngineInitializer(x1),
      OB: Function.prototype.call.bind(Object.getOwnPropertyDescriptor(DataView.prototype, 'byteLength').get),
      OC: o => {
        if (o === undefined || o === null) return 0;
        if (typeof o === 'boolean') return 1;
        return 2;
      },
      OD: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmI8ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      OE: (x0,x1) => x0.getModifierState(x1),
      OF: (x0,x1) => x0.error(x1),
      OG: (x0,x1) => { x0.value = x1 },
      OH: () => Date.now(),
      OI: (o, offsetInBytes, lengthInBytes) => {
        var dst = new ArrayBuffer(lengthInBytes);
        new Uint8Array(dst).set(new Uint8Array(o, offsetInBytes, lengthInBytes));
        return new DataView(dst);
      },
      OJ: (x0,x1) => x0.getContext(x1),
      P: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      PB: o => o.byteOffset,
      PC: (x0,x1) => x0.warn(x1),
      PD: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmI32ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      PE: x0 => x0.buttons,
      PF: () => globalThis.console,
      PG: (x0,x1) => { x0.value = x1 },
      PH: () => 1000 * performance.now(),
      PI: (a, s, e) => a.slice(s, e),
      PJ: (x0,x1) => { x0.height = x1 },
      Q: (wasmFunction,f) => finalizeWrapper(f, function() { return wasmFunction(f,arguments.length) }),
      QB: o => o.buffer,
      QC: x0 => x0.console,
      QD: (s) => +s,
      QE: x0 => x0.ctrlKey,
      QF: s => s.trimRight(),
      QG: x0 => x0.value,
      QH: x0 => new Uint8Array(x0),
      QI: (o, p) => p in o,
      QJ: (x0,x1) => { x0.width = x1 },
      R: (x0,x1) => ({initializeEngine: x0,autoStart: x1}),
      RB: Function.prototype.call.bind(DataView.prototype.getUint8),
      RC: () => globalThis.window,
      RD: s => {
        if (!/^\s*[+-]?(?:Infinity|NaN|(?:\.\d+|\d+(?:\.\d*)?)(?:[eE][+-]?\d+)?)\s*$/.test(s)) {
          return NaN;
        }
        return parseFloat(s);
      },
      RE: x0 => x0.getBoundingClientRect(),
      RF: x0 => x0.blur(),
      RG: x0 => x0.selectionDirection,
      RH: (x0,x1,x2) => x0.slice(x1,x2),
      RI: x0 => x0.groups,
      RJ: (x0,x1) => x0.transferFromImageBitmap(x1),
      S: (wasmFunction,f) => finalizeWrapper(f, function(x0,x1) { return wasmFunction(f,arguments.length,x0,x1) }),
      SB: (b, o) => new DataView(b, o),
      SC: (o, c) => o instanceof c,
      SD: s => s.trim(),
      SE: x0 => x0.y,
      SF: x0 => x0.button,
      SG: x0 => x0.selectionStart,
      SH: (x0,x1) => x0.decode(x1),
      SI: () => {
        return typeof process != "undefined" &&
               Object.prototype.toString.call(process) == "[object process]" &&
               process.platform == "win32"
      },
      SJ: x0 => x0.rasterEndMilliseconds,
      T: x0 => new Promise(x0),
      TB: (b, o, l) => new DataView(b, o, l),
      TC: (string, token) => string.split(token),
      TD: x0 => x0.classList,
      TE: x0 => x0.x,
      TF: (x0,x1) => x0.prepend(x1),
      TG: x0 => x0.selectionEnd,
      TH: (x0,x1) => x0.adoptText(x1),
      TI: () => {
        // On browsers return `globalThis.location.href`
        if (globalThis.location != null) {
          return globalThis.location.href;
        }
        return null;
      },
      TJ: x0 => x0.rasterStartMilliseconds,
      U: (x0,x1,x2) => x0.call(x1,x2),
      UB: Function.prototype.call.bind(DataView.prototype.getFloat64),
      UC: o => o instanceof Array,
      UD: x0 => x0.relatedTarget,
      UE: x0 => x0.top,
      UF: x0 => x0.parentElement,
      UG: x0 => x0.value,
      UH: x0 => x0.first(),
      UI: () => new AbortController(),
      UJ: x0 => x0.imageBitmaps,
      V: (constructor, args) => {
        const factoryFunction = constructor.bind.apply(
            constructor, [null, ...args]);
        return new factoryFunction();
      },
      VB: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Float64Array) return 1;
        return 2;
      },
      VC: (a, i) => a[i],
      VD: x0 => x0.hasFocus(),
      VE: x0 => x0.left,
      VF: x0 => x0.innerHeight,
      VG: x0 => x0.selectionDirection,
      VH: x0 => x0.next(),
      VI: (x0,x1,x2,x3,x4,x5) => ({method: x0,headers: x1,body: x2,credentials: x3,redirect: x4,signal: x5}),
      VJ: x0 => x0.canvasKitMaximumSurfaces,
      W: x0 => new Array(x0),
      WB: Function.prototype.call.bind(DataView.prototype.setFloat64),
      WC: a => a.length,
      WD: x0 => x0.shiftKey,
      WE: x0 => x0.scrollTop,
      WF: x0 => x0.innerWidth,
      WG: x0 => x0.selectionStart,
      WH: x0 => x0.current(),
      WI: (x0,x1) => globalThis.fetch(x0,x1),
      WJ: x0 => x0.hostElement,
      X: o => [o],
      XB: (t, s) => t.set(s),
      XC: (x0,x1) => x0.test(x1),
      XD: x0 => x0.body,
      XE: x0 => x0.offsetTop,
      XF: x0 => x0.height,
      XG: x0 => x0.selectionEnd,
      XH: (x0,x1) => new Intl.v8BreakIterator(x0,x1),
      XI: (x0,x1) => x0.get(x1),
      XJ: x0 => x0.location,
      Y: (o0, o1) => [o0, o1],
      YB: Function.prototype.call.bind(DataView.prototype.setFloat32),
      YC: x0 => x0.userAgent,
      YD: x0 => x0.visibilityState,
      YE: x0 => x0.scrollLeft,
      YF: x0 => x0.width,
      YG: (x0,x1) => { x0.name = x1 },
      YH: x0 => x0.v8BreakIterator,
      YI: (wasmFunction,f) => finalizeWrapper(f, function(x0,x1,x2) { return wasmFunction(f,arguments.length,x0,x1,x2) }),
      YJ: (x0,x1) => x0.getModifierState(x1),
      Z: (o0, o1, o2) => [o0, o1, o2],
      ZB: Function.prototype.call.bind(DataView.prototype.getFloat32),
      ZC: x0 => x0.navigator,
      ZD: (x0,x1,x2) => x0.removeEventListener(x1,x2),
      ZE: x0 => x0.offsetLeft,
      ZF: x0 => x0.clientHeight,
      ZG: (x0,x1) => { x0.placeholder = x1 },
      ZH: () => globalThis.Intl,
      ZI: (x0,x1) => x0.forEach(x1),
      ZJ: x0 => x0.metaKey,
      a: (o0, o1, o2, o3) => [o0, o1, o2, o3],
      aB: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Float32Array) return 1;
        return 2;
      },
      aC: Function.prototype.call.bind(String.prototype.toLowerCase),
      aD: x0 => x0.disconnect(),
      aE: x0 => x0.offsetParent,
      aF: x0 => x0.clientWidth,
      aG: (x0,x1) => { x0.autocomplete = x1 },
      aH: (x0,x1) => x0.segment(x1),
      aI: x0 => x0.name,
      aJ: x0 => x0.altKey,
      b: (x0,x1,x2) => { x0[x1] = x2 },
      bB: Function.prototype.call.bind(DataView.prototype.getUint32),
      bC: Object.is,
      bD: x0 => new Intl.Locale(x0),
      bE: x0 => x0.offsetY,
      bF: x0 => x0.isConnected,
      bG: (x0,x1) => { x0.type = x1 },
      bH: x0 => x0.index,
      bI: x0 => x0.statusText,
      bJ: x0 => x0.ctrlKey,
      c: o => o,
      cB: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Uint32Array) return 1;
        return 2;
      },
      cC: x0 => x0.vendor,
      cD: x0 => x0.region,
      cE: x0 => x0.offsetX,
      cF: x0 => x0.head,
      cG: (x0,x1) => { x0.name = x1 },
      cH: x0 => x0.next(),
      cI: x0 => x0.url,
      cJ: x0 => x0.isComposing,
      d: (o, p) => o[p],
      dB: Function.prototype.call.bind(DataView.prototype.getInt32),
      dC: (x0,x1) => x0.createTextNode(x1),
      dD: x0 => x0.script,
      dE: (o, p, r) => o.replace(p, () => r),
      dF: (x0,x1) => { x0.content = x1 },
      dG: (x0,x1) => { x0.placeholder = x1 },
      dH: x0 => x0.value,
      dI: x0 => x0.status,
      dJ: x0 => x0.code,
      e: () => globalThis,
      eB: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Int32Array) return 1;
        return 2;
      },
      eC: (x0,x1) => { x0.id = x1 },
      eD: x0 => x0.language,
      eE: (x0,x1) => { x0.lastIndex = x1 },
      eF: (x0,x1) => { x0.name = x1 },
      eG: (x0,x1) => { x0.scrollTop = x1 },
      eH: x0 => x0.done,
      eI: x0 => x0.cancel(),
      eJ: x0 => x0.repeat,
      f: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      fB: o => o instanceof Uint16Array,
      fC: (x0,x1) => { x0.nonce = x1 },
      fD: x0 => x0.languages,
      fE: (s, m) => {
        try {
          return new RegExp(s, m);
        } catch (e) {
          return String(e);
        }
      },
      fF: (x0,x1) => x0.removeChild(x1),
      fG: (x0,x1,x2) => x0.setSelectionRange(x1,x2),
      fH: (o, m, a) => o[m].apply(o, a),
      fI: x0 => x0.getReader(),
      fJ: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      g: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      gB: Function.prototype.call.bind(DataView.prototype.getUint16),
      gC: x0 => x0.nonce,
      gD: (x0,x1) => x0.observe(x1),
      gE: o => o instanceof RegExp,
      gF: x0 => x0.firstChild,
      gG: (x0,x1,x2) => x0.setSelectionRange(x1,x2),
      gH: x0 => x0.iterator,
      gI: x0 => x0.read(),
      gJ: (x0,x1) => x0.canShare(x1),
      h: (x0,x1) => ({addView: x0,removeView: x1}),
      hB: o => o instanceof Int16Array,
      hC: () => globalThis.window.flutterConfiguration,
      hD: (wasmFunction,f) => finalizeWrapper(f, function(x0,x1) { return wasmFunction(f,arguments.length,x0,x1) }),
      hE: x0 => x0.dotAll,
      hF: x0 => x0.viewConstraints,
      hG: s => {
        if (/[[\]{}()*+?.\\^$|]/.test(s)) {
            s = s.replace(/[[\]{}()*+?.\\^$|]/g, '\\$&');
        }
        return s;
      },
      hH: () => globalThis.Symbol,
      hI: x0 => x0.value,
      hJ: (x0,x1) => x0.share(x1),
      i: (l, r) => l === r,
      iB: Function.prototype.call.bind(DataView.prototype.getInt16),
      iC: (x0,x1) => x0.attachShadow(x1),
      iD: x0 => new ResizeObserver(x0),
      iE: x0 => x0.unicode,
      iF: x0 => x0.hostElement,
      iG: x0 => x0.keyCode,
      iH: (x0,x1) => new Intl.Segmenter(x0,x1),
      iI: x0 => x0.done,
      iJ: x0 => x0.message,
      j: x0 => x0.random(),
      jB: o => o instanceof Uint8ClampedArray,
      jC: (x0,x1) => x0.createElement(x1),
      jD: (x0,x1) => x0.getPropertyValue(x1),
      jE: x0 => x0.ignoreCase,
      jF: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      jG: (x0,x1) => x0.scrollIntoView(x1),
      jH: x0 => x0.Segmenter,
      jI: x0 => x0.body,
      jJ: (x0,x1,x2,x3) => x0.open(x1,x2,x3),
      k: o => o,
      kB: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Uint8Array) return 1;
        return 2;
      },
      kC: x0 => x0.scale,
      kD: x0 => globalThis.parseFloat(x0),
      kE: x0 => x0.multiline,
      kF: x0 => ({runApp: x0}),
      kG: x0 => x0.multiViewEnabled,
      kH: x0 => x0.buffer,
      kI: x0 => x0.headers,
      kJ: (x0,x1) => ({files: x0,text: x1}),
      l: o => {
        if (o === undefined || o === null) return 0;
        if (typeof o === 'number') return 1;
        return 2;
      },
      lB: Function.prototype.call.bind(DataView.prototype.setInt32),
      lC: x0 => x0.visualViewport,
      lD: (x0,x1) => x0.getComputedStyle(x1),
      lE: (o, p, r) => o.replaceAll(p, () => r),
      lF: Function.prototype.call.bind(DataView.prototype.getBigInt64),
      lG: (x0,x1) => x0.replaceWith(x1),
      lH: x0 => x0.wasmMemory,
      lI: x0 => x0.signal,
      lJ: x0 => ({files: x0}),
      m: () => globalThis.Math,
      mB: Function.prototype.call.bind(DataView.prototype.setUint32),
      mC: x0 => x0.devicePixelRatio,
      mD: x0 => x0.documentElement,
      mE: x0 => x0.deltaMode,
      mF: Function.prototype.call.bind(DataView.prototype.setBigInt64),
      mG: (x0,x1) => { x0.className = x1 },
      mH: () => globalThis.window._flutter_skwasmInstance,
      mI: x0 => x0.close(),
      mJ: x0 => ({text: x0}),
      n: (x0,x1,x2,x3) => x0.addEventListener(x1,x2,x3),
      nB: Function.prototype.call.bind(DataView.prototype.setInt16),
      nC: x0 => x0.height,
      nD: x0 => x0.computedStyleMap(),
      nE: x0 => x0.deltaY,
      nF: (o, start, length) => new BigInt64Array(o.buffer, o.byteOffset + start, length),
      nG: (x0,x1) => { x0.tabIndex = x1 },
      nH: () => new TextDecoder(),
      nI: x0 => x0.height,
      nJ: x0 => x0.navigator,
      o: b => !!b,
      oB: Function.prototype.call.bind(DataView.prototype.setUint16),
      oC: x0 => x0.width,
      oD: (x0,x1) => x0.get(x1),
      oE: x0 => x0.deltaX,
      oF: (x0,x1,x2,x3) => x0.pushState(x1,x2,x3),
      oG: (x0,x1) => { x0.action = x1 },
      oH: (map, o, v) => map.set(o, v),
      oI: x0 => x0.width,
      oJ: () => globalThis.window,
      p: () => globalThis.document,
      pB: Function.prototype.call.bind(DataView.prototype.setUint8),
      pC: x0 => x0.screen,
      pD: (o, p) => p in o,
      pE: x0 => x0.wheelDeltaY,
      pF: x0 => x0.history,
      pG: (x0,x1) => { x0.method = x1 },
      pH: (map, o) => map.get(o),
      pI: (x0,x1,x2,x3,x4,x5) => x0.createImageBitmap(x1,x2,x3,x4,x5),
      pJ: x0 => x0.userAgent,
      q: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      qB: Function.prototype.call.bind(DataView.prototype.setInt8),
      qC: (string, times) => string.repeat(times),
      qD: (x0,x1) => { x0.textContent = x1 },
      qE: x0 => x0.wheelDeltaX,
      qF: x0 => x0.search,
      qG: (x0,x1) => { x0.noValidate = x1 },
      qH: () => new WeakMap(),
      qI: (x0,x1) => x0.createImageBitmap(x1),
      qJ: (x0,x1) => x0.getItem(x1),
      r: (x0,x1) => x0.focus(x1),
      rB: Function.prototype.call.bind(DataView.prototype.getInt8),
      rC: o => {
        if (o === null || o === undefined) return 0;
        if (typeof(o) === 'string') return 1;
        return 2;
      },
      rD: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      rE: x0 => x0.bottom,
      rF: x0 => x0.location,
      rG: x0 => x0.click(),
      rH: x0 => x0.debugSkipFontRetryDelay,
      rI: x0 => new Blob(x0),
      rJ: x0 => x0.localStorage,
      s: () => ({}),
      sB: o => {
        if (o === null || o === undefined) return 0;
        if (o instanceof Int8Array) return 1;
        return 2;
      },
      sC: x0 => x0.tabIndex,
      sD: x0 => x0.matches,
      sE: x0 => x0.right,
      sF: x0 => x0.pathname,
      sG: (x0,x1) => x0.getElementsByClassName(x1),
      sH: (x0,x1,x2) => x0.set(x1,x2),
      sI: x0 => x0.close(),
      sJ: (x0,x1) => x0.key(x1),
      t: (o, p, v) => o[p] = v,
      tB: (o, start, length) => new Float64Array(o.buffer, o.byteOffset + start, length),
      tC: (x0,x1) => x0.contains(x1),
      tD: (x0,x1) => x0.matchMedia(x1),
      tE: x0 => x0.clientY,
      tF: (x0,x1,x2,x3) => x0.replaceState(x1,x2,x3),
      tG: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmF32ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      tH: x0 => x0.fontFallbackBaseUrl,
      tI: x0 => x0.naturalHeight,
      tJ: x0 => x0.length,
      u: () => [],
      uB: (o, start, length) => new Float32Array(o.buffer, o.byteOffset + start, length),
      uC: x0 => x0.activeElement,
      uD: x0 => x0.matches,
      uE: x0 => x0.clientX,
      uF: o => {
        const proto = Object.getPrototypeOf(o);
        return proto === Object.prototype || proto === null;
      },
      uG: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmF64ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      uH: (handle) => clearInterval(handle),
      uI: x0 => x0.naturalWidth,
      uJ: (x0,x1,x2) => x0.setItem(x1,x2),
      v: (a, i) => a.push(i),
      vB: (o, start, length) => new Uint32Array(o.buffer, o.byteOffset + start, length),
      vC: x0 => x0.parentNode,
      vD: o => typeof o === 'function' && o[jsWrappedDartFunctionSymbol] === true,
      vE: x0 => x0.changedTouches,
      vF: o => Object.keys(o),
      vG: (x0,x1) => x0.dispatchEvent(x1),
      vH: (ms, c) =>
      setInterval(() => dartInstance.exports.$invokeCallback(c), ms),
      vI: (x0,x1) => { x0.src = x1 },
      vJ: x0 => x0.baseURI,
      w: x0 => new Int8Array(x0),
      wB: (o, start, length) => new Int32Array(o.buffer, o.byteOffset + start, length),
      wC: x0 => x0.tagName,
      wD: f => f.dartFunction,
      wE: x0 => x0.key,
      wF: x0 => x0.state,
      wG: (x0,x1) => x0.createEvent(x1),
      wH: () => Date.now(),
      wI: x0 => x0.displayHeight,
      wJ: x0 => x0.document,
      x: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmI8ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      xB: (o, start, length) => new Uint16Array(o.buffer, o.byteOffset + start, length),
      xC: x0 => x0.target,
      xD: (wasmFunction,f) => finalizeWrapper(f, function(x0) { return wasmFunction(f,arguments.length,x0) }),
      xE: x0 => x0.identifier,
      xF: x0 => x0.hash,
      xG: (x0,x1,x2,x3) => x0.initEvent(x1,x2,x3),
      xH: (x0,x1,x2) => x0.insertBefore(x1,x2),
      xI: x0 => x0.displayWidth,
      xJ: x0 => x0.abort(),
      y: x0 => new Uint8Array(x0),
      yB: (o, start, length) => new Int16Array(o.buffer, o.byteOffset + start, length),
      yC: x0 => x0.clientY,
      yD: (wasmFunction,f) => finalizeWrapper(f, function(x0,x1) { return wasmFunction(f,arguments.length,x0,x1) }),
      yE: x0 => x0.touches,
      yF: x0 => x0.state,
      yG: x0 => x0.readText(),
      yH: x0 => x0.id,
      yI: x0 => x0.duration,
      yJ: x0 => x0.extraAssets,
      z: x0 => new Uint8ClampedArray(x0),
      zB: (o, start, length) => new Uint8ClampedArray(o.buffer, o.byteOffset + start, length),
      zC: x0 => x0.clientX,
      zD: (p, s, f) => p.then(s, (e) => f(e, e === undefined)),
      zE: x0 => x0.pressure,
      zF: (x0,x1) => x0.go(x1),
      zG: x0 => x0.clipboard,
      zH: x0 => x0.offsetHeight,
      zI: (x0,x1) => ({frameIndex: x0,completeFramesOnly: x1}),
      zJ: x0 => x0.fontManifest,

    };

    const baseImports = {
      _: dart2wasm,
      Math: Math,
      Date: Date,
      Object: Object,
      Array: Array,
      Reflect: Reflect,
      WebAssembly: {
        JSTag: WebAssembly.JSTag,
      },
      "": new Proxy({}, { get(_, prop) { return prop; } }),

    };

    

    dartInstance = await WebAssembly.instantiate(this.module, {
      ...baseImports,
      ...additionalImports,
      
    });

    return new InstantiatedApp(this, dartInstance);
  }
}

class InstantiatedApp {
  constructor(compiledApp, instantiatedModule) {
    this.compiledApp = compiledApp;
    this.instantiatedModule = instantiatedModule;
  }

  // Call the main function with the given arguments.
  invokeMain(...args) {
    this.instantiatedModule.exports.$invokeMain(args);
  }
}
