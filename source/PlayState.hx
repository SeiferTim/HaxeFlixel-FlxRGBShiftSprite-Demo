package;

import flixel.addons.display.FlxGridOverlay;
import flixel.addons.effects.FlxRGBShiftSprite;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxRandom;
import flixel.util.FlxTimer;
using flixel.util.FlxSpriteUtil;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var _rgbshift:FlxRGBShiftSprite;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		add(FlxGridOverlay.create(30, 30, -1, -1, false, true, 0xff111111, 0xff333333));
		
		var target:FlxSprite = new FlxSprite(0, 0, "assets/images/HaxeFlixel.png");
		target.screenCenter();
		
		_rgbshift = new FlxRGBShiftSprite(target);
		add(_rgbshift);
		
		FlxTween.num(0, 20, 5, { type:FlxTween.PINGPONG }, twnStrength);
		FlxTween.num(0, 359, 6, { type:FlxTween.LOOPING }, twnDirection);
		
		super.create();
		
	}
	
	private function twnStrength(Value:Float):Void
	{
		_rgbshift.strength = Std.int(Value);
	}
	
	private function twnDirection(Value:Float):Void
	{
		_rgbshift.direction = Value;
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		
		super.update();
	}	
}