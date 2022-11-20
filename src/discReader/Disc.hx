package discReader;

import discReader.DiscReader;
import discReader.DiscDetector;

class Disc extends DiscReader
{
    var length:Float = 0; // song length or whatever shit is playing

    public function new(){
        super();
    }

    override function create(){
        super.create();
    }

    override function update(elapsed:Float){
        super.update(elapsed);
    }
}