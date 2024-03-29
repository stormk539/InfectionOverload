package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;
import com.stencyl.graphics.ScaleMode;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Config;
import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.motion.*;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class SceneEvents_21 extends SceneScript
{
	public var _Score:Float;
	public var _EneDeath:Float;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Score", "_Score");
		_Score = 0.0;
		nameMap.set("EneDeath", "_EneDeath");
		_EneDeath = 0.0;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		_EneDeath = 22;
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.setFont(getFont(38));
				g.drawString("" + "Score: ", 460, 440);
				g.drawString("" + (Engine.engine.getGameAttribute("Score") : Float), 550, 440);
			}
		});
		
		/* ======================== Actor of Type ========================= */
		addWhenTypeGroupKilledListener(getActorType(5), function(eventActor:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				_EneDeath = (_EneDeath - 1);
				Engine.engine.setGameAttribute("Score", ((Engine.engine.getGameAttribute("Score") : Float) + 10));
			}
		});
		
		/* ======================== Actor of Type ========================= */
		addWhenTypeGroupKilledListener(getActorType(7), function(eventActor:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				_EneDeath = (_EneDeath - 1);
				Engine.engine.setGameAttribute("Score", ((Engine.engine.getGameAttribute("Score") : Float) + 15));
			}
		});
		
		/* ======================== Actor of Type ========================= */
		addWhenTypeGroupKilledListener(getActorType(3), function(eventActor:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				_EneDeath = (_EneDeath - 1);
				Engine.engine.setGameAttribute("Score", ((Engine.engine.getGameAttribute("Score") : Float) + 25));
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((_EneDeath == 0))
				{
					switchScene(GameModel.get().scenes.get(15).getID(), null, createCrossfadeTransition(0.5));
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}