include $(CLEAR_VARS)
LOCAL_MODULE := exfat
LOCAL_CFLAGS += -Wno-format
$(call LocalSources, lib/*.c)
$(call LocalCIncludes, include)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := fsck.exfat
LOCAL_STATIC_LIBRARIES := exfat
$(call LocalSources, fsck/*.c)
$(call LocalCIncludes, include fsck)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := exfatlabel
LOCAL_STATIC_LIBRARIES := exfat
$(call LocalSources, label/*.c)
$(call LocalCIncludes, include)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := mkfs.exfat
LOCAL_STATIC_LIBRARIES := exfat blkid
$(call LocalSources, mkfs/*.c)
$(call LocalCIncludes, include)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := tune.exfat
LOCAL_STATIC_LIBRARIES := exfat blkid
$(call LocalSources, tune/*.c)
$(call LocalCIncludes, include)
include $(BUILD_EXECUTABLE)
