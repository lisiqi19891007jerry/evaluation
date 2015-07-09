/**
 * 实现Enter to Tab功能。
 * 对于要实现Enter to Tab功能的控件，需要设置其class=<e2tClzName>，其中e2tClzName可以修改
 * @author ShengYoufu
 * @since 2013-02-18
 */

/*
* 智能机浏览器版本信息:
*
* 用法：
document.writeln("语言版本: "+browser.language);
document.writeln(" 是否为移动终端: "+browser.versions.mobile);
document.writeln(" ios终端: "+browser.versions.ios);
document.writeln(" android终端: "+browser.versions.android);
document.writeln(" 是否为iPhone: "+browser.versions.iPhone);
document.writeln(" 是否iPad: "+browser.versions.iPad);
document.writeln(navigator.userAgent);
*/
var browser={
  versions:function(){
    var u = navigator.userAgent, app = navigator.appVersion;
    return {//移动终端浏览器版本信息
      trident: u.indexOf('Trident') > -1, //IE内核
      presto: u.indexOf('Presto') > -1, //opera内核
      webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
      gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
      mobile: !!u.match(/AppleWebKit.*Mobile.*/)||!!u.match(/AppleWebKit/), //是否为移动终端
      ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
      android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
      iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
      iPad: u.indexOf('iPad') > -1, //是否iPad
      webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
     };
  }(),
  language:(navigator.browserLanguage || navigator.language).toLowerCase()
}

var e2tClzName = "e2t";
$(document).ready(function () {
  $('input:text:first').focus();
  var $inp = $("."+e2tClzName); //$(".e2t");
  $inp.bind('keydown', function (e) {
    var key = e.which;
    if (key == 13) {
      e.preventDefault();
      var nxtIdx = $inp.index(this) + 1;
      $("."+e2tClzName+":eq(" + nxtIdx + ")").focus();
    }
  });
});

// Call onDeviceReady when PhoneGap is loaded.
//
// At this point, the document has loaded but phonegap.js has not.
// When PhoneGap is loaded and talking with the native device,
// it will call the event `deviceready`.
//
/*
document.addEventListener("deviceready", 
                      function(){ document.addEventListener("backbutton", onBackKeyDown, false); }, 
                      false);
*/
// Handle the back button
//
/*
function onBackKeyDown() {
  navigator.app.backHistory();
}
*/

jQuery.fn.center = function () {
   this.css("position", "absolute");
   this.css("top", ($(window).height() - this.height()) / 2 + $(window).scrollTop() + "px");
   this.css("left", ($(window).width() - this.width()) / 2 + $(window).scrollLeft() + "px");
   return this;
}

var file_path;
function detectAndroid(){
	var ua = navigator.userAgent.toLowerCase();
	var isAndroid = ua.indexOf("android") > -1; //&& ua.indexOf("mobile");
  return isAndroid;
}
function setFilePath() {
	if(detectAndroid()) {   
		file_path = "file:///sdcard/android_asset/www/res/db/";
		//4 Android
	} else {
		file_path = "res//db//";
		//4 apache//iOS/desktop
	}
}

/**
 * 浏览器直接下载
 * uri: 远程文件地址
 * name: 文件名
 */
function downloadFileDirect(uri, name){
  uri = encodeURIComponent(uri);
  var url = "download.html?sourceURI="+uri+"&fileName="+name;
  document.location.href = url;
}

/**
 * 浏览器直接下载
 * uri: 远程文件地址
 * name: 文件名
 */
