int g_numChildren = 3;
int g_maxLevels = 3;
Branch g_trunk;

void setup() {
  size(400, 400);
  background(0);
  noFill();
  smooth();
  newTree();
}

void draw() {
  background(0);
  g_trunk.update(width / 2, height / 2);
  g_trunk.draw();
}

void newTree() {
  g_trunk = new Branch(1, 0, width / 2, height / 2);
  g_trunk.draw();
}

class Branch {
  float _level;
  float _index;
  float _x;
  float _y;
  float _endx;
  float _endy;
  float _strokeWeight;
  float _alpha;
  float _length;
  float _lengthChange;
  float _rotation;
  float _rotationChange;
  Branch[] _children = new Branch[0];

  Branch(float level, float index, float x, float y) {
    _level = level;
    _index = index;
    _strokeWeight = (1 / level) * 10;
    _alpha = 255 / level;
    _length = (1 / level) * random(200);
    _rotation = random(360);
    _lengthChange = random(10) - 5;
    _rotationChange = random(10) - 5;
    update(x, y);

    if (level < g_maxLevels) {
      _children = new Branch[g_numChildren];
      for (int i = 0; i < g_numChildren; ++i) {
        _children[i] = new Branch(level + 1, x, _endx, _endy);
      }
    }
  }

  void update(float x, float y) {
    _x = x;
    _y = y;

    _rotation += _rotationChange;
    if (_rotation > 360)
      _rotation = 0;
    else if (_rotation < 0)
      _rotation = 360;

    _length -= _lengthChange;
    if (_length < 0 || _length > 200)
      _lengthChange *= -1;

    float rad = radians(_rotation);
    _endx = _x + (_length * cos(rad));
    _endy = _y + (_length * sin(rad));

    for (int i = 0; i < _children.length; ++i)
      _children[i].update(_endx, _endy);
  }

  void draw() {
    if (_level > 1) {
      strokeWeight(_strokeWeight);
      stroke(0, 192, 255, _alpha);
      fill(255, _alpha);
      line(_x, _y, _endx, _endy);
      ellipse(_x, _y, _length / 12, _length / 12);
    }

    for (int i = 0; i < _children.length; ++i)
      _children[i].draw();
  }
}

