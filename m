Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C1B192DE352
	for <lists+linux-audit@lfdr.de>; Fri, 18 Dec 2020 14:30:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-55VMrYL6O-KsPUlsPkfx5w-1; Fri, 18 Dec 2020 08:30:52 -0500
X-MC-Unique: 55VMrYL6O-KsPUlsPkfx5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B487B809DCC;
	Fri, 18 Dec 2020 13:30:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48D5019C59;
	Fri, 18 Dec 2020 13:30:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88A5618095C7;
	Fri, 18 Dec 2020 13:30:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BIDOO7P032146 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 08:24:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C30AAF18CE; Fri, 18 Dec 2020 13:24:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDDA9F11F7
	for <linux-audit@redhat.com>; Fri, 18 Dec 2020 13:24:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 349EA101042B
	for <linux-audit@redhat.com>; Fri, 18 Dec 2020 13:24:21 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-573-7E-VQxmPOhah0OWWOPSSRQ-1; Fri, 18 Dec 2020 08:24:18 -0500
X-MC-Unique: 7E-VQxmPOhah0OWWOPSSRQ-1
Received: from mail-pl1-f200.google.com ([209.85.214.200])
	by youngberry.canonical.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <andreas.hasenack@canonical.com>) id 1kqFk1-0000kX-Gr
	for Linux-audit@redhat.com; Fri, 18 Dec 2020 13:24:17 +0000
Received: by mail-pl1-f200.google.com with SMTP id q12so1586918plr.9
	for <Linux-audit@redhat.com>; Fri, 18 Dec 2020 05:24:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=0OMv+nbJs0zjtyQ4cx36DUzRHmunbEnen8eR+NurxBI=;
	b=H65j1erok4IUOYa+IFnK3Ncsby4ic56ngnfdiSEJHKBOKY25X5mRNKpRN1Ui7KMeDk
	5V3+8GrQu4v9E2WBIR2jxPQBBNvQDnYTO/A1cz3otcfOJ8Qj+Qg1JVymsO/wAw0fVrMM
	npT6oud+Gc6imwsPe4QZmd37r4MQPCwKY1SsD+fmRUHTIno4TgEpdHmODgP9JpEiZ6AJ
	poTN+9LkAvAPgboQH5ImkYmpNCiuYwRsVTeMuLmkk+g4LHs4Qr8ue1Mx5qONiM2nYRHS
	tgZAafVgqVvNrBRzotga5kM1vckTXfbDADNYpqCu3EycP97SFa+flygCJVJSTrmgmSFO
	S+wg==
X-Gm-Message-State: AOAM531UWUMiCu43p3/unchVudyFWgGvLjGYrBB/e18o4EhDMhjwkMMO
	llBbKUDabpddtjIhkW6BJK2IrgqTBSEWIA5uGImk6GZFxgkj5GB8eglUM/Eatcokym33lmpYb/a
	0wsPQTCZDKsX7leBavymfJvNZ20Xj4Ij+XTYIKNo1dVnToa0NyA==
X-Received: by 2002:a62:6456:0:b029:1a1:e39e:cb46 with SMTP id
	y83-20020a6264560000b02901a1e39ecb46mr4330584pfb.0.1608297855837;
	Fri, 18 Dec 2020 05:24:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfxt8ske+MFeEQ1Tsk/JpMOQl7nDzdakdoOaEKdmgochpugEAXncepyhhvGRxvYKfLA7gA7VUaFPvE8gAGEBM=
X-Received: by 2002:a62:6456:0:b029:1a1:e39e:cb46 with SMTP id
	y83-20020a6264560000b02901a1e39ecb46mr4330566pfb.0.1608297855538;
	Fri, 18 Dec 2020 05:24:15 -0800 (PST)
MIME-Version: 1.0
From: Andreas Hasenack <andreas@canonical.com>
Date: Fri, 18 Dec 2020 10:24:04 -0300
Message-ID: <CANYNYEEfJGivaVCmBcRHisVOOQDLDQ5qjthO3ZA6niO28mT=7Q@mail.gmail.com>
Subject: "key=" on all related log lines
To: Linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I use the -k "sometext" parameter in my audit rules, to help analyze
the logs. I noticed that it's only added to one of the log lines, not
the others, but the tools (ausearch, aureport) find the other related
entries nevertheless.

For example:

-w /etc/shadow -p wa -k shadow-file-changed

After a "# touch /etc/shadow" I get:
type=SYSCALL msg=audit(1608297571.005:160): arch=c000003e syscall=257
success=yes exit=3 a0=ffffff9c a1=7ffedcecb865 a2=941 a3=1b6 items=2
ppid=1623 pid=2382 auid=1000 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0
sgid=0 fsgid=0 tty=pts1 ses=1 comm="touch" exe="/bin/touch"
key="shadow-file-changed"
type=CWD msg=audit(1608297571.005:160): cwd="/root"
type=PATH msg=audit(1608297571.005:160): item=0 name="/etc/" inode=206
dev=fc:01 mode=040755 ouid=0 ogid=0 rdev=00:00 nametype=PARENT
cap_fp=0000000000000000 cap_fi=0000000000000000 cap_fe=0 cap_fver=0
type=PATH msg=audit(1608297571.005:160): item=1 name="/etc/shadow"
inode=64013 dev=fc:01 mode=0100640 ouid=0 ogid=42 rdev=00:00
nametype=NORMAL cap_fp=0000000000000000 cap_fi=0000000000000000
cap_fe=0 cap_fver=0
type=PROCTITLE msg=audit(1608297571.005:160):
proctitle=746F756368002F6574632F736861646F77

But only the first line has my key. Are the other entries correlated
via the id in "audit(id)"? Is there a way to have the key parameter
attached to all of them? I'd like to send to a remote log server only
certain events, and if I filter by key, I only get one of these log
lines.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

