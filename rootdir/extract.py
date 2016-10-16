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

# Environment variables
mkfile_name = "Android.mk"
init_mk_filename = "../init.mk"
root = os.getcwd()

def main() :
    total_files = 0
    counter = 0

    # Init files
    initMkFile()
    initMk2File()
    in_mk_file = open(mkfile_name, "a");
    in_mk_init_file = open(init_mk_filename, "a");
  
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
            print("%4d | %s" %(counter, true_dir))

            # Exclude files
            if(true_dir[true_dir.rfind(".")+1:] in "mkpy"):
                print("- Skipped")
                continue

            # Print in mk_file
            print("#######################################", file=in_mk_file)
            print("#", true_dir[1:], file=in_mk_file)
            print("include $(CLEAR_VARS)", file=in_mk_file)
            print("LOCAL_MODULE       :=", true_dir[1:], file=in_mk_file)
            print("LOCAL_SRC_FILES    := $(LOCAL_MODULE)", file=in_mk_file)
            print("LOCAL_MODULE_CLASS := ETC", file=in_mk_file)
            print("LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)", sep="", file=in_mk_file) #true_dir.replace(name, "")[:-1],
            print("include $(BUILD_PREBUILT)", file=in_mk_file)
            print("\n", file=in_mk_file)
            
            # Print in mk_init
            ## In mkfile last item has not the "\" at the end of the line
            if(counter == total_files):
                end_sep = ""
            else:
                end_sep = " \\"
            print("\t", true_dir[1:], end_sep , sep="", file=in_mk_init_file)
            
    print("\n\n# Total", counter , "files added on", datetime.datetime.utcnow().isoformat(), "UTC" , file=in_mk_file)
    print("\n\n# Total", counter , "files added on", datetime.datetime.utcnow().isoformat(), "UTC" , file=in_mk_init_file)

    print("="*50)
    print("Done!", total_files, "files processed")
    
    in_mk_file.close()
    in_mk_init_file.close()

def initMkFile() :
    infile = open(mkfile_name, "w");
    print("# Automatically generated file by generate_mk.py", file=infile)
    print("# Script by gabry3795 - gabry.gabry <at> hotmail.it\n", file=infile)
    print("LOCAL_PATH:= $(call my-dir)", file=infile)
    
    print("\n", file=infile)
    
    infile.close()
    
def initMk2File() :
    infile = open(init_mk_filename, "w");
    print("# Automatically generated file by generate_mk.py", file=infile)
    print("# Script by gabry3795 - gabry.gabry <at> hotmail.it\n", file=infile)
    print("PRODUCT_PACKAGES += \\", file=infile)
    
    infile.close()
       
main()
