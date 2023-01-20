Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E63BE675D5E
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 20:03:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674241384;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=adqykot2GnquA7rUcsapQTVK7QYqU3K77JqkbSnF2Cw=;
	b=Q4gWOgY2JGWc+cJ6PLN57fF7H4FI7vgnpMzVMgrGOj+W2ITuEy8EwBfyuINrum7UIk69ou
	eOJBQIOfPoX5EfzscxCjmSRFDOEbxSLRksw3irYHn4mjjm2neBc/3siktbjy4KY6gEpcWT
	Y7g/lOiorRdBVWS0T/bXRaQTLZGA3DI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-MMgW_X4RMaar270Sp9jQ6g-1; Fri, 20 Jan 2023 14:03:02 -0500
X-MC-Unique: MMgW_X4RMaar270Sp9jQ6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CB6485570D;
	Fri, 20 Jan 2023 19:02:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 127A4C16020;
	Fri, 20 Jan 2023 19:02:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2F4391947058;
	Fri, 20 Jan 2023 19:02:51 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3C5311946588 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 14:20:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2F23C40C6EC4; Fri, 20 Jan 2023 14:20:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27CA64014EBE
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:20:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE020802C18
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 14:20:49 +0000 (UTC)
Received: from fx306.security-mail.net (smtpout30.security-mail.net
 [85.31.212.36]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-T3P94S8GOc-TSuu-zF0ywQ-1; Fri, 20 Jan 2023 09:20:47 -0500
X-MC-Unique: T3P94S8GOc-TSuu-zF0ywQ-1
Received: from localhost (fx306.security-mail.net [127.0.0.1])
 by fx306.security-mail.net (Postfix) with ESMTP id 50AA935CEFC
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 15:20:46 +0100 (CET)
Received: from fx306 (fx306.security-mail.net [127.0.0.1]) by
 fx306.security-mail.net (Postfix) with ESMTP id A206C35CD7F; Fri, 20 Jan
 2023 15:20:45 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx306.security-mail.net (Postfix) with ESMTPS id 21C5235CD0C; Fri, 20 Jan
 2023 15:20:45 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 9769527E0465; Fri, 20 Jan 2023
 15:10:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 807A927E0456; Fri, 20 Jan 2023 15:10:37 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 jR-SNzcBpINi; Fri, 20 Jan 2023 15:10:37 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 1C6A727E0458; Fri, 20 Jan 2023
 15:10:37 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <1035.63caa33d.1d517.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 807A927E0456
From: Yann Sionneau <ysionneau@kalray.eu>
To: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Mark
 Rutland <mark.rutland@arm.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>, Eric
 Paris <eparis@redhat.com>, Christian Brauner <brauner@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jules Maselbas <jmaselbas@kalray.eu>,
 Yann Sionneau <ysionneau@kalray.eu>, Guillaume Thouvenin
 <gthouvenin@kalray.eu>, Clement Leger <clement@clement-leger.fr>, Vincent
 Chardon <vincent.chardon@elsys-design.com>, Marc =?utf-8?b?UG91bGhpw6hz?=
 <dkm@kataplop.net>, Julian Vetter <jvetter@kalray.eu>, Samuel Jones
 <sjones@kalray.eu>, Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis
 <tcostis@kalray.eu>, Marius Gligor <mgligor@kalray.eu>, Jonathan Borne
 <jborne@kalray.eu>, Julien Villette <jvillette@kalray.eu>, Luc Michel
 <lmichel@kalray.eu>, Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet
 <jhascoet@kalray.eu>, Jean-Christophe Pince <jcpince@gmail.com>, Guillaume
 Missonnier <gmissonnier@kalray.eu>, Alex Michon <amichon@kalray.eu>, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <git@xen0n.name>, Shaokun Zhang
 <zhangshaokun@hisilicon.com>, John Garry <john.garry@huawei.com>, Guangbin
 Huang <huangguangbin2@huawei.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Bibo Mao <maobibo@loongson.cn>, Atish Patra <atishp@atishpatra.org>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Qi Liu <liuqi115@huawei.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark
 Brown <broonie@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Alexey
 Dobriyan <adobriyan@gmail.com>
Subject: [RFC PATCH v2 27/31] kvx: Add kvx default config file
Date: Fri, 20 Jan 2023 15:09:58 +0100
Message-ID: <20230120141002.2442-28-ysionneau@kalray.eu>
In-Reply-To: <20230120141002.2442-1-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
MIME-Version: 1.0
X-ALTERMIMEV2_out: done
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Fri, 20 Jan 2023 19:02:49 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a default config file for kvx based Coolidge SoC.

Co-developed-by: Ashley Lesdalons <alesdalons@kalray.eu>
Signed-off-by: Ashley Lesdalons <alesdalons@kalray.eu>
Co-developed-by: Benjamin Mugnier <mugnier.benjamin@gmail.com>
Signed-off-by: Benjamin Mugnier <mugnier.benjamin@gmail.com>
Co-developed-by: Clement Leger <clement@clement-leger.fr>
Signed-off-by: Clement Leger <clement@clement-leger.fr>
Co-developed-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
Signed-off-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Co-developed-by: Julian Vetter <jvetter@kalray.eu>
Signed-off-by: Julian Vetter <jvetter@kalray.eu>
Co-developed-by: Samuel Jones <sjones@kalray.eu>
Signed-off-by: Samuel Jones <sjones@kalray.eu>
Co-developed-by: Thomas Costis <tcostis@kalray.eu>
Signed-off-by: Thomas Costis <tcostis@kalray.eu>
Co-developed-by: Vincent Chardon <vincent.chardon@elsys-design.com>
Signed-off-by: Vincent Chardon <vincent.chardon@elsys-design.com>
Co-developed-by: Yann Sionneau <ysionneau@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2: default_defconfig renamed to defconfig

 arch/kvx/configs/defconfig | 127 +++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 arch/kvx/configs/defconfig

diff --git a/arch/kvx/configs/defconfig b/arch/kvx/configs/defconfig
new file mode 100644
index 000000000000..960784da0b1b
--- /dev/null
+++ b/arch/kvx/configs/defconfig
@@ -0,0 +1,127 @@
+CONFIG_DEFAULT_HOSTNAME="KVXlinux"
+CONFIG_SERIAL_KVX_SCALL_COMM=y
+CONFIG_CONFIGFS_FS=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_DWARF4=y
+CONFIG_PRINTK_TIME=y
+CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
+CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
+CONFIG_PANIC_TIMEOUT=-1
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_GDB_SCRIPTS=y
+CONFIG_FRAME_POINTER=y
+CONFIG_HZ_100=y
+CONFIG_SERIAL_EARLYCON=y
+CONFIG_HOTPLUG_PCI_PCIE=y
+CONFIG_PCIEAER=y
+CONFIG_PCIE_DPC=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_8250_NR_UARTS=8
+CONFIG_SERIAL_8250_RUNTIME_UARTS=8
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_SINGLE=y
+CONFIG_POWER_RESET_KVX_SCALL_POWEROFF=y
+CONFIG_PCI=y
+CONFIG_PCI_MSI=y
+CONFIG_PCIE_KVX_NWL=y
+CONFIG_PCIEPORTBUS=y
+# CONFIG_PCIEASPM is not set
+CONFIG_PCIEAER_INJECT=y
+CONFIG_TMPFS=y
+CONFIG_DMADEVICES=y
+CONFIG_KVX_DMA_NOC=m
+CONFIG_KVX_IOMMU=y
+CONFIG_KVX_OTP_NV=y
+CONFIG_PACKET=y
+CONFIG_NET=y
+# CONFIG_WLAN is not set
+CONFIG_INET=y
+CONFIG_IPV6=y
+CONFIG_NETDEVICES=y
+CONFIG_NET_CORE=y
+CONFIG_E1000E=y
+CONFIG_BLK_DEV_NVME=y
+CONFIG_VFAT_FS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_WATCHDOG=y
+CONFIG_KVX_WATCHDOG=y
+CONFIG_HUGETLBFS=y
+CONFIG_MAILBOX=y
+CONFIG_KVX_MBOX=y
+CONFIG_REMOTEPROC=y
+CONFIG_KVX_REMOTEPROC=y
+CONFIG_VIRTIO_NET=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_RPMSG_VIRTIO=y
+CONFIG_RPMSG_CHAR=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_MODULE_SRCVERSION_ALL=y
+CONFIG_BLK_DEV=y
+CONFIG_BLK_DEV_LOOP=m
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+CONFIG_EXT4_FS=m
+CONFIG_EXT4_USE_FOR_EXT2=y
+CONFIG_SYSVIPC=y
+CONFIG_UNIX=y
+CONFIG_NET_VENDOR_KALRAY=y
+CONFIG_NET_KVX_SOC=m
+CONFIG_STACKPROTECTOR=y
+CONFIG_GPIO_DWAPB=y
+CONFIG_I2C=y
+CONFIG_I2C_SLAVE=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_I2C_DESIGNWARE_CORE=y
+CONFIG_I2C_DESIGNWARE_SLAVE=y
+CONFIG_I2C_SLAVE_USPACE=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_SPI=y
+CONFIG_SPI_DESIGNWARE=y
+CONFIG_SPI_DW_MMIO=y
+CONFIG_SPI_DW_KVX=y
+CONFIG_MTD=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_SQUASHFS=m
+CONFIG_USB=y
+CONFIG_USB_CONFIGFS=m
+CONFIG_USB_CONFIGFS_ACM=y
+CONFIG_USB_CONFIGFS_ECM=y
+CONFIG_USB_DWC2=y
+CONFIG_USB_DWC2_DUAL_ROLE=y
+CONFIG_USB_GADGET=y
+CONFIG_U_SERIAL_CONSOLE=y
+CONFIG_USB_USBNET=m
+CONFIG_USB_NET_SMSC95XX=m
+# CONFIG_NOP_USB_XCEIV is not set
+CONFIG_USB_PHY=y
+CONFIG_GENERIC_PHY=y
+CONFIG_GENERIC_PHY_USB=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_DWCMSHC=y
+CONFIG_MDIO_BITBANG=m
+CONFIG_MDIO_GPIO=m
+CONFIG_MARVELL_PHY=m
+CONFIG_GPIO_PCA953X=y
+CONFIG_NETFILTER=y
+CONFIG_NF_CONNTRACK=m
+CONFIG_NF_NAT=m
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_IP_NF_NAT=m
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_NETDEV=y
+CONFIG_LEDS_TRIGGER_PATTERN=y
+CONFIG_DCB=y
-- 
2.37.2





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

