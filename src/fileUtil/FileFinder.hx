package fileUtil;

import fileUtil.FileTypes;
import openfl.utils.Assets;

#if sys
import sys.FileSystem;
import sys.io.File;
#end

class FileFinder
{
    public var file:Dynamic;

    public var path:String;

    if (Assets.exists(file) && Assets.exists(path)){
        if (file.endsWith(".iso")){
            return Paths.getIso(file, path);
        }
    }
}
