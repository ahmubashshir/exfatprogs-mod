FILES := module.prop sepolicy.rule
STATIC:= LICENSE customize.sh
DIRS := libs

all: exfatprogs.zip

exfatprogs.zip: $(STATIC) $(FILES) $(DIRS)
	@echo "ZIP    "$(^) "[$@]"
	@zip -r9 $@ $(^)

%: %.sh
	@echo "GEN    $@"
	@sh $< > $@

clean:
	@echo "CLEAN  ndk"
	@ndk-build clean
	@rm -f libs/.built
	@echo "CLEAN  "$(FILES) exfatprogs.zip $(DIRS) obj
	@rm -f $(FILES) exfatprogs.zip
	@rm -rf $(DIRS) obj

libs: libs/.built
libs/.built: jni/*.mk
	@echo "BUILD  exfatprogs [ndk]"
	@ndk-build
	@touch libs/.built

.PHONY: all clean libs
