###
# This script generates Android.mk and extractblobs.sh
#
#   Script by gabry3795 - gabry.gabry <at> hotmail.it
#    execute this script every time you add or remo
#    ve files in /proprietary folder
#
#   !!!!!!!!!!!!!!! USE PYTHON 3.4 !!!!!!!!!!!!!!!!!!
####

import sys
import os
import datetime
import getopt

# Environment variables
mkfile_name = "temp-ramdisk.mk"
scriptfile_name = "extract-ramdisk.sh"
txt_file = "ramdisk-files.txt";
root = "rootdir/"
proprietary_version = "B320";

def main() :
    total_files = 0
    counter = 0

    # Init files
    initMkFile()
    initShFile()
    initTxtFile()
    in_mk_file = open(mkfile_name, "a");
    in_sh_file = open(scriptfile_name, "a");
    in_txt_file = open(txt_file, "a");
    print("PRODUCT_COPY_FILES += \\", file=in_mk_file)

    # Count files
    for path, subdirs, files in os.walk(root):
        for name in files:
            total_files += 1

    # Write files
    for path, subdirs, files in os.walk(root):
        for name in files:
            counter += 1

            true_dir = os.path.join(path, name).replace(root,"")

            # Print to terminal
            print("%4d | %s" %(counter, true_dir ))

            # Exclude files
            if(true_dir[true_dir.rfind(".")+1:] in "mk"):
                print("- Skipped")
                continue

            # Print in mk_file
            ## In mkfile last item has not the "\" at the end of the line
            if(counter == total_files):
                end_sep = ""
            else:
                end_sep = " \\"
            print("\t$(LOCAL_PATH)/rootdir/",  true_dir, ":", "root/" + true_dir , end_sep , sep="", file=in_mk_file)
    
            # Print in sh_file
            print("echo \"===> Extracting ", true_dir, "\\n\"", sep="", file=in_sh_file)
            print("adb pull /", true_dir, " ../../../proprietary/" , true_dir[:true_dir.rfind("/")], sep="", file=in_sh_file)
            
            # Print in txt file
            print(true_dir, sep="", file=in_txt_file)
            
    print("\n\n# Total", counter , "files added on", datetime.datetime.utcnow().isoformat(), "UTC" , file=in_mk_file)
    print("\n\n# Total", counter , "files added on", datetime.datetime.utcnow().isoformat(), "UTC", file=in_sh_file)
    print("\n\n# Total", counter , "files added on", datetime.datetime.utcnow().isoformat(), "UTC", file=in_txt_file)

    print("="*50)
    print("Done!", total_files, "files processed")
    print("Check", mkfile_name, "and", scriptfile_name, "\n\n")
        
    in_mk_file.close()
    in_sh_file.close()
    in_txt_file.close()

def initMkFile() :
    infile = open(mkfile_name, "w");
    print("##", file=infile)
    print("# Automatically generated file by generate_files.py", file=infile)
    print("# Script by gabry3795 - gabry.gabry <at> hotmail.it", file=infile)
    print("# ", file=infile)
    print("# These blobs are extracted from the proprietary version number ", proprietary_version ,sep="", file=infile)
    print("#################\n", file=infile)
    print("LOCAL_PATH := vendor/huawei/next\n", file=infile)
    
    # Extra text
    print("\n", file=infile)
    print("#PRODUCT_PACKAGES += \\", file=infile)
    print("#\tlibGLES_mali", file=infile)
    
    print("\n", file=infile)
    
    infile.close()

def initShFile() :    
    infile = open(scriptfile_name, "w");
    print("#!/bin/sh", file=infile)
    print("##", file=infile)
    print("# Automatically generated file by generate_files.py", file=infile)
    print("# Script by gabry3795 - gabry.gabry <at> hotmail.it", file=infile)
    print("# ", file=infile)
    print("# These blobs are extracted from the proprietary version number ", proprietary_version ,sep="", file=infile)
    print("#################\n", file=infile)
    
    print("echo \"!!This script must be executed in the folder device/huawei/next!!\\n\\n\"", file=infile)
    print("echo \"==> Creating the vendor folder...\"", file=infile)
    print("mkdir -p ../../../vendor/huawei/next/proprietary", file=infile)
    print("echo \"==> Copying BoardConfigVendor..\"", file=infile)
    print("cp BoardConfigVendor.mk.disabled ../../../vendor/huawei/next/proprietary/BoardConfigVendor.mk", file=infile)
    print("", file=infile)
    print("echo \"==> Starting extracting files, device must be connected and rooted!\"", file=infile)
    
    infile.close()
    
def initTxtFile() :
    infile = open(txt_file, "w");
    print("##", file=infile)
    print("# Automatically generated file by generate_files.py", file=infile)
    print("# Script by gabry3795 - gabry.gabry <at> hotmail.it", file=infile)
    print("# ", file=infile)
    print("# These blobs are extracted from the proprietary version number ", proprietary_version ,sep="", file=infile)
    print("#################\n", file=infile)
    infile.close()
       
main()

