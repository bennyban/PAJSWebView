
window.PAJS = {
	__callbacks: {},
	
//	invokeCallback: function (cbID, removeAfterExecute){
//		var args = Array.prototype.slice.call(arguments);
//		args.shift();
//		args.shift();
//		
//		for (var i = 0, l = args.length; i < l; i++){
//			args[i] = decodeURIComponent(args[i]);
//		}
//		
//		var cb = PAJS.__callbacks[cbID];
//		if (removeAfterExecute){
//			PAJS.__callbacks[cbID] = undefined;
//		}
//		return cb.apply(null, args);
//	},
    
	call: function (obj, functionName, args){
		var formattedArgs = [];
		for (var i = 0, l = args.length; i < l; i++){
			if (typeof args[i] == "function"){
				formattedArgs.push("f");
				var cbID = "__cb" + (+new Date);
				PAJS.__callbacks[cbID] = args[i];
				formattedArgs.push(cbID);
			}else{
				formattedArgs.push("s");
				formattedArgs.push(encodeURIComponent(args[i]));
			}
		}
		
		var argStr = (formattedArgs.length > 0 ? ":" + encodeURIComponent(formattedArgs.join(":")) : "");
		
		var iframe = document.createElement("IFRAME");
		iframe.setAttribute("src", "pa-js:" + obj + ":" + encodeURIComponent(functionName) + argStr);
		document.documentElement.appendChild(iframe);
		iframe.parentNode.removeChild(iframe);
		iframe = null;
		
		var ret = PAJS.retValue;
		PAJS.retValue = undefined;
		
		if (ret){
			return decodeURIComponent(ret);
		}
	},
	
	inject: function (obj, methods){
		window[obj] = {};
		var jsObj = window[obj];
		
		for (var i = 0, l = methods.length; i < l; i++){
			(function (){
				var method = methods[i];
				var jsMethod = method.replace(new RegExp(":", "g"), "");
				jsObj[jsMethod] = function (){
					return PAJS.call(obj, method, Array.prototype.slice.call(arguments));
				};
			})();
		}
	}
};