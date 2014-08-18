(function(){"use strict";var a,b;a=function(){function a(){var a,b,c,d;for(this.canvas=$("#canvas"),this.onResize(),$(window).resize(function(a){return function(){return a.onResize()}}(this)),this.note=new Note("#canvas"),this.handlers.pick=new Pick(this.note),this.handlers.freehand=new Freehand(this.note),this.handlers.rectangle=new Rectangle(this.note),this.states.penwidth=new PenWidth(this.note),this.states.pencolor=new PenColor(this.note),this.states.fillcolor=new FillColor(this.note),d=document.querySelectorAll("#buttons button"),b=0,c=d.length;c>b;b++)a=d[b],this.elements[a.id]=a,a.addEventListener("click",this.onClick.bind(this));this.setMode("freehand")}return a.prototype.canvas=null,a.prototype.note=null,a.prototype.elements={},a.prototype.handlers={},a.prototype.states={},a.prototype.mode=null,a.prototype.onResize=function(){var a,b;return a=$("body").height(),b=$("#tools").height(),this.canvas.attr("height",a-b-6)},a.prototype.onClick=function(a){var b;return b=a.target.id,null!=this.states[b]?this.setState(b):this.setMode(b)},a.prototype.setMode=function(a){var b;return null!=this.mode&&this.mode.length>0&&(this.elements[this.mode].classList.remove("active"),this.handlers[this.mode].deactivate()),this.mode=a,this.elements[this.mode].classList.add("active"),b=this.handlers[this.mode],null!=b?(b.activate(),window["native"]={mouseDown:b.onNativeDown.bind(b),mouseMove:b.onNativeMove.bind(b),mouseUp:b.onNativeUp.bind(b)}):void 0},a.prototype.setState=function(){},a}(),b=new a}).call(this);