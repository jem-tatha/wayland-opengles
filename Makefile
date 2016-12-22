#/*
# *  Copyright (C) 2016.
# *  All Rights Reserved.
# *
# */
#
#
.PHONY: clean

ROOTFS ?= $(SDKTARGETSYSROOT)

ROOTFS_USR :=$(ROOTFS)/usr

OBJS := wl-triangle.o

CFLAGS += -I $(ROOTFS)/usr/include --sysroot=$(ROOTFS)

LFLAGS += -Wl,-rpath-link,$(ROOTFS)/usr/lib -Wl,-rpath-link,$(ROOTFS)/usr/lib/arm-linux-gnueabi -lwayland-client -lwayland-egl -lGLESv2 -lEGL -lm --sysroot=$(ROOTFS)


TARGET := wl-triangle
all:$(TARGET)

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

# build as shared library
wl-triangle: wl-triangle.o
	$(CC) $^ -o wl-triangle $(LFLAGS)

clean:
	-@rm $(TARGET) $(OBJS)

