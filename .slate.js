// Configs  testing
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000,
  "orderScreensLeftToRight" : true
});

// Monitors
var monTbolt  = "2560x1600";
var monLaptop = "1920x1080";

// Operations
var lapFull = S.op("move", {
  "screen" : monLaptop,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});
var lapChat = S.op("corner", {
  "screen" : monLaptop,
  "direction" : "top-left",
  "width" : "screenSizeX/9",
  "height" : "screenSizeY"
});
var lapMain = lapChat.dup({ "direction" : "top-right", "width" : "8*screenSizeX/9" });
var tboltFull = S.op("move", {
  "screen" : monTbolt,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});
var tboltBig = S.op("move", {
  "screen" : monTbolt,
  "x" : "screenOriginX+screenSizeX/3",
  "y" : "screenOriginY",
  "width" : "screenSizeX*2/3",
  "height" : "screenSizeY",
});
var tboltLeft = tboltFull.dup({ "width" : "screenSizeX/3" });
var tboltMid = tboltLeft.dup({ "x" : "screenOriginX+screenSizeX/3" });
var tboltRight = tboltLeft.dup({ "x" : "screenOriginX+(screenSizeX*2/3)" });
var tboltLeftTop = tboltLeft.dup({ "height" : "screenSizeY/2" });
var tboltLeftBot = tboltLeftTop.dup({ "y" : "screenOriginY+screenSizeY/2" });
var tboltMidTop = tboltMid.dup({ "height" : "screenSizeY/2" });
var tboltMidBot = tboltMidTop.dup({ "y" : "screenOriginY+screenSizeY/2" });
var tboltRightTop = tboltRight.dup({ "height" : "screenSizeY/2" });
var tboltRightBot = tboltRightTop.dup({ "y" : "screenOriginY+screenSizeY/2" });

// common layout hashes
var lapMainHash = {
  "operations" : [lapMain],
  "ignore-fail" : true,
  "repeat" : true
};
var lapFullHash = {
  "operations" : [lapFull],
  "ignore-fail" : true,
  "repeat" : true
};
var adiumHash = {
  "operations" : [lapChat, lapMain],
  "ignore-fail" : true,
  "title-order" : ["Contacts"],
  "repeat-last" : true
};
var mvimHash = {
  "operations" : [tboltMid, tboltRightTop],
  "repeat" : true
};
var tboltBigHash = {
  "operations" : [tboltBig],
  "sort-title" : true,
  "repeat" : true
};
var tboltFullHash = {
  "operations" : [tboltFull],
  "sort-title" : true,
  "repeat" : true
};
var genBrowserHash = function(regex) {
  return {
    "operations" : [function(windowObject) {
      var title = windowObject.title();
      if (title !== undefined && title.match(regex)) {
        windowObject.doOperation(tboltLeftBot);
      } else {
        windowObject.doOperation(lapFull);
      }
    }],
    "ignore-fail" : true,
    "repeat" : true
  };
}

// 2 monitor layout
var twoMonitorLayout = S.lay("twoMonitor", {
  "Adium" : {
    "operations" : [lapChat, lapMain],
    "ignore-fail" : true,
    "title-order" : ["Contacts"],
    "repeat-last" : true
  },
  "MacVim" : mvimHash,
  "iTerm" : tboltFullHash,
  "Xcode" : tboltBigHash,
  "Google Chrome" : genBrowserHash(/^Developer\sTools\s-\s.+$/),
  "GitX" : {
    "operations" : [lapFull],
    "repeat" : true
  },
  "Firefox" : genBrowserHash(/^Firebug\s-\s.+$/),
  "Safari" : lapFullHash,
  "Spotify" : {
    "operations" : [lapFull],
    "repeat" : true
  },
  "TextEdit" : {
    "operations" : [lapFull],
    "repeat" : true
  }
});

// 1 monitor layout
var oneMonitorLayout = S.lay("oneMonitor", {
  "Adium" : adiumHash,
  "MacVim" : lapFullHash,
  "iTerm" : lapFullHash,
  "Google Chrome" : lapFullHash,
  "Xcode" : lapFullHash,
  "Flex Builder" : lapFullHash,
  "GitX" : lapFullHash,
  "Ooyala Player Debug Console" : lapFullHash,
  "Firefox" : lapFullHash,
  "Safari" : lapFullHash,
  "Eclipse" : lapFullHash,
  "Spotify" : lapFullHash
});

// Defaults
//S.def(2, twoMonitorLayout);
//S.def(1, oneMonitorLayout);

// Layout Operations
var twoMonitor = S.op("layout", { "name" : twoMonitorLayout });
var oneMonitor = S.op("layout", { "name" : oneMonitorLayout });
var universalLayout = function() {
  // Should probably make sure the resolutions match but w/e
  S.log("SCREEN COUNT: "+S.screenCount());
  if (S.screenCount() === 2) {
    twoMonitor.run();
  } else if (S.screenCount() === 1) {
    oneMonitor.run();
  }
};



var cornerTopLeft = slate.operation("corner", {
  "direction" : "top-left",
  "width" : "screenSizeX/2",
  "height" : "screenSizeY/2"
});
var cornerTopRight = cornerTopLeft.dup({ "direction" : "top-right" });
var cornerBottomRight = cornerTopLeft.dup({ "direction" : "bottom-right" });
var cornerBottomLeft = cornerTopLeft.dup({ "direction" : "bottom-left" });

slate.bind("h:ctrl;cmd", cornerTopLeft);
slate.bind("l:ctrl;cmd", cornerTopRight);
slate.bind("j:ctrl;cmd", cornerBottomLeft);
slate.bind("k:ctrl;cmd", cornerBottomRight );




// 最小化窗口

