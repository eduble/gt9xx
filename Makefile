MODULE_NAME := goodix_backport
MODULE_FILENAME := goodix
KVER?= $(shell uname -r)
ifneq ($(KERNELRELEASE),)
	obj-m		:= $(MODULE_NAME).o
	$(MODULE_NAME)-y	:= $(MODULE_FILENAME).o
	#EXTRA_CFLAGS += -DDEBUG

else
	PWD := $(shell pwd)
	KVER := $(KVER)
	KDIR := /lib/modules/$(KVER)/build

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	rm -rf *.o *.mod.c *.mod.o *.ko *.symvers *.order *.a

endif
