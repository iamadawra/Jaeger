/*!
 * jQuery UI Widget @VERSION
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */
!function(e){"function"==typeof define&&define.amd?define(["jquery","./version"],e):e(jQuery)}(function(e){var t=0,i=Array.prototype.slice;return e.cleanData=function(t){return function(i){var n,r,s;for(s=0;null!=(r=i[s]);s++)try{n=e._data(r,"events"),n&&n.remove&&e(r).triggerHandler("remove")}catch(o){}t(i)}}(e.cleanData),e.widget=function(t,i,n){var r,s,o,a={},l=t.split(".")[0];t=t.split(".")[1];var p=l+"-"+t;return n||(n=i,i=e.Widget),e.isArray(n)&&(n=e.extend.apply(null,[{}].concat(n))),e.expr[":"][p.toLowerCase()]=function(t){return!!e.data(t,p)},e[l]=e[l]||{},r=e[l][t],s=e[l][t]=function(e,t){return this._createWidget?void(arguments.length&&this._createWidget(e,t)):new s(e,t)},e.extend(s,r,{version:n.version,_proto:e.extend({},n),_childConstructors:[]}),o=new i,o.options=e.widget.extend({},o.options),e.each(n,function(t,n){return e.isFunction(n)?void(a[t]=function(){function e(){return i.prototype[t].apply(this,arguments)}function r(e){return i.prototype[t].apply(this,e)}return function(){var t,i=this._super,s=this._superApply;return this._super=e,this._superApply=r,t=n.apply(this,arguments),this._super=i,this._superApply=s,t}}()):void(a[t]=n)}),s.prototype=e.widget.extend(o,{widgetEventPrefix:r?o.widgetEventPrefix||t:t},a,{constructor:s,namespace:l,widgetName:t,widgetFullName:p}),r?(e.each(r._childConstructors,function(t,i){var n=i.prototype;e.widget(n.namespace+"."+n.widgetName,s,i._proto)}),delete r._childConstructors):i._childConstructors.push(s),e.widget.bridge(t,s),s},e.widget.extend=function(t){for(var n,r,s=i.call(arguments,1),o=0,a=s.length;a>o;o++)for(n in s[o])r=s[o][n],s[o].hasOwnProperty(n)&&void 0!==r&&(e.isPlainObject(r)?t[n]=e.isPlainObject(t[n])?e.widget.extend({},t[n],r):e.widget.extend({},r):t[n]=r);return t},e.widget.bridge=function(t,n){var r=n.prototype.widgetFullName||t;e.fn[t]=function(s){var o="string"==typeof s,a=i.call(arguments,1),l=this;return o?this.each(function(){var i,n=e.data(this,r);return"instance"===s?(l=n,!1):n?e.isFunction(n[s])&&"_"!==s.charAt(0)?(i=n[s].apply(n,a),i!==n&&void 0!==i?(l=i&&i.jquery?l.pushStack(i.get()):i,!1):void 0):e.error("no such method '"+s+"' for "+t+" widget instance"):e.error("cannot call methods on "+t+" prior to initialization; attempted to call method '"+s+"'")}):(a.length&&(s=e.widget.extend.apply(null,[s].concat(a))),this.each(function(){var t=e.data(this,r);t?(t.option(s||{}),t._init&&t._init()):e.data(this,r,new n(s,this))})),l}},e.Widget=function(){},e.Widget._childConstructors=[],e.Widget.prototype={widgetName:"widget",widgetEventPrefix:"",defaultElement:"<div>",options:{classes:{},disabled:!1,create:null},_createWidget:function(i,n){n=e(n||this.defaultElement||this)[0],this.element=e(n),this.uuid=t++,this.eventNamespace="."+this.widgetName+this.uuid,this.bindings=e(),this.hoverable=e(),this.focusable=e(),this.classesElementLookup={},n!==this&&(e.data(n,this.widgetFullName,this),this._on(!0,this.element,{remove:function(e){e.target===n&&this.destroy()}}),this.document=e(n.style?n.ownerDocument:n.document||n),this.window=e(this.document[0].defaultView||this.document[0].parentWindow)),this.options=e.widget.extend({},this.options,this._getCreateOptions(),i),this._create(),this.options.disabled&&this._setOptionDisabled(this.options.disabled),this._trigger("create",null,this._getCreateEventData()),this._init()},_getCreateOptions:function(){return{}},_getCreateEventData:e.noop,_create:e.noop,_init:e.noop,destroy:function(){var t=this;this._destroy(),e.each(this.classesElementLookup,function(e,i){t._removeClass(i,e)}),this.element.off(this.eventNamespace).removeData(this.widgetFullName),this.widget().off(this.eventNamespace).removeAttr("aria-disabled"),this.bindings.off(this.eventNamespace)},_destroy:e.noop,widget:function(){return this.element},option:function(t,i){var n,r,s,o=t;if(0===arguments.length)return e.widget.extend({},this.options);if("string"==typeof t)if(o={},n=t.split("."),t=n.shift(),n.length){for(r=o[t]=e.widget.extend({},this.options[t]),s=0;s<n.length-1;s++)r[n[s]]=r[n[s]]||{},r=r[n[s]];if(t=n.pop(),1===arguments.length)return void 0===r[t]?null:r[t];r[t]=i}else{if(1===arguments.length)return void 0===this.options[t]?null:this.options[t];o[t]=i}return this._setOptions(o),this},_setOptions:function(e){var t;for(t in e)this._setOption(t,e[t]);return this},_setOption:function(e,t){return"classes"===e&&this._setOptionClasses(t),this.options[e]=t,"disabled"===e&&this._setOptionDisabled(t),this},_setOptionClasses:function(t){var i,n,r;for(i in t)r=this.classesElementLookup[i],t[i]!==this.options.classes[i]&&r&&r.length&&(n=e(r.get()),this._removeClass(r,i),n.addClass(this._classes({element:n,keys:i,classes:t,add:!0})))},_setOptionDisabled:function(e){this._toggleClass(this.widget(),this.widgetFullName+"-disabled",null,!!e),e&&(this._removeClass(this.hoverable,null,"ui-state-hover"),this._removeClass(this.focusable,null,"ui-state-focus"))},enable:function(){return this._setOptions({disabled:!1})},disable:function(){return this._setOptions({disabled:!0})},_classes:function(t){function i(i,s){var o,a;for(a=0;a<i.length;a++)o=r.classesElementLookup[i[a]]||e(),o=e(t.add?e.unique(o.get().concat(t.element.get())):o.not(t.element).get()),r.classesElementLookup[i[a]]=o,n.push(i[a]),s&&t.classes[i[a]]&&n.push(t.classes[i[a]])}var n=[],r=this;return t=e.extend({element:this.element,classes:this.options.classes||{}},t),t.keys&&i(t.keys.match(/\S+/g)||[],!0),t.extra&&i(t.extra.match(/\S+/g)||[]),n.join(" ")},_removeClass:function(e,t,i){return this._toggleClass(e,t,i,!1)},_addClass:function(e,t,i){return this._toggleClass(e,t,i,!0)},_toggleClass:function(e,t,i,n){n="boolean"==typeof n?n:i;var r="string"==typeof e||null===e,s={extra:r?t:i,keys:r?e:t,element:r?this.element:e,add:n};return s.element.toggleClass(this._classes(s),n),this},_on:function(t,i,n){var r,s=this;"boolean"!=typeof t&&(n=i,i=t,t=!1),n?(i=r=e(i),this.bindings=this.bindings.add(i)):(n=i,i=this.element,r=this.widget()),e.each(n,function(n,o){function a(){return t||s.options.disabled!==!0&&!e(this).hasClass("ui-state-disabled")?("string"==typeof o?s[o]:o).apply(s,arguments):void 0}"string"!=typeof o&&(a.guid=o.guid=o.guid||a.guid||e.guid++);var l=n.match(/^([\w:-]*)\s*(.*)$/),p=l[1]+s.eventNamespace,u=l[2];u?r.on(p,u,a):i.on(p,a)})},_off:function(t,i){i=(i||"").split(" ").join(this.eventNamespace+" ")+this.eventNamespace,t.off(i).off(i),this.bindings=e(this.bindings.not(t).get()),this.focusable=e(this.focusable.not(t).get()),this.hoverable=e(this.hoverable.not(t).get())},_delay:function(e,t){function i(){return("string"==typeof e?n[e]:e).apply(n,arguments)}var n=this;return setTimeout(i,t||0)},_hoverable:function(t){this.hoverable=this.hoverable.add(t),this._on(t,{mouseenter:function(t){this._addClass(e(t.currentTarget),null,"ui-state-hover")},mouseleave:function(t){this._removeClass(e(t.currentTarget),null,"ui-state-hover")}})},_focusable:function(t){this.focusable=this.focusable.add(t),this._on(t,{focusin:function(t){this._addClass(e(t.currentTarget),null,"ui-state-focus")},focusout:function(t){this._removeClass(e(t.currentTarget),null,"ui-state-focus")}})},_trigger:function(t,i,n){var r,s,o=this.options[t];if(n=n||{},i=e.Event(i),i.type=(t===this.widgetEventPrefix?t:this.widgetEventPrefix+t).toLowerCase(),i.target=this.element[0],s=i.originalEvent)for(r in s)r in i||(i[r]=s[r]);return this.element.trigger(i,n),!(e.isFunction(o)&&o.apply(this.element[0],[i].concat(n))===!1||i.isDefaultPrevented())}},e.each({show:"fadeIn",hide:"fadeOut"},function(t,i){e.Widget.prototype["_"+t]=function(n,r,s){"string"==typeof r&&(r={effect:r});var o,a=r?r===!0||"number"==typeof r?i:r.effect||i:t;r=r||{},"number"==typeof r&&(r={duration:r}),o=!e.isEmptyObject(r),r.complete=s,r.delay&&n.delay(r.delay),o&&e.effects&&e.effects.effect[a]?n[t](r):a!==t&&n[a]?n[a](r.duration,r.easing,s):n.queue(function(i){e(this)[t](),s&&s.call(n[0]),i()})}}),e.widget}),function(e){"use strict";"function"==typeof define&&define.amd?define(["jquery","jquery.ui.widget"],e):"object"==typeof exports?e(require("jquery"),require("./vendor/jquery.ui.widget")):e(window.jQuery)}(function(e){"use strict";function t(t){var i="dragover"===t;return function(n){n.dataTransfer=n.originalEvent&&n.originalEvent.dataTransfer;var r=n.dataTransfer;r&&-1!==e.inArray("Files",r.types)&&this._trigger(t,e.Event(t,{delegatedEvent:n}))!==!1&&(n.preventDefault(),i&&(r.dropEffect="copy"))}}e.support.fileInput=!(new RegExp("(Android (1\\.[0156]|2\\.[01]))|(Windows Phone (OS 7|8\\.0))|(XBLWP)|(ZuneWP)|(WPDesktop)|(w(eb)?OSBrowser)|(webOS)|(Kindle/(1\\.0|2\\.[05]|3\\.0))").test(window.navigator.userAgent)||e('<input type="file">').prop("disabled")),e.support.xhrFileUpload=!(!window.ProgressEvent||!window.FileReader),e.support.xhrFormDataFileUpload=!!window.FormData,e.support.blobSlice=window.Blob&&(Blob.prototype.slice||Blob.prototype.webkitSlice||Blob.prototype.mozSlice),e.widget("blueimp.fileupload",{options:{dropZone:e(document),pasteZone:void 0,fileInput:void 0,replaceFileInput:!0,paramName:void 0,singleFileUploads:!0,limitMultiFileUploads:void 0,limitMultiFileUploadSize:void 0,limitMultiFileUploadSizeOverhead:512,sequentialUploads:!1,limitConcurrentUploads:void 0,forceIframeTransport:!1,redirect:void 0,redirectParamName:void 0,postMessage:void 0,multipart:!0,maxChunkSize:void 0,uploadedBytes:void 0,recalculateProgress:!0,progressInterval:100,bitrateInterval:500,autoUpload:!0,messages:{uploadedBytes:"Uploaded bytes exceed file size"},i18n:function(t,i){return t=this.messages[t]||t.toString(),i&&e.each(i,function(e,i){t=t.replace("{"+e+"}",i)}),t},formData:function(e){return e.serializeArray()},add:function(t,i){return t.isDefaultPrevented()?!1:void((i.autoUpload||i.autoUpload!==!1&&e(this).fileupload("option","autoUpload"))&&i.process().done(function(){i.submit()}))},processData:!1,contentType:!1,cache:!1,timeout:0},_specialOptions:["fileInput","dropZone","pasteZone","multipart","forceIframeTransport"],_blobSlice:e.support.blobSlice&&function(){var e=this.slice||this.webkitSlice||this.mozSlice;return e.apply(this,arguments)},_BitrateTimer:function(){this.timestamp=Date.now?Date.now():(new Date).getTime(),this.loaded=0,this.bitrate=0,this.getBitrate=function(e,t,i){var n=e-this.timestamp;return(!this.bitrate||!i||n>i)&&(this.bitrate=(t-this.loaded)*(1e3/n)*8,this.loaded=t,this.timestamp=e),this.bitrate}},_isXHRUpload:function(t){return!t.forceIframeTransport&&(!t.multipart&&e.support.xhrFileUpload||e.support.xhrFormDataFileUpload)},_getFormData:function(t){var i;return"function"===e.type(t.formData)?t.formData(t.form):e.isArray(t.formData)?t.formData:"object"===e.type(t.formData)?(i=[],e.each(t.formData,function(e,t){i.push({name:e,value:t})}),i):[]},_getTotal:function(t){var i=0;return e.each(t,function(e,t){i+=t.size||1}),i},_initProgressObject:function(t){var i={loaded:0,total:0,bitrate:0};t._progress?e.extend(t._progress,i):t._progress=i},_initResponseObject:function(e){var t;if(e._response)for(t in e._response)e._response.hasOwnProperty(t)&&delete e._response[t];else e._response={}},_onProgress:function(t,i){if(t.lengthComputable){var n,r=Date.now?Date.now():(new Date).getTime();if(i._time&&i.progressInterval&&r-i._time<i.progressInterval&&t.loaded!==t.total)return;i._time=r,n=Math.floor(t.loaded/t.total*(i.chunkSize||i._progress.total))+(i.uploadedBytes||0),this._progress.loaded+=n-i._progress.loaded,this._progress.bitrate=this._bitrateTimer.getBitrate(r,this._progress.loaded,i.bitrateInterval),i._progress.loaded=i.loaded=n,i._progress.bitrate=i.bitrate=i._bitrateTimer.getBitrate(r,n,i.bitrateInterval),this._trigger("progress",e.Event("progress",{delegatedEvent:t}),i),this._trigger("progressall",e.Event("progressall",{delegatedEvent:t}),this._progress)}},_initProgressListener:function(t){var i=this,n=t.xhr?t.xhr():e.ajaxSettings.xhr();n.upload&&(e(n.upload).bind("progress",function(e){var n=e.originalEvent;e.lengthComputable=n.lengthComputable,e.loaded=n.loaded,e.total=n.total,i._onProgress(e,t)}),t.xhr=function(){return n})},_isInstanceOf:function(e,t){return Object.prototype.toString.call(t)==="[object "+e+"]"},_initXHRData:function(t){var i,n=this,r=t.files[0],s=t.multipart||!e.support.xhrFileUpload,o="array"===e.type(t.paramName)?t.paramName[0]:t.paramName;t.headers=e.extend({},t.headers),t.contentRange&&(t.headers["Content-Range"]=t.contentRange),s&&!t.blob&&this._isInstanceOf("File",r)||(t.headers["Content-Disposition"]='attachment; filename="'+encodeURI(r.name)+'"'),s?e.support.xhrFormDataFileUpload&&(t.postMessage?(i=this._getFormData(t),t.blob?i.push({name:o,value:t.blob}):e.each(t.files,function(n,r){i.push({name:"array"===e.type(t.paramName)&&t.paramName[n]||o,value:r})})):(n._isInstanceOf("FormData",t.formData)?i=t.formData:(i=new FormData,e.each(this._getFormData(t),function(e,t){i.append(t.name,t.value)})),t.blob?i.append(o,t.blob,r.name):e.each(t.files,function(r,s){(n._isInstanceOf("File",s)||n._isInstanceOf("Blob",s))&&i.append("array"===e.type(t.paramName)&&t.paramName[r]||o,s,s.uploadName||s.name)})),t.data=i):(t.contentType=r.type||"application/octet-stream",t.data=t.blob||r),t.blob=null},_initIframeSettings:function(t){var i=e("<a></a>").prop("href",t.url).prop("host");t.dataType="iframe "+(t.dataType||""),t.formData=this._getFormData(t),t.redirect&&i&&i!==location.host&&t.formData.push({name:t.redirectParamName||"redirect",value:t.redirect})},_initDataSettings:function(e){this._isXHRUpload(e)?(this._chunkedUpload(e,!0)||(e.data||this._initXHRData(e),this._initProgressListener(e)),e.postMessage&&(e.dataType="postmessage "+(e.dataType||""))):this._initIframeSettings(e)},_getParamName:function(t){var i=e(t.fileInput),n=t.paramName;return n?e.isArray(n)||(n=[n]):(n=[],i.each(function(){for(var t=e(this),i=t.prop("name")||"files[]",r=(t.prop("files")||[1]).length;r;)n.push(i),r-=1}),n.length||(n=[i.prop("name")||"files[]"])),n},_initFormSettings:function(t){t.form&&t.form.length||(t.form=e(t.fileInput.prop("form")),t.form.length||(t.form=e(this.options.fileInput.prop("form")))),t.paramName=this._getParamName(t),t.url||(t.url=t.form.prop("action")||location.href),t.type=(t.type||"string"===e.type(t.form.prop("method"))&&t.form.prop("method")||"").toUpperCase(),"POST"!==t.type&&"PUT"!==t.type&&"PATCH"!==t.type&&(t.type="POST"),t.formAcceptCharset||(t.formAcceptCharset=t.form.attr("accept-charset"))},_getAJAXSettings:function(t){var i=e.extend({},this.options,t);return this._initFormSettings(i),this._initDataSettings(i),i},_getDeferredState:function(e){return e.state?e.state():e.isResolved()?"resolved":e.isRejected()?"rejected":"pending"},_enhancePromise:function(e){return e.success=e.done,e.error=e.fail,e.complete=e.always,e},_getXHRPromise:function(t,i,n){var r=e.Deferred(),s=r.promise();return i=i||this.options.context||s,t===!0?r.resolveWith(i,n):t===!1&&r.rejectWith(i,n),s.abort=r.promise,this._enhancePromise(s)},_addConvenienceMethods:function(t,i){var n=this,r=function(t){return e.Deferred().resolveWith(n,t).promise()};i.process=function(t,s){return(t||s)&&(i._processQueue=this._processQueue=(this._processQueue||r([this])).then(function(){return i.errorThrown?e.Deferred().rejectWith(n,[i]).promise():r(arguments)}).then(t,s)),this._processQueue||r([this])},i.submit=function(){return"pending"!==this.state()&&(i.jqXHR=this.jqXHR=n._trigger("submit",e.Event("submit",{delegatedEvent:t}),this)!==!1&&n._onSend(t,this)),this.jqXHR||n._getXHRPromise()},i.abort=function(){return this.jqXHR?this.jqXHR.abort():(this.errorThrown="abort",n._trigger("fail",null,this),n._getXHRPromise(!1))},i.state=function(){return this.jqXHR?n._getDeferredState(this.jqXHR):this._processQueue?n._getDeferredState(this._processQueue):void 0},i.processing=function(){return!this.jqXHR&&this._processQueue&&"pending"===n._getDeferredState(this._processQueue)},i.progress=function(){return this._progress},i.response=function(){return this._response}},_getUploadedBytes:function(e){var t=e.getResponseHeader("Range"),i=t&&t.split("-"),n=i&&i.length>1&&parseInt(i[1],10);return n&&n+1},_chunkedUpload:function(t,i){t.uploadedBytes=t.uploadedBytes||0;var n,r,s=this,o=t.files[0],a=o.size,l=t.uploadedBytes,p=t.maxChunkSize||a,u=this._blobSlice,d=e.Deferred(),h=d.promise();return this._isXHRUpload(t)&&u&&(l||a>p)&&!t.data?i?!0:l>=a?(o.error=t.i18n("uploadedBytes"),this._getXHRPromise(!1,t.context,[null,"error",o.error])):(r=function(){var i=e.extend({},t),h=i._progress.loaded;i.blob=u.call(o,l,l+p,o.type),i.chunkSize=i.blob.size,i.contentRange="bytes "+l+"-"+(l+i.chunkSize-1)+"/"+a,s._initXHRData(i),s._initProgressListener(i),n=(s._trigger("chunksend",null,i)!==!1&&e.ajax(i)||s._getXHRPromise(!1,i.context)).done(function(n,o,p){l=s._getUploadedBytes(p)||l+i.chunkSize,h+i.chunkSize-i._progress.loaded&&s._onProgress(e.Event("progress",{lengthComputable:!0,loaded:l-i.uploadedBytes,total:l-i.uploadedBytes}),i),t.uploadedBytes=i.uploadedBytes=l,i.result=n,i.textStatus=o,i.jqXHR=p,s._trigger("chunkdone",null,i),s._trigger("chunkalways",null,i),a>l?r():d.resolveWith(i.context,[n,o,p])}).fail(function(e,t,n){i.jqXHR=e,i.textStatus=t,i.errorThrown=n,s._trigger("chunkfail",null,i),s._trigger("chunkalways",null,i),d.rejectWith(i.context,[e,t,n])})},this._enhancePromise(h),h.abort=function(){return n.abort()},r(),h):!1},_beforeSend:function(e,t){0===this._active&&(this._trigger("start"),this._bitrateTimer=new this._BitrateTimer,this._progress.loaded=this._progress.total=0,this._progress.bitrate=0),this._initResponseObject(t),this._initProgressObject(t),t._progress.loaded=t.loaded=t.uploadedBytes||0,t._progress.total=t.total=this._getTotal(t.files)||1,t._progress.bitrate=t.bitrate=0,this._active+=1,this._progress.loaded+=t.loaded,this._progress.total+=t.total},_onDone:function(t,i,n,r){var s=r._progress.total,o=r._response;r._progress.loaded<s&&this._onProgress(e.Event("progress",{lengthComputable:!0,loaded:s,total:s}),r),o.result=r.result=t,o.textStatus=r.textStatus=i,o.jqXHR=r.jqXHR=n,this._trigger("done",null,r)},_onFail:function(e,t,i,n){var r=n._response;n.recalculateProgress&&(this._progress.loaded-=n._progress.loaded,this._progress.total-=n._progress.total),r.jqXHR=n.jqXHR=e,r.textStatus=n.textStatus=t,r.errorThrown=n.errorThrown=i,this._trigger("fail",null,n)},_onAlways:function(e,t,i,n){this._trigger("always",null,n)},_onSend:function(t,i){i.submit||this._addConvenienceMethods(t,i);var n,r,s,o,a=this,l=a._getAJAXSettings(i),p=function(){return a._sending+=1,l._bitrateTimer=new a._BitrateTimer,n=n||((r||a._trigger("send",e.Event("send",{delegatedEvent:t}),l)===!1)&&a._getXHRPromise(!1,l.context,r)||a._chunkedUpload(l)||e.ajax(l)).done(function(e,t,i){a._onDone(e,t,i,l)}).fail(function(e,t,i){a._onFail(e,t,i,l)}).always(function(e,t,i){if(a._onAlways(e,t,i,l),a._sending-=1,a._active-=1,l.limitConcurrentUploads&&l.limitConcurrentUploads>a._sending)for(var n=a._slots.shift();n;){if("pending"===a._getDeferredState(n)){n.resolve();break}n=a._slots.shift()}0===a._active&&a._trigger("stop")})};return this._beforeSend(t,l),this.options.sequentialUploads||this.options.limitConcurrentUploads&&this.options.limitConcurrentUploads<=this._sending?(this.options.limitConcurrentUploads>1?(s=e.Deferred(),this._slots.push(s),o=s.then(p)):(this._sequence=this._sequence.then(p,p),o=this._sequence),o.abort=function(){return r=[void 0,"abort","abort"],n?n.abort():(s&&s.rejectWith(l.context,r),p())},this._enhancePromise(o)):p()},_onAdd:function(t,i){var n,r,s,o,a=this,l=!0,p=e.extend({},this.options,i),u=i.files,d=u.length,h=p.limitMultiFileUploads,c=p.limitMultiFileUploadSize,f=p.limitMultiFileUploadSizeOverhead,g=0,_=this._getParamName(p),m=0;if(!d)return!1;if(c&&void 0===u[0].size&&(c=void 0),(p.singleFileUploads||h||c)&&this._isXHRUpload(p))if(p.singleFileUploads||c||!h)if(!p.singleFileUploads&&c)for(s=[],n=[],o=0;d>o;o+=1)g+=u[o].size+f,(o+1===d||g+u[o+1].size+f>c||h&&o+1-m>=h)&&(s.push(u.slice(m,o+1)),r=_.slice(m,o+1),r.length||(r=_),n.push(r),m=o+1,g=0);else n=_;else for(s=[],n=[],o=0;d>o;o+=h)s.push(u.slice(o,o+h)),r=_.slice(o,o+h),r.length||(r=_),n.push(r);else s=[u],n=[_];return i.originalFiles=u,e.each(s||u,function(r,o){var p=e.extend({},i);return p.files=s?o:[o],p.paramName=n[r],a._initResponseObject(p),a._initProgressObject(p),a._addConvenienceMethods(t,p),l=a._trigger("add",e.Event("add",{delegatedEvent:t}),p)}),l},_replaceFileInput:function(t){var i=t.fileInput,n=i.clone(!0),r=i.is(document.activeElement);t.fileInputClone=n,e("<form></form>").append(n)[0].reset(),i.after(n).detach(),r&&n.focus(),e.cleanData(i.unbind("remove")),this.options.fileInput=this.options.fileInput.map(function(e,t){return t===i[0]?n[0]:t}),i[0]===this.element[0]&&(this.element=n)},_handleFileTreeEntry:function(t,i){var n,r=this,s=e.Deferred(),o=function(e){e&&!e.entry&&(e.entry=t),s.resolve([e])},a=function(e){r._handleFileTreeEntries(e,i+t.name+"/").done(function(e){s.resolve(e)}).fail(o)},l=function(){n.readEntries(function(e){e.length?(p=p.concat(e),l()):a(p)},o)},p=[];return i=i||"",t.isFile?t._file?(t._file.relativePath=i,s.resolve(t._file)):t.file(function(e){e.relativePath=i,s.resolve(e)},o):t.isDirectory?(n=t.createReader(),l()):s.resolve([]),s.promise()},_handleFileTreeEntries:function(t,i){var n=this;return e.when.apply(e,e.map(t,function(e){return n._handleFileTreeEntry(e,i)})).then(function(){return Array.prototype.concat.apply([],arguments)})},_getDroppedFiles:function(t){t=t||{};var i=t.items;return i&&i.length&&(i[0].webkitGetAsEntry||i[0].getAsEntry)?this._handleFileTreeEntries(e.map(i,function(e){var t;return e.webkitGetAsEntry?(t=e.webkitGetAsEntry(),t&&(t._file=e.getAsFile()),t):e.getAsEntry()})):e.Deferred().resolve(e.makeArray(t.files)).promise()},_getSingleFileInputFiles:function(t){t=e(t);var i,n,r=t.prop("webkitEntries")||t.prop("entries");if(r&&r.length)return this._handleFileTreeEntries(r);if(i=e.makeArray(t.prop("files")),i.length)void 0===i[0].name&&i[0].fileName&&e.each(i,function(e,t){t.name=t.fileName,t.size=t.fileSize});else{if(n=t.prop("value"),!n)return e.Deferred().resolve([]).promise();i=[{name:n.replace(/^.*\\/,"")}]}return e.Deferred().resolve(i).promise()},_getFileInputFiles:function(t){return t instanceof e&&1!==t.length?e.when.apply(e,e.map(t,this._getSingleFileInputFiles)).then(function(){return Array.prototype.concat.apply([],arguments)}):this._getSingleFileInputFiles(t)},_onChange:function(t){var i=this,n={fileInput:e(t.target),form:e(t.target.form)};this._getFileInputFiles(n.fileInput).always(function(r){n.files=r,i.options.replaceFileInput&&i._replaceFileInput(n),i._trigger("change",e.Event("change",{delegatedEvent:t}),n)!==!1&&i._onAdd(t,n)})},_onPaste:function(t){var i=t.originalEvent&&t.originalEvent.clipboardData&&t.originalEvent.clipboardData.items,n={files:[]};i&&i.length&&(e.each(i,function(e,t){var i=t.getAsFile&&t.getAsFile();i&&n.files.push(i)}),this._trigger("paste",e.Event("paste",{delegatedEvent:t}),n)!==!1&&this._onAdd(t,n))},_onDrop:function(t){t.dataTransfer=t.originalEvent&&t.originalEvent.dataTransfer;var i=this,n=t.dataTransfer,r={};n&&n.files&&n.files.length&&(t.preventDefault(),this._getDroppedFiles(n).always(function(n){r.files=n,i._trigger("drop",e.Event("drop",{delegatedEvent:t}),r)!==!1&&i._onAdd(t,r)}))},_onDragOver:t("dragover"),_onDragEnter:t("dragenter"),_onDragLeave:t("dragleave"),_initEventHandlers:function(){this._isXHRUpload(this.options)&&(this._on(this.options.dropZone,{dragover:this._onDragOver,drop:this._onDrop,dragenter:this._onDragEnter,dragleave:this._onDragLeave}),this._on(this.options.pasteZone,{paste:this._onPaste})),e.support.fileInput&&this._on(this.options.fileInput,{change:this._onChange})},_destroyEventHandlers:function(){this._off(this.options.dropZone,"dragenter dragleave dragover drop"),this._off(this.options.pasteZone,"paste"),this._off(this.options.fileInput,"change")},_setOption:function(t,i){var n=-1!==e.inArray(t,this._specialOptions);n&&this._destroyEventHandlers(),this._super(t,i),n&&(this._initSpecialOptions(),this._initEventHandlers())},_initSpecialOptions:function(){var t=this.options;void 0===t.fileInput?t.fileInput=this.element.is('input[type="file"]')?this.element:this.element.find('input[type="file"]'):t.fileInput instanceof e||(t.fileInput=e(t.fileInput)),t.dropZone instanceof e||(t.dropZone=e(t.dropZone)),t.pasteZone instanceof e||(t.pasteZone=e(t.pasteZone))},_getRegExp:function(e){var t=e.split("/"),i=t.pop();return t.shift(),new RegExp(t.join("/"),i)},_isRegExpOption:function(t,i){return"url"!==t&&"string"===e.type(i)&&/^\/.*\/[igm]{0,3}$/.test(i)},_initDataAttributes:function(){var t=this,i=this.options,n=this.element.data();e.each(this.element[0].attributes,function(e,r){var s,o=r.name.toLowerCase();/^data-/.test(o)&&(o=o.slice(5).replace(/-[a-z]/g,function(e){return e.charAt(1).toUpperCase()}),s=n[o],t._isRegExpOption(o,s)&&(s=t._getRegExp(s)),i[o]=s)})},_create:function(){this._initDataAttributes(),this._initSpecialOptions(),this._slots=[],this._sequence=this._getXHRPromise(!0),this._sending=this._active=0,this._initProgressObject(this),this._initEventHandlers()},active:function(){return this._active},progress:function(){return this._progress},add:function(t){var i=this;t&&!this.options.disabled&&(t.fileInput&&!t.files?this._getFileInputFiles(t.fileInput).always(function(e){t.files=e,i._onAdd(null,t)}):(t.files=e.makeArray(t.files),this._onAdd(null,t)))},send:function(t){if(t&&!this.options.disabled){if(t.fileInput&&!t.files){var i,n,r=this,s=e.Deferred(),o=s.promise();return o.abort=function(){return n=!0,i?i.abort():(s.reject(null,"abort","abort"),o)},this._getFileInputFiles(t.fileInput).always(function(e){if(!n){if(!e.length)return void s.reject();t.files=e,i=r._onSend(null,t),i.then(function(e,t,i){s.resolve(e,t,i)},function(e,t,i){s.reject(e,t,i)})}}),this._enhancePromise(o)}if(t.files=e.makeArray(t.files),t.files.length)return this._onSend(null,t)}return this._getXHRPromise(!1,t&&t.context)}})}),$(function(){function e(){var e=!0;return""==$("#video_title").val()?(0==$("#error_msg ul").has("#no_title").length&&$("#error_msg ul").append('<li id="no_title">Title can\'t be blank.</li>'),e=!1):(0!=$("#error_msg ul").has("#no_title").length&&$("#error_msg ul #no_title").remove(),$("#video_title").val().match(/^[0-9a-zA-Z\s\.\-\_]+$/)?0!=$("#error_msg ul").has("#invalid_title").length&&$("#error_msg ul #invalid_title").remove():(0==$("#error_msg ul").has("#invalid_title").length&&$("#error_msg ul").append("<li id=\"invalid_title\">Title is invalid. It should not contain special characters other than '.', '-', '_'</li>"),e=!1)),""==$("#video_video_url").val()?(0==$("#error_msg ul").has("#no_video").length&&$("#error_msg ul").append('<li id="no_video">You need to choose a video file to upload.</li>'),e=!1):0!=$("#error_msg ul").has("#no_video").length&&$("#error_msg ul #no_video").remove(),""==$("#video_poster_url").val()?(0==$("#error_msg ul").has("#no_poster").length&&$("#error_msg ul").append('<li id="no_poster">You need to choose a poster file to upload.</li>'),e=!1):0!=$("#error_msg ul").has("#no_poster").length&&$("#error_msg ul #no_poster").remove(),e}var t=0,i=0;$(".directUpload").find("input:file").each(function(n,r){var s,o=$(r),a=$(o.parents("form:first")),l=/(\.|\/)(mp4|jpe?g|png){1}$/i;"video_video_url"==$(this).attr("id")?(s=a.data("video-form-data"),l=/(\.|\/)(mp4){1}$/i):(s=a.data("poster-form-data"),l=/(\.|\/)(jpe?g|png){1}$/i);var p=a.find('input[type="submit"]'),u=$("#video_video_url"),d=$("#video_poster_url"),h=$("<div class='bar'></div>"),c=$("<div class='progress'></div>").append(h);o.after(c),o.fileupload({fileInput:o,url:a.data("url"),type:"POST",autoUpload:!1,formData:s,paramName:"file",dataType:"XML",replaceFileInput:!1,add:function(t,i){var n=!0;console.log(i.originalFiles[0].type),0!=i.originalFiles[0].type.length&&l.test(i.originalFiles[0].type)||(n=!1,alert("The file format is not acceptable."),$(this).val("")),p.click(function(){n&&e()&&(console.log(e()),i.submit())})},progressall:function(e,t){var i=parseInt(t.loaded/t.total*100,10);h.css("width",i+"%").text("Loading...("+i+"%)")},start:function(){p.prop("disabled",!0),u.prop("disabled",!0),d.prop("disabled",!0),h.css("background","green").css("display","block").css("width","0%").text("Loading...")},done:function(e,n){h.text("Uploading done"),"video_video_url"==$(this).attr("id")?t=1:i=1;var r=$(n.jqXHR.responseXML).find("Key").text(),s="//"+a.data("host")+"/"+r,l=$("<input />",{type:"hidden",name:o.attr("name"),value:s});a.append(l),1==t&&1==i&&a.submit()},fail:function(){p.prop("disabled",!1),u.prop("disabled",!1),d.prop("disabled",!1),h.css("background","red").text("Failed")}}).on("fileuploadadded",function(e,t){alert("ASDF"),console.log(t.files.valid)})}),$(".directUpload").find('input[type="submit"]').click(function(t){e(),t.preventDefault()})}),function(){}.call(this);