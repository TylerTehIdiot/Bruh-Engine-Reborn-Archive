package modchart.modifiers;
import ui.*;
import modchart.*;
import flixel.math.FlxPoint;
import flixel.math.FlxMath;
import flixel.FlxG;
import math.*;

class DrunkModifier extends Modifier {

  override function getPath(visualDiff:Float, pos:Vector3, data:Int, player:Int, timeDiff:Float){
    var drunkPerc = getPercent(player);
    var tipsyPerc = getSubmodPercent("tipsy",player);
    var bumpyPerc = getSubmodPercent("bumpy",player);
    var tipsySpeed = CoolUtil.scale(getSubmodPercent("tipsySpeed",player),0,1,1,2);
    var drunkSpeed = CoolUtil.scale(getSubmodPercent("drunkSpeed",player),0,1,1,2);
    var bumpySpeed = CoolUtil.scale(getSubmodPercent("bumpySpeed",player),0,1,1,2);

    var time = Conductor.songPosition/1000;
    if(tipsyPerc!=0){
      pos.y += tipsyPerc * (FlxMath.fastCos((time*1.2 + data*1.8)*tipsySpeed) * Note.swagWidth*.4);
    }

    if(drunkPerc!=0){
      pos.x += drunkPerc * (FlxMath.fastCos((time + data*.2 + visualDiff*10/FlxG.height)*drunkSpeed) * Note.swagWidth*.5);
    }

    if(bumpyPerc!=0){
      pos.z += (bumpyPerc * (.3 * FlxMath.fastSin((visualDiff/24)*bumpySpeed)));
    }


    return pos;
  }

  /*override function getReceptorPos(receptor:Receptor, pos:Vector3, data:Int, player:Int){
    var tipsyPerc = getSubmodPercent("tipsy",player);
    var tipsySpeed = CoolUtil.scale(getSubmodPercent("tipsySpeed",player),0,1,1,2);
    var time = Conductor.songPosition/1000;
    if(tipsyPerc!=0){
      pos.y += tipsyPerc * (FlxMath.fastCos((time*1.2 + data*1.8)*tipsySpeed) * Note.swagWidth*.4);
    }

    return pos;
  }

  override function getPos(pos:Vector3, data:Int, player:Int, obj:FNFSprite){
    var drunkPerc = getPercent(player);
    var bumpyPerc = getSubmodPercent("bumpy",player);
    var drunkSpeed = CoolUtil.scale(getSubmodPercent("drunkSpeed",player),0,1,1,2);
    var bumpySpeed = CoolUtil.scale(getSubmodPercent("bumpySpeed",player),0,1,1,2);

    var time = Conductor.songPosition/1000;

    if(drunkPerc!=0){
      pos.x += drunkPerc * (FlxMath.fastCos((time + data*.2 + pos.y*10/FlxG.height)*drunkSpeed) * Note.swagWidth*.5);
    }

    if((obj is Note)){
      if(bumpyPerc!=0){
        obj.z += (bumpyPerc * (.3 * FlxMath.fastSin((pos.y/24)*bumpySpeed)));
      }
    }


    return pos;
  }*/

  override function getSubmods(){
    return ["tipsy", "bumpy", "drunkSpeed", "tipsySpeed", "bumpySpeed"];
  }

}
