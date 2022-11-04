package;

import fileUtil.FileTypes;
import openfl.utils.Assets;

#if sys
import sys.FileSystem;
import sys.io.File;
#end

class Paths
{
    // will test soon
    public static inline function getIso(file:String, path:String, ?directory:String){
        if (Assets.exists(file) && path != '' || path != null){
            return file;
        }
        else if (Assets.exists(file) && path != null && directory != null){
            var fileToReturn:String = path + '/' + directory;
            return fileToReturn;
        }
        else if (!Assets.exists(file)){
            return null;
        }
        else if (directory == null){
            var fileToReturn:String = path;
            return fileToReturn;
            trace('Directory not found');
        }
    }
}