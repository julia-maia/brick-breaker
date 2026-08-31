enum BrickColor { defaulPattern, grey, black }

enum BrickSize { small, large }

class GameSettings {
  BrickColor brickColor;
  BrickSize brickSize;

  GameSettings({
    this.brickColor = BrickColor.defaulPattern,
    this.brickSize = BrickSize.small,
  });
}
