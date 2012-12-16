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
		public var crashCrds:Array = new Array;
		public var from:int;
		public var to:int;
		public var curFrom:int;
		public var curTo:int;
		public var gView:Sprite = new Sprite();
		public var edges:Array = new Array();
		public var vertexes:Array = new Array();
		public var crahes:Array = new Array();
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
					vCrds.push({x: 440, y: 30, type: 0}); //0
					vCrds.push({x: 444, y: 240, type: 0}); //1
					vCrds.push({x: 570, y: 240, type: 0}); //2
					vCrds.push({x: 570, y: 400, type: 0}); //3
					vCrds.push({x: 385, y: 530, type: 0}); //4
					vCrds.push({x: 385, y: 565, type: 0}); //5
					vCrds.push({x: 385, y: 375, type: 0}); //6
					vCrds.push({x: 355, y: 375, type: 0}); //7
					vCrds.push({x: 220, y: 390, type: 0}); //8
					vCrds.push({x: 115, y: 485, type: 0}); //9
					vCrds.push({x: 115, y: 565, type: 0}); //10
					vCrds.push({x: 355, y: 295, type: 0}); //11
					vCrds.push({x: 115, y: 295, type: 0}); //12
					vCrds.push({x: 85, y: 565, type: 0}); //13
					vCrds.push({x: 580, y: 400, type: 0}); //14
					vCrds.push({x: 580, y: 530, type: 0}); //15
					vCrds.push({x: 220, y: 485, type: 0}); //16 //A
					vCrds.push({x: 355, y: 240, type: 0}); //17 //B
					for (var i:int = 0; i < 18; i++)
					{
						g[i] = new Array;
						for (var j:int = 0; j < 18; j++)
						{
							g[i][j] = -1;
						}
					}
					g[0][1] = g[1][0] = geomDist(vCrds[0].x, vCrds[0].y, vCrds[1].x, vCrds[1].y); //0-1
					g[1][2] = g[2][1] = geomDist(vCrds[1].x, vCrds[1].y, vCrds[2].x, vCrds[2].y); //1-2
					g[2][3] = g[3][2] = geomDist(vCrds[2].x, vCrds[2].y, vCrds[3].x, vCrds[3].y); //2-4
					g[3][14] = g[14][3] = geomDist(vCrds[3].x, vCrds[3].y, vCrds[14].x, vCrds[14].y); //3-14
					g[14][15] = g[15][14] = geomDist(vCrds[14].x, vCrds[14].y, vCrds[15].x, vCrds[15].y); //14-15
					g[15][4] = g[4][15] = geomDist(vCrds[4].x, vCrds[4].y, vCrds[15].x, vCrds[15].y); //4-15
					g[4][5] = g[5][4] = geomDist(vCrds[4].x, vCrds[4].y, vCrds[5].x, vCrds[5].y); //4-5
					g[4][6] = g[6][4] = geomDist(vCrds[4].x, vCrds[4].y, vCrds[6].x, vCrds[6].y); //4-6
					g[6][7] = g[7][6] = geomDist(vCrds[6].x, vCrds[6].y, vCrds[7].x, vCrds[7].y); //6-7
					g[5][10] = g[10][5] = geomDist(vCrds[5].x, vCrds[5].y, vCrds[10].x, vCrds[10].y); //5-10
					g[10][13] = g[13][10] = geomDist(vCrds[10].x, vCrds[10].y, vCrds[13].x, vCrds[13].y); //10-13
					g[10][9] = g[9][10] = geomDist(vCrds[10].x, vCrds[10].y, vCrds[9].x, vCrds[9].y); //10-9
					g[12][9] = g[9][12] = geomDist(vCrds[12].x, vCrds[12].y, vCrds[9].x, vCrds[9].y); //12-9
					g[12][11] = g[11][12] = geomDist(vCrds[12].x, vCrds[12].y, vCrds[11].x, vCrds[11].y); //12-11
					g[17][11] = g[11][17] = geomDist(vCrds[17].x, vCrds[17].y, vCrds[11].x, vCrds[11].y); //17-11
					g[1][17] = g[17][1] = geomDist(vCrds[1].x, vCrds[1].y, vCrds[17].x, vCrds[17].y); //1-17
					g[7][11] = g[11][7] = geomDist(vCrds[7].x, vCrds[7].y, vCrds[11].x, vCrds[11].y); //7-11
					g[7][8] = g[8][7] = geomDist(vCrds[7].x, vCrds[7].y, vCrds[8].x, vCrds[8].y); //7-8
					g[16][8] = g[8][16] = geomDist(vCrds[16].x, vCrds[16].y, vCrds[8].x, vCrds[8].y); //16-8
					g[16][9] = g[9][16] = geomDist(vCrds[16].x, vCrds[16].y, vCrds[9].x, vCrds[9].y); //16-9
					
					from = 0;
					to = 13;
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
			crahes = [];
			while (numChildren)
				removeChildAt(0);
			
			for (var i:int = 0; i < g.length; i++)
				for (var j:int = 0; j < g[i].length; j++)
					if (g[i][j] != -1)
						edges.push(new Edge(i, vCrds[i].x, vCrds[i].y, j, vCrds[j].x, vCrds[j].y));
			
			for (var k:int = 0; k < vCrds.length; k++)
			{
				var curPt:Vertex = new Vertex();
				curPt.num = k;
				
				switch (vCrds[k].type)
				{
					case 0: 
						curPt.graphics.beginFill(0x00ff00);
						curPt.graphics.drawCircle(0, 0, 10);
						curPt.x = vCrds[k].x;
						curPt.y = vCrds[k].y;
						break;
					case 1: 
						curPt.graphics.beginFill(0xffff00);
						curPt.graphics.drawCircle(0, 0, 5);
						curPt.x = vCrds[k].x + 3 * Math.cos(vCrds[k].angle + Math.PI / 2);
						curPt.y = vCrds[k].y + 3 * Math.sin(vCrds[k].angle + Math.PI / 2);
						break;
				}
				vertexes.push(curPt);
			}
			
			for (var l:int = 0; l < crashCrds.length; l++)
			{
				var curPt2:Sprite = new Sprite();
				curPt2.graphics.beginFill(0xff0000);
				curPt2.graphics.drawCircle(crashCrds[l].x, crashCrds[l].y, 3);
				crahes.push(curPt2);
			}
			
			for each (var edge:Edge in edges)
			{
				addChild(edge);
				edge.addEventListener(MouseEvent.CLICK, onClickEdge);
			}
			
			for each (var vertex:Sprite in vertexes)
			{
				addChild(vertex);
				vertex.addEventListener(MouseEvent.CLICK, onClickVertex);
			}
			
			for each (var crash:Sprite in crahes)
			{
				addChild(crash);
			}
			
			addChild(fc);
			fc.timer.start();
		}
		
		private function onClickVertex(e:MouseEvent):void
		{
			if (Game.THIS.curAb == 2)
			{
				var curVert:Vertex = e.currentTarget as Vertex;
				
				crashCrds.push({x: curVert.x, y: curVert.y, type: 2});
				drawGView();
				
				for (var i:int = 0; i < g.length; i++)
				{
					if (g[i][curVert.num] != -1)
					{
						g[i][curVert.num] *= 1.1;
					}
				}
				
				if (fc.curTo == curVert.num) {
					fc.len *= 1.1;
					fc.pos *= 1.1;
				}
			}
		}
		
		private function onClickEdge(e:MouseEvent):void
		{
			if (Game.THIS.curAb == 1)
			{
				var curEdge:Edge = e.currentTarget as Edge;
				insertVertex(curEdge, e.localX, e.localY);
			}
		}
		
		public function insertVertex(edge:Edge, curX:Number, curY:Number):void
		{
			var vx1:Number = edge.toX - edge.fromX;
			var vy1:Number = edge.toY - edge.fromY;
			var vx2:Number = curX - edge.fromX;
			var vy2:Number = curY - edge.fromY;
			
			var dist:Number = (vx1 * vy2 - vx2 * vy1) / edge.len;
			
			curX += dist * Math.cos(edge.angle - Math.PI / 2);
			curY += dist * Math.sin(edge.angle - Math.PI / 2);
			
			vCrds.push({x: curX, y: curY, angle: edge.angle, type: 1});
			vCrds.push({x: curX, y: curY, angle: edge.angle, type: 1});
			
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
			g[n - 2][n - 1] /*= g[n - 1][n - 2]*/ = 25; //TODO
			/*g[edge.to][n - 1] =*/
			g[n - 1][edge.to] = geomDist(vCrds[edge.to].x, vCrds[edge.to].y, curX, curY);
			
			if (fc.curFrom == edge.from && fc.curTo == edge.to)
			{
				if (fc.pos < g[edge.from][n - 2])
				{
					fc.len = g[edge.from][n - 2];
					fc.curTo = n - 2;
				}
				else
				{
					fc.len = g[n - 1][edge.to];
					fc.pos -= g[edge.from][n - 2];
					fc.curFrom = n - 1;
				}
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