LOCAL_PATH   := $(call my-dir)

define Import
$(eval undefine @MOD @BASE)
$(eval @MOD := $1)
$(eval @BASE := $(LOCAL_PATH)/)
$(eval include $(LOCAL_PATH)/$1.mk)
$(eval undefine @MOD @BASE)
endef

define LocalSources
$(eval LOCAL_SRC_FILES := $(patsubst $(@BASE)%,%,$(wildcard $(addprefix $(@BASE)$(@MOD)/,$1))))
endef

define LocalCIncludes
$(eval LOCAL_C_INCLUDES := $(addprefix $(@BASE)$(@MOD)/,$1))
endef

define LocalCExports
$(eval LOCAL_EXPORT_C_INCLUDES := $(addprefix $(@BASE)$(@MOD)/,$1))
endef

$(call Import,blkid_e2fsprogs)
$(call Import,exfatprogs)