var resize_win = slate.operation("resize", {
  "width" : "screenOriginX+screenSizeX/10",
  "height" : "screenOriginY+screenSizeY/10"
});


var min_win = S.op("corner", {
  "screen" : monLaptop,
  "direction" : "bottom-left",
  "width" : "screenSizeX/9",
  "height" : "screenSizeY/9"
});


slate.bind("n:ctrl", min_win);
//slate.bind("n:ctrl", resize_win);




// Batch bind everything. Less typing.
S.bnda({
  // Layout Bindings
  //"padEnter:ctrl" : universalLayout,
  //"space:ctrl" : universalLayout,

  // Basic Location Bindings
  //"[:ctrl" : lapChat,
  //"]:ctrl" : lapMain,
  //"1:ctrl;shift" : tboltLeftBot,  //左下
  //"2:ctrl;shift" : tboltMidBot,  //左下中
  //"3:ctrl;shift" : tboltRightBot,
  //"4:ctrl;shift" : tboltLeftTop,
  //"5:ctrl;shift" : tboltMidTop,
  //"6:ctrl;shift" : tboltRightTop,
  //"7:ctrl;shift" : tboltLeft,
  //"8:ctrl;shift" : tboltMid,
  //"9:ctrl;shift" : tboltRight,
  //"0:ctrl;shift" : tboltFull,

  // Resize Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "right:ctrl" : S.op("resize", { "width" : "+10%", "height" : "+0" }), //右边边长往右扩大10
  "left:ctrl" : S.op("resize", { "width" : "-10%", "height" : "+0" }),  //右边边长往左扩大10
  "up:ctrl" : S.op("resize", { "width" : "+0", "height" : "-10%" }),  //底边往上扩大10
  "down:ctrl" : S.op("resize", { "width" : "+0", "height" : "+10%" }),  //底边高度往下扩大10
  "right:alt" : S.op("resize", { "width" : "-10%", "height" : "+0", "anchor" : "bottom-right" }),
  "left:alt" : S.op("resize", { "width" : "+10%", "height" : "+0", "anchor" : "bottom-right" }),
  "up:alt" : S.op("resize", { "width" : "+0", "height" : "+10%", "anchor" : "bottom-right" }),
  "down:alt" : S.op("resize", { "width" : "+0", "height" : "-10%", "anchor" : "bottom-right" }),

    // Push Bindings  
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "l:cmd" : S.op("push", { "direction" : "right", "style" : "bar-resize:screenSizeX/2" }), // 右边半屏
  "h:cmd" : S.op("push", { "direction" : "left", "style" : "bar-resize:screenSizeX/2" }), //左边半屏
  "k:cmd" : S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY/2" }), //上面半屏
  "j:cmd" : S.op("push", { "direction" : "down", "style" : "bar-resize:screenSizeY/2" }), //下面半屏
    
  "m:ctrl" : S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY" }), //下面半屏
  //"n:ctrl" : S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY" }), //下面半屏

  // Nudge Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "right:ctrl;alt" : S.op("nudge", { "x" : "+10%", "y" : "+0" }),  //窗口整理右移10%
  "left:ctrl;alt" : S.op("nudge", { "x" : "-10%", "y" : "+0" }),  //左移10%
  "up:ctrl;alt" : S.op("nudge", { "x" : "+0", "y" : "-10%" }),  //上移10%
  "down:ctrl;alt" : S.op("nudge", { "x" : "+0", "y" : "+10%" }),  //下移10%

  // Throw Bindings  全屏拖放到显示器0.1.2上面
    // ,如果只有一个屏幕的话，那么都是全屏的操作了
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "1:ctrl;alt" : S.op("throw", { "screen" : "2", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "2:ctrl;alt" : S.op("throw", { "screen" : "1", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "3:ctrl;alt" : S.op("throw", { "screen" : "0", "width" : "screenSizeX", "height" : "screenSizeY" }),
    //往右仍全屏
  "right:ctrl;alt;cmd" : S.op("throw", { "screen" : "right", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "left:ctrl;alt;cmd" : S.op("throw", { "screen" : "left", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "up:ctrl;alt;cmd" : S.op("throw", { "screen" : "up", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "down:ctrl;alt;cmd" : S.op("throw", { "screen" : "down", "width" : "screenSizeX", "height" : "screenSizeY" }),

  // Focus Bindings  这个可以在3屏铺满屏幕时候，实现快速切换----重要
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  //"l:cmd" : S.op("focus", { "direction" : "right" }),   
  //"h:cmd" : S.op("focus", { "direction" : "left" }), // focus direction left 即将左边最近的窗口放到最前面来
  //"k:cmd" : S.op("focus", { "direction" : "up" }),   //将上面最近的窗口放到最前面来
  //"j:cmd" : S.op("focus", { "direction" : "down" }),
  //"i:cmd" : S.op("focus", { "direction" : "behind" }), //同时按住cmd和alt的同时，再按住k
    



  //"j:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  //"right:cmd" : S.op("focus", { "direction" : "right" }),
  //"left:cmd" : S.op("focus", { "direction" : "left" }),
  //"up:cmd" : S.op("focus", { "direction" : "up" }),
  //"down:cmd" : S.op("focus", { "direction" : "down" }),
  //"up:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  //"down:cmd;alt" : S.op("focus", { "direction" : "behind" }),

  // Window Hints
  "esc:cmd" : S.op("hint"),

  // Switch currently doesn't work well so I'm commenting it out until I fix it.
  //"tab:cmd" : S.op("switch"),

  // Grid
  "esc:ctrl" : S.op("grid")
});

// Test Cases
S.src(".slate.test", true);
S.src(".slate.test.js", true);

// Log that we're done configuring
S.log("[SLATE] -------------- Finished Loading Config --------------");
