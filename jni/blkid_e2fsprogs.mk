include $(CLEAR_VARS)
LOCAL_MODULE := blkid
$(call LocalSources, lib/blkid/*.c)
$(call LocalCIncludes, lib lib/blkid)
$(call LocalCExports, lib/blkid lib)
LOCAL_STATIC_LIBRARIES := uuid
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := uuid
LOCAL_CFLAGS += -fdeclspec -Wno-ignored-attributes -Wno-int-to-pointer-cast
$(call LocalSources, lib/uuid/*.c)
$(call LocalCIncludes, lib lib/uuid)
$(call LocalCExports, lib/uuid lib)
include $(BUILD_STATIC_LIBRARY)
