// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flame/components.dart';
import 'package:pixel_adventure_flame/pixel_adventure.dart';

class BackgroundTile extends SpriteComponent
    with HasGameReference<PixelAdventure> {
  BackgroundTile({
    this.color = 'Gray',
    position,
  }) : super(position: position);
  final String color;

  final double scrollsSpeed = 0.4;

  @override
  FutureOr<void> onLoad() {
    priority = -1;
    size = Vector2.all(64.6);
    sprite = Sprite(game.images.fromCache('Background/$color.png'));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.y += scrollsSpeed;
    double tileSize = 64;
    int scrollHeight = (game.size.y / tileSize).floor();
    if (position.y > scrollHeight * tileSize) position.y = -tileSize;
    super.update(dt);
  }
}