function downloadToMobile(uri, name){
//  uri = uri+"&name="+name;
  //uri = encodeURI(uri);
  uri = encodeURIComponent(uri);
  name = encodeURIComponent(name);  
  var url = _basePath + "/download.html?sourceURI="+uri+"&fileName="+name;
  var filePath = "file:///sdcard/"+name;
  setFilePath();

  console.log("开始下载文件: " + name);
  var pan = new panmobi();
  pan.showProgressBar("", "正在下载，请稍候...", function(error){ console.log('正在下载，请稍候...');} );

  var fileTransfer = new FileTransfer();
  /*
  fileTransfer.onprogress = function(progressEvent) {
    if (progressEvent.lengthComputable) {
      var percentage = Math.floor(100 * parseInt(progressEvent.loaded) / parseInt(progressEvent.total));
      //$("#progressbar").progressBar(percentage);
    } else {
      //var percentage = $("#progressbar" ).progressbar( "option", "value" ) + 1;
      //$("#progressbar").progressBar(percentage);
    }
  };
  */
  fileTransfer.download(
    url,
    filePath,
    function(entry) {
      console.log("download complete: " + entry.fullPath);
      console.log("Begin to open file: " + entry.fullPath);
      var pan = new panmobi();
      //pan.openFile(filePath);
      //pan.openFile(entry.fullPath);
      //pan.openFile("oatemp.doc");
      console.log("File Opened: " + entry.fullPath);
      //var pan = new panmobi();
      pan.hideProgressBar(
        function(){console.log('hide');}
      );
    },
    function(error) {
      var pan = new panmobi();
      pan.hideProgressBar(
        function(){console.log('hide');}
      );
      console.log("download error source " + error.source);
      console.log("download error target " + error.target);
      console.log("upload error code" + error.code);
    }
  );

/*
  console.log("开始执行下载操作...");
  //fileUrl, jsonPar, isPost, isHttps, dirName, fileName, mimeType, overwrite, onSuccess, onFail
  pan.downAndOpen(url, {}, "false", "false", file_path, "", "", true,
    function(entry){
      //entry.result
      //entry.path
      //entry.fileName
      //entry.fullPath
      console.log("文件已处理完毕，保存的路径是："+entry.fullPath);
      pan.hideProgressBar(function(entry){ console.log('已经关闭进度条');} );
    },
    function(error){
      alert("下载并打开文件失败：" + error.message);
      pan.hideProgressBar(function(entry){ console.log('已经关闭进度条');} );
    }
  );
*/
}



function ftDownload(uri, name) {
  console.log("step 1");
  //var remoteFile = "http://i3.kym-cdn.com/entries/icons/original/000/000/080/doubt.jpg";
  //var localFileName = "pmp/"+remoteFile.substring(remoteFile.lastIndexOf('/')+1);
  if(typeof(name)=="undefined" || name=="") name = "mytemp.tmp";
  uri = encodeURIComponent(uri);
  name=name.replaceAll(" ", "%20");
  var url = _basePath + "/download.html?sourceURI="+uri+"&fileName="+name;
  var remoteFile = url;
  var localFileName = name;
//  var localFileName = "oatemp.doc";
  console.log("进入下载方法...");
  window.requestFileSystem(
    //LocalFileSystem.PERSISTENT,
    LocalFileSystem.TEMPORARY,
    0,
    function(fileSystem) {
      console.log("step 2");
      
      fileSystem.root.getFile(
        localFileName,
        {create: true, exclusive: false},
        function(fileEntry) {
          console.log("step 3");
         // alert("step 3");
          var localPath = fileEntry.fullPath;
          console.log(localPath);
          if (device.platform === "Android" && localPath.indexOf("file://") === 0) {
            localPath = localPath.substring(7);
          }
          localPath=localPath.replaceAll("%20", " ");
          //alert("localPath=="+localPath);
          var ft = new FileTransfer();
          console.log("开始下载文件...");
          //alert("开始下载文件...");
          showLoading(true);
		  //var pan = new panmobi();
		  //pan.showProgressBar("", "正在下载，请稍候...", function(error){ console.log('正在下载，请稍候...');} );
         
          ft.download(
            remoteFile,
            localPath,
            function(entry) {
               console.log("step 5");
               //注意：这里不能有滚动条插件，会导致app崩溃
               //var pan = new panmobi();
               //pan.hideProgressBar( function(){console.log('隐藏进度条.');} );
               showLoading(false);
               console.log("文件下载完毕，开始打开...");
               var pan = new panmobi();
               //entry.fullPath=entry.fullPath.replaceAll("%20"," ");
               pan.openFile("file://"+entry.fullPath);
            }, 
            downfail);
      }, 
      downfail);
  }, 
  downfail);
}
/**
 * 文件下载失败处理
 */
function downfail(error) {
	//alert("code=" + e.code+", source="+e.source+", target="+e.target+", http_status="+e.http_status+", body="+e.body);
  console.log(error.code);
  showLoading(false);
}

