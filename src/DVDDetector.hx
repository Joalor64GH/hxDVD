package;

#if windows
@:headerCode('
// http://ws0.org/windows-how-to-get-the-tray-status-of-the-optical-drive/
 
#include <Windows.h>
#include <string>
#include <iostream>

#define SCSI_IOCTL_DATA_OUT             0 // Give data to SCSI device (e.g. for writing)
#define SCSI_IOCTL_DATA_IN              1 // Get data from SCSI device (e.g. for reading)
#define SCSI_IOCTL_DATA_UNSPECIFIED     2 // No data (e.g. for ejecting)
 
#define MAX_SENSE_LEN 18 //Sense data max length 
#define IOCTL_SCSI_PASS_THROUGH_DIRECT  0x4D014

typedef unsigned short  USHORT;
typedef unsigned char   UCHAR;
typedef unsigned long   ULONG;
typedef void*           PVOID;
')

@:cppFileCode('
typedef struct _SCSI_PASS_THROUGH_DIRECT
{    
    USHORT Length;    
    UCHAR ScsiStatus;    
    UCHAR PathId;    
    UCHAR TargetId;    
    UCHAR Lun;    
    UCHAR CdbLength;    
    UCHAR SenseInfoLength;    
    UCHAR DataIn;    
    ULONG DataTransferLength;    
    ULONG TimeOutValue;    
    PVOID DataBuffer;    
    ULONG SenseInfoOffset;    
    UCHAR Cdb[16];
}
SCSI_PASS_THROUGH_DIRECT, *PSCSI_PASS_THROUGH_DIRECT;

typedef struct _SCSI_PASS_THROUGH_DIRECT_AND_SENSE_BUFFER 
{    
    SCSI_PASS_THROUGH_DIRECT sptd;    
    UCHAR SenseBuf[MAX_SENSE_LEN];
}
T_SPDT_SBUF;

')
#end

import DVD;

class DVDDetector
{
    #if windows // probably not needed, but whatever
    @:functionCode('
    // Get the drive letter of the first DVD device encountered
    std::string GetDvdDriveLetter()
    {
        std::string dvdDriveLetter = "";
    
        DWORD drives = GetLogicalDrives();
        DWORD dwSize = MAX_PATH;
        char szLogicalDrives[MAX_PATH] = { 0 };
        DWORD dwResult = GetLogicalDriveStrings( dwSize, szLogicalDrives );
    
        if ( dwResult > 0 && dwResult <= MAX_PATH )
        {
            char* szSingleDrive = szLogicalDrives;
    
            while( *szSingleDrive )
            {
                const UINT driveType = GetDriveType( szSingleDrive );
    
                if ( driveType == 5 )
                {
                    dvdDriveLetter = szSingleDrive;
                    dvdDriveLetter = dvdDriveLetter.substr( 0, 2 );
                    break;
                }
    
                // Get the next drive
                szSingleDrive += strlen(szSingleDrive) + 1;
            }
        } 
    
        return dvdDriveLetter;
    }
    ')
    // @:native('GetDvdDriveLetter')
    public static function GetDvdDriveLetter(){
        return dvdDriveLetter; // Idk if this works or not, joalor you need to test this please
    }

    #end
}