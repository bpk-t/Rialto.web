
class Logic {
  public var vd:ViewData;
  public function new(vd:ViewData) {
    this.vd = vd;
  }

  public function init():Void {
    for (i in 0...30) {
      var tag = new ViewData.TagItem();
      tag.id = 'id${i}';
      tag.name = 'tag name${i}';
      tag.count = i;
      this.vd.left.tags.push(tag);
    }

    for (i in 0...36) {
      var img = new ViewData.ThumbnailImage();
      img.src = "";

      this.vd.thumbnail.images.push(img);
    }
  }
}