/**
 * 增加文件下载提示
 */
function showLoading(showFlag){
	//判断是否为iPhone
	var isIPhone=browser.versions.iPhone;
  if(showFlag){
    if($("#loading").length >0) $("#loading").show();
    else {
    	if(isIPhone){//iPhone客户端
    		//$("body").after('<div id=\"loading\" style=\"position: absolute; top: 100px; left:50px; font-size: 20px; padding: 30px; z-index: 999; border: 1px solid red; background-color: ButtonFace; \">正在下载，请稍候...</div>');
    	}else{
    		//$("body").after('<div id=\"loading\" style=\"position: absolute; top: 300px; left:100px; font-size: 50px; padding: 30px; z-index: 999; border: 1px solid red; background-color: ButtonFace; \">正在下载，请稍候...</div>');
    	}
    	$("body").append('<div id=\"loading\" class=\"loading\">正在下载，请稍候...</div>');
    	
    }
    
  }else{
    if($("#loading").length >0) $("#loading").hide();
  }
}

//var pan = new panmobi();
function downAttachment(uri, name){
  if(name.indexOf(".")<1) name += ".doc";

  //如果不是移动设备，则用浏览器直接下载的方式下载
  if(typeof(_isPanMobi)=="undefined" || !_isPanMobi) 
    return downloadFileDirect(uri, name);
	  
  //iosDownload(uri);
  //alert("function downAttachment...      uri=="+uri+",and name=="+name);
  ftDownload(uri, name);
}



var root = null;        // File System root variable
var currentDir = null;  // Current DirectoryEntry listed
var parentDir = null;   // Parent of the current directory

if(!Array.prototype.contains){
  Array.prototype.contains = function(item){
    return RegExp("\\b"+item+"\\b").test(this);
  };
}

var _delIncludeExts, _delExcludeExts; //要删除或不删除（排除）的文件扩展名数组
function clearChche(includeExts, excludeExts){
  _delIncludeExts = includeExts;
  _delExcludeExts = excludeExts;
  console.log("开始读取目录...");
  getFileSystem();
}

/**
 * 根据扩展名判断并删除文件
 */
function removeFile(fileEntry){
  var fName = fileEntry.name;
  var ext = fName.substring(fName.lastIndexOf('.')+1);
  console.log("判断文件["+fName+"]，"+"扩展名: " + ext);
  if(_delIncludeExts && _delIncludeExts.length>0){
    if(!_delIncludeExts.contains(ext)) return;
  }else if(_delExcludeExts && _delExcludeExts.length>0){
    if(_delExcludeExts.contains(ext)) return;
  }
  console.log("开始删除文件["+fName+"]...");
	fileEntry.remove(
	  function(entry) { console.log( entry.toURI + "删除成功."); },
	  function(error) { console.log( "文件删除失败."); }
	);
}

/* get the root file system */
function getFileSystem(){
	window.requestFileSystem(
    //LocalFileSystem.PERSISTENT,
    LocalFileSystem.TEMPORARY,  
    0,
		function(fileSystem){ // success get file system
			root = fileSystem.root;
			console.log("根目录：" + root.name);
			listDirAndDelFile(root);
		}, 
		function(evt){     // error get file system
		  console.log("File System Error: "+evt.target.error.code);
		}
	);
}

/* show the content of a directory */
function listDirAndDelFile(directoryEntry){
  if( !directoryEntry.isDirectory ) {
    console.log('listDir incorrect type');
    return;
  }
  console.log("搜索目录["+directoryEntry.name+"]...");
	var directoryReader = directoryEntry.createReader();
	directoryReader.readEntries(
		function(entries){
		  //var dirArr = new Array();
		  //var fileArr = new Array();
		  for(var i=0; i<entries.length; ++i){ // sort entries
		    var entry = entries[i];
		    if( entry.isDirectory && entry.name[0] != '.' ) {
		      //dirArr.push(entry);
		      listDirAndDelFile(entry);
		    }else if( entry.isFile && entry.name[0] != '.' ) {
					//fileArr.push(entry);
					removeFile(entry);
		    }
		  }
		}, 
		function(error){
		   console.log('listDir readEntries error: '+error.code);
		 }
	);
}