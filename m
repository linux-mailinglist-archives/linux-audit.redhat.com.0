Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8642D2B9AD4
	for <lists+linux-audit@lfdr.de>; Thu, 19 Nov 2020 19:44:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-jN-sucm9M9utJMeJxdycig-1; Thu, 19 Nov 2020 13:44:19 -0500
X-MC-Unique: jN-sucm9M9utJMeJxdycig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA54A1868411;
	Thu, 19 Nov 2020 18:44:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2CD5100238C;
	Thu, 19 Nov 2020 18:44:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FDC618095C9;
	Thu, 19 Nov 2020 18:44:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AJIhso1028295 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 19 Nov 2020 13:43:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 28F252166B2B; Thu, 19 Nov 2020 18:43:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 240CA2166B29
	for <linux-audit@redhat.com>; Thu, 19 Nov 2020 18:43:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1B4C103B81B
	for <linux-audit@redhat.com>; Thu, 19 Nov 2020 18:43:51 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-582-6yuSx-zjNkObg2bj0JLE5w-1; Thu, 19 Nov 2020 13:43:49 -0500
X-MC-Unique: 6yuSx-zjNkObg2bj0JLE5w-1
Received: from mail-pl1-f200.google.com ([209.85.214.200])
	by youngberry.canonical.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <andreas.hasenack@canonical.com>) id 1kfouK-0007BY-61
	for Linux-audit@redhat.com; Thu, 19 Nov 2020 18:43:48 +0000
Received: by mail-pl1-f200.google.com with SMTP id n10so4471459plk.14
	for <Linux-audit@redhat.com>; Thu, 19 Nov 2020 10:43:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=KOUgTCcry3TX4A+F9a7mdOckOfGx25O8DEkzzBgGu7Q=;
	b=XQSSO6kBaPGP6Tk/eV0BlHriUBYeqWxYyTcCKivF5DVrzNSuTqtp4vT3ZcSKvNGcfk
	pzGs6inxVcLlC6DPanajAAyaCDkYMREd2QulK1OBjFHja1ao9b2Jy4PvzYANrb8MWO1s
	f1Gp4cotGh+gXytojuKalCifl46/OQI5qNiZZ4EhlBH7/zUvNi6xSMLdi/bvawIQ4eJf
	Rhw5AJciNSVWmzBTRIDSnGH5yci7eOsiunOw+BbUXH10Xws2UvEOTREvUkPk5ZdDOGr/
	jAGPoiN+w5MYlhqvV9lTTKQxjPcbPaf3Ni4WwGuSDuYEvQGwEfS1siSkh5isCf4qyEl0
	n72A==
X-Gm-Message-State: AOAM531aTFD7GDh6p/62TCFLOyy3jEATJ8tgGnVzl6Z/XWU1xA0V/XGi
	n6yvLTM9RWMJgoriE0yPjDTP8NztLxBC8hkrpbboV7H0jEX8Kxy4iz49zcSFMgJGp7tE3JJbFMu
	GOYo7pTXqyQtmoK3JNjJI7iLwm9Id3BNMbB+V6PEd7Qq+qn0QcQ==
X-Received: by 2002:a17:90b:4b02:: with SMTP id
	lx2mr6050637pjb.49.1605811426499; 
	Thu, 19 Nov 2020 10:43:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0J2ar/W4NM515zBWHbqzqUX5anrWbGopQLRnEef+xAEPXTTWco4f3EafhydXbHHjhl8+EbNTgZo3oDWs/6VQ=
X-Received: by 2002:a17:90b:4b02:: with SMTP id
	lx2mr6050605pjb.49.1605811426100; 
	Thu, 19 Nov 2020 10:43:46 -0800 (PST)
MIME-Version: 1.0
From: Andreas Hasenack <andreas@canonical.com>
Date: Thu, 19 Nov 2020 15:43:34 -0300
Message-ID: <CANYNYEEYUsU8BGj7E+=T=jyrkxVn1x60qipf8rvk1Oi6DPquyg@mail.gmail.com>
Subject: -a never,exit still being logged
To: Linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

continuing my experiments in trying to reduce the auditd noise, I have
these two rules:

# auditctl -l
-a never,exit -F arch=b64 -S setsockopt -F a2=0x40 -F
exe=/sbin/iptables -F auid=-1
-a never,exit -F arch=b64 -S setsockopt -F a2=0x40 -F
exe=/sbin/xtables-multi -F auid=-1

I did use -F auid=4294967295 in the rules file, and auditd seems to
have understood that correctly as it's showing -1 in the rules list.

But this event is still being logged:
type=NETFILTER_CFG msg=audit(1605810940.198:1089): table=filter
family=2 entries=281
type=SYSCALL msg=audit(1605810940.198:1089): arch=c00000b7 syscall=208
success=yes exit=0 a0=4 a1=0 a2=40 a3=aaaaf478e680 items=0 ppid=7950
pid=31235 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0
sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="iptables-restor"
exe="/sbin/xtables-multi" key=(null)
type=PROCTITLE msg=audit(1605810940.198:1089):
proctitle=69707461626C65732D726573746F7265002D2D6E6F666C757368002D2D766572626F7365002D2D77616974003130002D2D776169742D696E74657276616C003530303030

Same event, decoded with ausearch -i:
----
type=PROCTITLE msg=audit(11/19/20 18:35:40.198:1089) :
proctitle=iptables-restore --noflush --verbose --wait 10
--wait-interval 50000
type=SYSCALL msg=audit(11/19/20 18:35:40.198:1089) : arch=aarch64
syscall=setsockopt success=yes exit=0 a0=0x4 a1=ip
a2=IPT_SO_SET_REPLACE a3=0xaaaaf478e680 items=0 ppid=7950 pid=31235
auid=unset uid=root gid=root euid=root suid=root fsuid=root egid=root
sgid=root fsgid=root tty=(none) ses=unset comm=iptables-restor
exe=/sbin/xtables-multi key=(null)
type=NETFILTER_CFG msg=audit(11/19/20 18:35:40.198:1089) :
table=filter family=ipv4 entries=281
----

Why is it being logged, given that it matches the second (and last) rule I have?

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

