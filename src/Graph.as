package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Shuternay
	 */
	public class Graph extends Sprite
	{
		public var level:int;
		public var g:Array = new Array;
		public var vCrds:Array = new Array;
		public var from:int;
		public var to:int;
		public var gView:Sprite = new Sprite();
		public var edges:Array = new Array();
		public var sign:Sprite = new Sprite();
		
		public function Graph(_lvl:int)
		{
			level = _lvl;
			init();
			drawGView();
			sign.graphics.beginFill(0x0000ff);
			sign.graphics.drawCircle(0, 0, 10);
			sign.graphics.endFill();
		}
		
		public function init():void
		{
			switch (level)
			{
				case 1: 
					vCrds.push({x: 0, y: 0}); //0
					vCrds.push({x: 100, y: 0}); //1
					vCrds.push({x: 200, y: 50}); //2
					vCrds.push({x: 30, y: 150}); //3
					vCrds.push({x: 100, y: 100}); //4
					vCrds.push({x: 100, y: 300}); //5
					vCrds.push({x: 150, y: 230}); //6
					vCrds.push({x: 250, y: 200}); //7
					vCrds.push({x: 250, y: 300}); //8
					for (var i:int = 0; i < 9; i++)
					{
						g[i] = new Array;
						for (var j:int = 0; j < 9; j++)
						{
							g[i][j] = -1;
						}
					}
					g[0][1] = g[1][0] = geomDist(vCrds[0].x, vCrds[0].y, vCrds[1].x, vCrds[1].y); //0-1
					g[0][3] = g[3][0] = geomDist(vCrds[0].x, vCrds[0].y, vCrds[3].x, vCrds[3].y); //0-3
					g[0][4] = g[4][0] = geomDist(vCrds[0].x, vCrds[0].y, vCrds[4].x, vCrds[4].y); //0-4
					g[1][2] = g[2][1] = geomDist(vCrds[1].x, vCrds[1].y, vCrds[2].x, vCrds[2].y); //1-2
					g[2][4] = g[4][2] = geomDist(vCrds[2].x, vCrds[2].y, vCrds[4].x, vCrds[4].y); //2-4
					g[2][7] = g[7][2] = geomDist(vCrds[2].x, vCrds[2].y, vCrds[7].x, vCrds[7].y); //2-7
					g[3][4] = g[4][3] = geomDist(vCrds[3].x, vCrds[3].y, vCrds[4].x, vCrds[4].y); //3-4
					g[3][5] = g[5][3] = geomDist(vCrds[3].x, vCrds[3].y, vCrds[5].x, vCrds[5].y); //3-5
					g[4][6] = g[6][4] = geomDist(vCrds[4].x, vCrds[4].y, vCrds[6].x, vCrds[6].y); //4-6
					g[5][6] = g[6][5] = geomDist(vCrds[5].x, vCrds[5].y, vCrds[6].x, vCrds[6].y); //5-6
					g[5][8] = g[8][5] = geomDist(vCrds[5].x, vCrds[5].y, vCrds[8].x, vCrds[8].y); //5-8
					g[6][7] = g[7][6] = geomDist(vCrds[6].x, vCrds[6].y, vCrds[7].x, vCrds[7].y); //6-7
					g[7][8] = g[8][7] = geomDist(vCrds[7].x, vCrds[7].y, vCrds[8].x, vCrds[8].y); //7-8
					from = 0;
					to = 8;
					break;
			}
		}
		
		public function geomDist(x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			return Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
		}
		
		public function drawGView():void
		{
			graphics.clear();
			edges = [];
			while (numChildren)
				removeChildAt(0);
			
			for (var i:int = 0; i < g.length; i++)
			{
				for (var j:int = 0; j < g[i].length; j++)
				{
					if (g[i][j] != -1)
					{
						/*gView.graphics.lineStyle(3, 0xff0000);
						   gView.graphics.moveTo(vCrds[i].x + 30, vCrds[i].y + 30);
						 gView.graphics.lineTo(vCrds[j].x + 30, vCrds[j].y + 30);*/
						edges.push(new Edge(i, vCrds[i].x + 30, vCrds[i].y + 30, j, vCrds[j].x + 30, vCrds[j].y + 30));
						graphics.beginFill(0x00ff00);
						graphics.drawCircle(vCrds[i].x + 30, vCrds[i].y + 30, 10);
						graphics.drawCircle(vCrds[j].x + 30, vCrds[j].y + 30, 10);
					}
				}
			}
			for each (var edge:Edge in edges)
			{
				addChild(edge);
				edge.addEventListener(MouseEvent.ROLL_OVER, onMouseOverEdge);//FIXME пофиксить моргания
				edge.addEventListener(MouseEvent.ROLL_OUT, onMouseOutEdge);
				edge.addEventListener(MouseEvent.CLICK, onClickEdge);
			}
		
		}
		
		
		
		public function onMouseOverEdge(e:MouseEvent):void
		{
			var curEdge:Edge = e.currentTarget as Edge;
			if (!curEdge.signed)
			{
				curEdge.signed = 1;
				sign.x = e.localX;
				sign.y = e.localY;
				addChild(sign);
			}
		}
		
		public function onMouseOutEdge(e:MouseEvent):void 
		{
			var curEdge:Edge = e.currentTarget as Edge;
			/*sign.x = e.localX;
			   sign.y = e.localY;
			 addChild(sign);*/
			if (curEdge.signed)
			{
				curEdge.signed = 0;
				removeChild(sign);
			}
		}
		
		private function onClickEdge(e:MouseEvent):void 
		{
			var curEdge:Edge = e.currentTarget as Edge;
			insertVertex(curEdge, e.localX, e.localY);
		}
		
		public function insertVertex(edge:Edge, curX:Number, curY:Number):void
		{
			curX -= 30;
			curY -= 30;
			vCrds.push( { x:curX, y:curY } );
			vCrds.push( { x:curX, y:curY } );
			
			for each(var v:Array in g)
			{
				v.push(-1);
				v.push(-1);
			}
			g.push(new Array());
			g.push(new Array());
			var n:int = g.length;
			for (var i:int = 0; i < n; i++) 
			{
				g[n - 2][i] = -1;
				g[n - 1][i] = -1;
			}
			
			g[edge.from][edge.to] = g[edge.to][edge.from] = -1;
			g[edge.from][n-2] = g[n-2][edge.from] = geomDist(vCrds[edge.from].x, vCrds[edge.from].y, curX, curY);
			g[edge.to][n - 1] = g[n - 1][edge.to] = geomDist(vCrds[edge.to].x, vCrds[edge.to].y, curX, curY);
			g[n - 2][n - 1] = g[n - 1][n - 2] = 10; //TODO
			
			drawGView();
		}
	}

}