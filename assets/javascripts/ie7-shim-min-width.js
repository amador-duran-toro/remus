/* https://stackoverflow.com/questions/7068967/css-how-to-make-ie7-respect-min-width */
/*
author: Rob Eberhardt
desc: fix MinWidth for IE6 & IE7
params: none
returns: nothing
notes: cannot yet fix childless elements like INPUT or SELECT
history:
   2006-11-20 revised for standards-mode compatibility
   2006-11-17 first version
*/
function fixMinWidthForIE(){
   try{
      if(!document.body.currentStyle){return} //IE only
   }catch(e){return}
   var elems=document.getElementsByTagName("*");
   for(e=0; e<elems.length; e++){
      var eCurStyle = elems[e].currentStyle;
      var l_minWidth = (eCurStyle.minWidth) ? eCurStyle.minWidth : eCurStyle.getAttribute("min-width"); //IE7 : IE6
      if(l_minWidth && l_minWidth != 'auto'){
         var shim = document.createElement("DIV");
         shim.style.cssText = 'margin:0 !important; padding:0 !important; border:0 !important; line-height:0 !important; height:0 !important; BACKGROUND:RED;';
         shim.style.width = l_minWidth;
         //shim.appendChild(document.createElement("&nbsp;"));
         shim.innerHTML = "&nbsp;"; //
         if(elems[e].canHaveChildren){
            elems[e].appendChild(shim);
         }else{
            //??
         }
      }
   }
}