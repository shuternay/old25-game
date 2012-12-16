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
		public var curFrom:int;
		public var curTo:int;
		public var gView:Sprite = new Sprite();
		public var edges:Array = new Array();
		public var vertexes:Array = new Array();
		public var fc:FatherChristmas;
		public var sign:Sprite = new Sprite();
		public static var INF:int = 32000;
		public static var THIS:Graph;
		
		public function Graph(_lvl:int)
		{
			THIS = this;
			
			level = _lvl;
			init();
			
			fc = new FatherChristmas(from, to);
			
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
			fc.timer.stop();
			graphics.clear();
			edges = [];
			vertexes = [];
			while (numChildren)
				removeChildAt(0);
			
			for (var i:int = 0; i < g.length; i++) 
				for (var j:int = 0; j < g[i].length; j++)
					if (g[i][j] != -1)
						edges.push(new Edge(i, vCrds[i].x, vCrds[i].y, j, vCrds[j].x, vCrds[j].y));
			
			for (var k:int = 0; k < vCrds.length; k++) 
			{
				var curPt:Sprite = new Sprite();
				if (k <= to) {
					curPt.graphics.beginFill(0x00ff00);
					curPt.graphics.drawCircle(vCrds[k].x, vCrds[k].y, 10);
				}
				else {
					curPt.graphics.beginFill(0xffff00);
					curPt.graphics.drawCircle(vCrds[k].x + 3 * Math.cos(vCrds[k].angle + Math.PI/2), vCrds[k].y + 3 * Math.sin(vCrds[k].angle + Math.PI/2), 5);
				}
				vertexes.push(curPt);
			}
			
			for each (var edge:Edge in edges)
			{
				addChild(edge);
				//edge.addEventListener(MouseEvent.ROLL_OVER, onMouseOverEdge); //FIXME пофиксить моргания
				//edge.addEventListener(MouseEvent.ROLL_OUT, onMouseOutEdge);
				edge.addEventListener(MouseEvent.CLICK, onClickEdge);
			}
			
			for each (var vertex:Sprite in vertexes)
			{
				addChild(vertex);
				//edge.addEventListener(MouseEvent.ROLL_OVER, onMouseOverEdge);
				//edge.addEventListener(MouseEvent.ROLL_OUT, onMouseOutEdge);
				//edge.addEventListener(MouseEvent.CLICK, onClickEdge);
			}
			
			addChild(fc);
			fc.timer.start();
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
			var vx1:Number = edge.toX - edge.fromX;
			var vy1:Number = edge.toY - edge.fromY;
			var vx2:Number = curX - edge.fromX;
			var vy2:Number = curY - edge.fromY;
			
			var dist:Number = (vx1 * vy2 - vx2 * vy1) / edge.len;
			
			curX += dist * Math.cos(edge.angle - Math.PI/2);
			curY += dist * Math.sin(edge.angle - Math.PI/2);
			
			vCrds.push({x: curX, y: curY, angle:edge.angle});
			vCrds.push({x: curX, y: curY, angle:edge.angle});
			
			for each (var v:Array in g)
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
			
			g[edge.from][edge.to] = -1;
			g[edge.from][n - 2] /*= g[n - 2][edge.from]*/ = geomDist(vCrds[edge.from].x, vCrds[edge.from].y, curX, curY);
			g[n - 2][n - 1] /*= g[n - 1][n - 2]*/ = 40; //TODO
			/*g[edge.to][n - 1] =*/
			g[n - 1][edge.to] = geomDist(vCrds[edge.to].x, vCrds[edge.to].y, curX, curY);
			
			if (fc.curFrom == edge.from && fc.curTo == edge.to)
			{
				fc.curTo = n - 2;
			}
			
			drawGView();
		}
		
		public function findShortestWay(_from:int, _to:int):Number
		{
			var d:Array = new Array();
			var u:Array = new Array();
			var p:Array = new Array();
			var n:int = g.length;
			
			for (var i:int = 0; i < n; i++)
			{
				d.push(INF);
				u.push(false);
				p.push(0);
			}
			d[_from] = 0;
			
			for (i = 0; i < n; i++)
			{
				var v:int = -1;
				for (var j:int = 0; j < n; j++)
					if (!u[j] && (v == -1 || d[j] < d[v]))
						v = j;
				
				if (d[v] == INF)
					break;
				u[v] = true;
				
				for (j = 0; j < n; ++j)
					if (g[v][j] != -1)
					{
						var to:int = j;
						var len:Number = g[v][j];
						if (d[v] + len < d[to])
						{
							d[to] = d[v] + len;
							p[to] = v;
						}
					}
			}
			
			i = _to;
			while (p[i] != _from)
				i = p[i];
			curTo = i;
			
			return d[_to];
		}
	
	}

}