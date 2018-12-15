
class ViewData
{
  public var left:LeftPane;
  public var thumbnail:Thumbnail;
  public function new() {
    this.left = new LeftPane();
    this.thumbnail = new Thumbnail();
  }
}

class LeftPane {
  public var tags:Array<TagItem>;
  public function new() {

    this.tags = [];
  }
}
class TagItem {
  public var id:String;
  public var name:String;
  public var count:Int;
  public function new() {

  }
}

class Thumbnail {
  public var images:Array<ThumbnailImage>;
  public function new() {
    this.images = [];
  }
}

class ThumbnailImage {
  public var id:String;
  public var src:String;
  public function new() {
    
  }
}