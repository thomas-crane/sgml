import { expect } from 'chai';
import 'mocha';
import { join } from 'path';
import { Parser } from '../../src/parser/parser';
import { Program } from '../../src/program/program';
import { source } from '../util';

// examples are taken from the GML reference doc
// https://docs.yoyogames.com/source/dadiospice/002_reference/001_gml%20language%20overview/

const EXAMPLES = [
  // 0
  `potions = 12;
life = 100;
name = "Jock MacSweeney";
strength = 5.5;
armour = -2;
`,

  // 1
  `var xx,yy;
xx = x - 32 +irandom(64) >> 2;
yy = y - 32 +irandom(64) | 3;
instance_create(xx, yy, obj_blood);
`,

  // 2
  `global.food = 5;
`,

  // 3
  `var inst = instance_position(mouse_x, mouse_y, all);
if (instance_exists(inst))    {
  inst.speed = 0;
  }
`,

  // 4
  `array[2] = 0;
array[1] = 0;
array[0] = 0;
count = 3;
array[count] = "you?";
count -= 1;
array[count] = "are ";
count -= 1;
array[count] = "How ";
count -= 1;
array[count] = "Hello!";
count -= 1;
`,

  // 5
  `instance_nearest(x, y, obj).speed = 0;
`,

  // 6
  `(instance_nearest(x,y,obj)).speed = 0;
`,

  // 7
  `ds = ds_list_create();
var index = 0;
repeat(10)
  {
  ds[| index++] = irandom(9);
  }
`,

  // 8
  `ds = ds_map_create();
ds[? "Name"] = "Hamish";
ds[? "Company"] = "MacSeweeny Games";
ds[? "Game"] = "Catch The Haggis";
`,

  // 9
  `ds = ds_grid_create();
ds_grid_clear(ds, 0);
var gw = ds_grid_width(ds) - 1;
var gh = ds_grid_height(ds) - 1;
repeat(10)
  {
  var xx = irandom(gw);
  var yy = irandom(gh);
  if (ds[# xx, yy] == 0) ds[# xx, yy] = 1;
  }
`,

  // 10
  `var a = argument0; var i = 0; repeat(25)
{
i = irandom(99);
while (a[i] != 0)
  {
  i = irandom(99);
  }
a[@ i] = 100;
}
`,

  // 11
  `if (x < 200)
{
x += 4;
}
else
{
x -= 4;
}
`,

  // 12
  `{
var i, total;
i = 0;
total = 0;
repeat (10)
    {
    total += array[i];
    i += 1;
    }
draw_text(32, 32, total);
}`,

  // 13
  `{
while (!place_free(x, y))
    {
    x = random(room_width);
    y = random(room_height);
    }
}
`,

  // 14
  `{
do
    {
    x = random(room_width);
    y = random(room_height);
    }
until (place_free(x, y)); }
`,

  // 15
  `{
var i;
for (i = 0; i < 10; i += 1)
    {
    draw_text(32, 32 + (i * 32), string(i) + ". "+ string(scr[i]));
    }
}
`,

  // 16
  `{
switch (keyboard_key)
    {
    case vk_left:
    case ord("A"):
      x -= 4;
      break;
    case vk_right:
    case ord("D"):
      x += 4;
      break;
    case vk_up:
    case ord("W"):
      y -= 4;
      break;
    case vk_down:
    case ord("S"):
      y += 4;
      break;
    }
    default:
      x += $ff00;
      break;
}
`,

  // 17
  `{
var i;
for (i = 0; i < 10; i += 1)
  {
  if array[i] = 234 break;
  }
num = i;
}
`,

  // 18
  `{
var i;
for (i = 0; i < 10; i += 1)
    {
    if array[i] = "" continue;
    array[i] = "";
    }
}
`,

  // 19
  `{
if invisible exit;
while (place_meeting(x, y))
  {
  x -= lengthdir_x(1, direction div 180);
  y -= lengthdir_y(1, direction % 180);
  }
}
`,

  // 20
  `var inst;
inst = noone;
with (obj_ball)
  {
  if str > other.str inst = id;
  }
if inst != noone target = inst;
`,

  // 21
  `if true || false {
    return 10;
  } else {
    return "test";
  }
`,

];

describe('Parser', () => {
  for (let i = 0; i < EXAMPLES.length; i++) {
    it(`should parse example #${i}`, async () => {
      const parser = new Parser(source(EXAMPLES[i]));
      await parser.parseRoot();
      expect(parser.diagnostics.reports.length).to.equal(0);
    });
  }
  it('should report a diagnostic if an unexpected token is encountered.', async () => {
    const parser = new Parser(source('if > 10 break;'));
    await parser.parseRoot();
    expect(parser.diagnostics.reports.length).to.be.greaterThan(0);
  });
  it('should not get stuck while parsing an array index expression.', async () => {
    const parser = new Parser(source('test[if for while'));
    const result = await parser.parseRoot();
    expect(result).not.to.equal(undefined);
  });
  it('should not get stuck while parsing an array access expression.', async () => {
    const parser = new Parser(source('test[@if for while'));
    const result = await parser.parseRoot();
    expect(result).not.to.equal(undefined);
  });
  it('should not get stuck while parsing a call expression.', async () => {
    const parser = new Parser(source('test(if for while'));
    const result = await parser.parseRoot();
    expect(result).not.to.equal(undefined);
  });
  it('should not get stuck while parsing a switch statement.', async () => {
    const parser = new Parser(source('switch (test) {💡💡💡'));
    const result = await parser.parseRoot();
    expect(result).not.to.equal(undefined);
  });
  it('should not get stuck while parsing a block statement.', async () => {
    const parser = new Parser(source('{💡💡💡'));
    const result = await parser.parseRoot();
    expect(result).not.to.equal(undefined);
  });
  it('should not get stuck while parsing a script.', async () => {
    const parser = new Parser(source('💡💡💡'));
    const result = await parser.parseRoot();
    expect(result).not.to.equal(undefined);
  });
  // FIXME(thomas-crane): this takes a while. Maybe we can
  // parallelize this at some point.
  it('should parse a large amount of sample code.', async () => {
    const FILE_DIR = join(__dirname, '..', 'test-scripts');
    const program = new Program(FILE_DIR);
    await program.getSourceFiles();
    const result = await program.emit();
    const sum = result.reduce((sum, unit) => sum + unit.diagnostics.reports.length, 0);
    expect(sum).to.equal(0);
  });
});
