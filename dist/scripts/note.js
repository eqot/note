(function(){"use strict";var a;a=function(){function a(a){this.note=a,this.dom=this.note.getDom(),this.listeners=[]}return a.prototype.SCALE=64,a.prototype.state=null,a.prototype.note=null,a.prototype.dom=null,a.prototype.listeners=null,a.prototype.activate=function(){var a,b,c,d,e,f;return this.addListener(this.dom,"mousedown",null!=(a=this.onDown)?a.bind(this):void 0),this.addListener(this.dom,"mousemove",null!=(b=this.onMove)?b.bind(this):void 0),this.addListener(this.dom,"mouseup",null!=(c=this.onUp)?c.bind(this):void 0),this.addListener(this.dom,"touchstart",null!=(d=this.onDown)?d.bind(this):void 0),this.addListener(this.dom,"touchmove",null!=(e=this.onMove)?e.bind(this):void 0),this.addListener(this.dom,"touchend",null!=(f=this.onUp)?f.bind(this):void 0)},a.prototype.deactivate=function(){return this.removeAllListeners()},a.prototype.addListener=function(a,b,c){return a.addEventListener(b,c,!0),this.listeners.push([a,b,c])},a.prototype.removeAllListeners=function(){var a,b,c,d,e,f,g,h;for(f=this.listeners,h=[],d=0,e=f.length;e>d;d++)g=f[d],c=g[0],a=g[1],b=g[2],h.push(c.removeEventListener(a,b,!0));return h},a.prototype.getPoint=function(a){return null!=a.touches?[a.touches[0].clientX,a.touches[0].clientY]:[a.x,a.y]},a.prototype.onNativeDown=function(a,b){return"function"==typeof this.onDown?this.onDown({x:a/this.SCALE,y:b/this.SCALE}):void 0},a.prototype.onNativeMove=function(a,b){return"function"==typeof this.onMove?this.onMove({x:a/this.SCALE,y:b/this.SCALE}):void 0},a.prototype.onNativeUp=function(){return"function"==typeof this.onUp?this.onUp():void 0},a}(),window.HandlerBase=a}).call(this),function(){"use strict";var a,b={}.hasOwnProperty,c=function(a,c){function d(){this.constructor=a}for(var e in c)b.call(c,e)&&(a[e]=c[e]);return d.prototype=c.prototype,a.prototype=new d,a.__super__=c.prototype,a};a=function(a){function b(a){b.__super__.constructor.call(this,a),this.focus=new Focus(this.note),this.focusedElements=[],this.state=this.State.RELEASE}return c(b,a),b.prototype.State={RELEASE:0,PRESS:1},b.prototype.focus=null,b.prototype.focusedElements=null,b.prototype.focusPosition=null,b.prototype.deactivate=function(){return b.__super__.deactivate.call(this),this.removeFocusAll()},b.prototype.onDown=function(a){var b,c,d,e;return"function"==typeof a.preventDefault&&a.preventDefault(),e=this.getPoint(a),c=e[0],d=e[1],b=this.note.pick(c,d),this.removeFocusAll(),"canvas"!==b.node.id?this.setFocus(b):void 0},b.prototype.onMove=function(a){return"function"==typeof a.preventDefault?a.preventDefault():void 0},b.prototype.onUp=function(a){return"function"==typeof a.preventDefault?a.preventDefault():void 0},b.prototype.setFocus=function(a){return this.focus.set(a),this.focusedElements.push(a),this.focus.setVisibility(!0),a.drag(),a.drag(this.moveFocus.bind(this),this.moveFocusStart.bind(this),this.moveFocusEnd.bind(this))},b.prototype.moveFocusStart=function(){return this.focusPosition=this.focus.getPosition()},b.prototype.moveFocus=function(a,b){var c,d,e;return e=this.focusPosition,c=e[0],d=e[1],this.focus.setPosition(c+a,d+b)},b.prototype.moveFocusEnd=function(){return this.focusPosition=null},b.prototype.removeFocusAll=function(){var a,b,c,d;for(d=this.focusedElements,b=0,c=d.length;c>b;b++)a=d[b],a.undrag();return this.focusedElements=[],this.focus.setVisibility(!1)},b}(HandlerBase),window.Pick=a}.call(this),function(){"use strict";var a,b={}.hasOwnProperty,c=function(a,c){function d(){this.constructor=a}for(var e in c)b.call(c,e)&&(a[e]=c[e]);return d.prototype=c.prototype,a.prototype=new d,a.__super__=c.prototype,a};a=function(a){function b(a){b.__super__.constructor.call(this,a),this.state=this.State.RELEASE}return c(b,a),b.prototype.State={RELEASE:0,PRESS:1},b.prototype.pathNode=null,b.prototype.prevX=null,b.prototype.prevY=null,b.prototype.onDown=function(a){var b,c;return"function"==typeof a.preventDefault&&a.preventDefault(),c=this.getPoint(a),this.prevX=c[0],this.prevY=c[1],b=this.note.drawPath("M"+this.prevX+","+this.prevY),this.pathNode=b.node,this.state=this.State.PRESS},b.prototype.onMove=function(a){var b,c,d;return"function"==typeof a.preventDefault&&a.preventDefault(),this.state===this.State.PRESS?(d=this.getPoint(a),b=d[0],c=d[1],this.pathNode.pathSegList.appendItem(this.pathNode.createSVGPathSegCurvetoQuadraticAbs((b+this.prevX)/2,(c+this.prevY)/2,this.prevX,this.prevY)),this.prevX=b,this.prevY=c):void 0},b.prototype.onUp=function(){return this.state=this.State.RELEASE},b}(HandlerBase),window.Freehand=a}.call(this),function(){"use strict";var a,b={}.hasOwnProperty,c=function(a,c){function d(){this.constructor=a}for(var e in c)b.call(c,e)&&(a[e]=c[e]);return d.prototype=c.prototype,a.prototype=new d,a.__super__=c.prototype,a};a=function(a){function b(a){b.__super__.constructor.call(this,a),this.state=this.State.RELEASE}return c(b,a),b.prototype.State={RELEASE:0,PRESS:1},b.prototype.startX=null,b.prototype.startY=null,b.prototype.rectangle=null,b.prototype.onDown=function(a){var b;return"function"==typeof a.preventDefault&&a.preventDefault(),b=this.getPoint(a),this.startX=b[0],this.startY=b[1],this.state=this.State.PRESS},b.prototype.onMove=function(a){var b,c,d,e;return"function"==typeof a.preventDefault&&a.preventDefault(),null!=(d=this.rectangle)&&d.remove(),this.state===this.State.PRESS?(e=this.getPoint(a),b=e[0],c=e[1],this.rectangle=this.note.drawRectangle(this.startX,this.startY,b,c)):void 0},b.prototype.onUp=function(a){return"function"==typeof a.preventDefault&&a.preventDefault(),this.rectangle=null,this.startX=this.startY=null,this.state=this.State.RELEASE},b}(HandlerBase),window.Rectangle=a}.call(this),function(){"use strict";var a;a=function(){function a(a){this.s=Snap(a),this.layer=this.getNewLayer()}return a.prototype.s=null,a.prototype.layer=null,a.prototype.strokeColor="#000000",a.prototype.strokeWidth=2,a.prototype.fillColor="#ffffff",a.prototype.group=null,a.prototype.getDom=function(){return this.s.node},a.prototype.getNewLayer=function(){return this.s.g()},a.prototype.drawLine=function(a,b,c,d){var e;return e=this.s.line(a,b,c,d),e.attr({stroke:this.strokeColor,strokeWidth:this.strokeWidth})},a.prototype.drawPolyline=function(a){var b;return b=this.s.polyline(a),b.attr({stroke:this.strokeColor,strokeWidth:this.strokeWidth,strokeLinecap:"round",strokeLinejoin:"round",fill:"none"}),this.layer.append(b)},a.prototype.drawPath=function(a){return a=this.s.path(a),a.attr({stroke:this.strokeColor,strokeWidth:this.strokeWidth,strokeLinecap:"round",strokeLinejoin:"round",fill:"none"})},a.prototype.drawRectangle=function(a,b,c,d){var e,f,g,h,i,j,k;return j=c>a?[a,c-a]:[c,a-c],h=j[0],g=j[1],k=d>b?[b,d-b]:[d,b-d],i=k[0],e=k[1],f=this.s.rect(h,i,g,e),f.attr({stroke:this.strokeColor,strokeWidth:this.strokeWidth,fill:this.fillColor}),this.layer.append(f),f},a.prototype.marker=function(a,b,c,d,e,f){return this.s.marker(a,b,c,d,e,f)},a.prototype.pick=function(a,b){return Snap.getElementByPoint(a,b)},a}(),window.Note=a}.call(this),function(){"use strict";var a;a=function(){function a(a){var b,c,d,e,f,g,h;for(this.note=a,d=this.note.drawRectangle(0,0,10,10),c=d.marker(0,0,10,10,5,5),c.attr({id:"rect",overflow:"visible",markerUnits:"userSpaceOnUse",orient:"0"}),c.toDefs(),this.layer=this.note.getNewLayer(),this.layer.addClass("focus"),h=this.FOCUS_STROKES,f=0,g=h.length;g>f;f++)e=h[f],b=this.note.drawPolyline(e),b.attr({fill:"none"}),b.node.setAttribute("marker-start",'url("#rect")'),b.node.setAttribute("marker-mid",'url("#rect")'),this.layer.append(b);this.setVisibility(!0)}return a.prototype.FOCUS_STROKES=[[0,0,50,0,100,0],[100,0,100,50,100,100],[100,100,50,100,0,100],[0,100,0,50,0,0]],a.prototype.note=null,a.prototype.layer=null,a.prototype.position=null,a.prototype.set=function(a){var b,c,d,e,f;return f=a.getBBox(),d=f.x,e=f.y,c=f.w,b=f.h,this.element.attr({x:d,y:e,width:c,height:b}),this.position=[d,e]},a.prototype.setPosition=function(a,b){return this.element.attr({x:a,y:b}),this.position=[a,b]},a.prototype.getPosition=function(){return this.position},a.prototype.setVisibility=function(a){return a?this.layer.removeClass("hide"):this.layer.addClass("hide")},a}(),window.Focus=a}.call(this);