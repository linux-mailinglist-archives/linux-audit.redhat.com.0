Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 70C7222609D
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jul 2020 15:18:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-c8gYhkUmMxW3iMMffjGs-w-1; Mon, 20 Jul 2020 09:18:44 -0400
X-MC-Unique: c8gYhkUmMxW3iMMffjGs-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD95718C63C9;
	Mon, 20 Jul 2020 13:18:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FE465C5FA;
	Mon, 20 Jul 2020 13:18:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58A521800FEA;
	Mon, 20 Jul 2020 13:18:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06IIeobf024148 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 18 Jul 2020 14:40:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8BCEDF7FD2; Sat, 18 Jul 2020 18:40:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86CADF8827
	for <linux-audit@redhat.com>; Sat, 18 Jul 2020 18:40:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E4E192490D
	for <linux-audit@redhat.com>; Sat, 18 Jul 2020 18:40:47 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-73-8ahBtXoGNeG7Wm8q1CoWag-1; Sat, 18 Jul 2020 14:40:44 -0400
X-MC-Unique: 8ahBtXoGNeG7Wm8q1CoWag-1
Received: by mail-wm1-f68.google.com with SMTP id g10so9183971wmc.1;
	Sat, 18 Jul 2020 11:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:autocrypt:cc:subject:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=j8zbai4IyhmNoQ3eaEKwt8LkEUp/ry7GiPK092DgEF8=;
	b=BjEqopx0hfG2D53cubzu94y6DGxQAYpMshs41q5Qbvs8AxOOkF8ZcAN3LYpKPOlWVI
	aWGGuRpuaN78W9QCRpg7prR3BDdOH8MePcpbk/k7wEMZPh+dqCon+e6kqCJRfor4xJkN
	XWh3GHUm563VFh5yvcFBSLgoQe4J7PgBvj3EWfP5I6Juafqyq8zuvL/+dwObH2JDaLrU
	iNplWE0RvtJOfE9vqzpOXOPXgdBeVhi1jSnSZia3+BVPlODoBFpgcbUWyhAuwBlQAXye
	CVCJTJv96lpn2A8kQ57DsD/h4KSlxOi9xbLeaT0WesB7sigLANyr+YLCX3TsgZwCPxPB
	mJ+A==
X-Gm-Message-State: AOAM532ekcAmLSyVv0vPy4DGWOR3Cjft9ZI7rB13J3Ln9WFqd1cGbssm
	XDms5EYRksycFvuJZs6EysyZK0GU
X-Google-Smtp-Source: ABdhPJz2S4qw0UtsZs+lQ0EiXRqC6nTA4e5m6p18+CJzUBsv7JfLUCo9Zm+LBpRaCpoH1s5wa9fjhg==
X-Received: by 2002:a7b:c18f:: with SMTP id y15mr14900677wmi.85.1595097642895; 
	Sat, 18 Jul 2020 11:40:42 -0700 (PDT)
Received: from ?IPv6:2a02:810d:4bc0:8098:a226:5056:b008:9621?
	([2a02:810d:4bc0:8098:a226:5056:b008:9621])
	by smtp.gmail.com with ESMTPSA id
	69sm22410663wma.16.2020.07.18.11.40.41
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 18 Jul 2020 11:40:42 -0700 (PDT)
From: bauen1 <j2468h@googlemail.com>
X-Google-Original-From: bauen1 <j2468h@gmail.com>
To: linux-audit@redhat.com
Autocrypt: addr=j2468h@gmail.com; keydata=
	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
	MzTZEAm15uwFxq66
Subject: null pointer dereference regression in 5.7
Message-ID: <9c8f1fc6-2b8e-e9e3-37bf-2d1d6bedace1@gmail.com>
Date: Sat, 18 Jul 2020 20:40:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06IIeobf024148
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 20 Jul 2020 09:18:19 -0400
Cc: Dominick Grift <dominick.grift@defensec.nl>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,
After upgrading from linux 5.6 to 5.7 on my debian machines with selinux I've started seeing this null pointer dereference in the audit system. I've included shortened logs for 5.6 without the error and from 5.7 with the error from my laptop. I've also seen it happen in a VM and a server, but don't have the logs anymore. Grift was able to reproduced (presumably) the same issue on fedora with 5.8-rc4.

Steps to reproduce:
Write an selinux policy with a domain for systemd-user-runtime-dir and audit all permissions of the dir class. E.g. `(auditallow systemd_user_runtime_dir_t all_types (dir (all)))`
Switch to permissive mode.
Create a new user and login, log out and wait a few seconds for systemd to stop user-runtime-dir@<uid>.service

I believe this issue was made visible by 1320a4052ea11eb2879eb7361da15a106a780972.
Now a AUDIT_PATH event is also generated by default and systemd-user-runtime-dir is making syscalls that audit_log_name can't handle.

I hope this is enough info to find the root cause.
- bauen1

Log without crash (5.6):

Jul 18 14:26:36 jh-mba kernel: Linux version 5.6.0-2-amd64 (debian-kernel@lists.debian.org) (gcc version 9.3.0 (Debian 9.3.0-13)) #1 SMP Debian 5.6.14-2 (2020-06-09)
Jul 18 14:27:53 jh-mba audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=user@1001 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jul 18 14:27:53 jh-mba systemd[1]: Stopping User Runtime Directory /run/user/1001...
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { read } for  pid=3178 comm="systemd-user-ru" name="dconf" dev="tmpfs" ino=41325 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { open } for  pid=3178 comm="systemd-user-ru" path="/run/user/1001/dconf" dev="tmpfs" ino=41325 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { getattr } for  pid=3178 comm="systemd-user-ru" path="/run/user/1001/dconf" dev="tmpfs" ino=41325 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { search } for  pid=3178 comm="systemd-user-ru" name="dconf" dev="tmpfs" ino=41325 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { write } for  pid=3178 comm="systemd-user-ru" name="dconf" dev="tmpfs" ino=41325 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { remove_name } for  pid=3178 comm="systemd-user-ru" name="user" dev="tmpfs" ino=41326 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { unlink } for  pid=3178 comm="systemd-user-ru" name="user" dev="tmpfs" ino=41326 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=file permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { rmdir } for  pid=3178 comm="systemd-user-ru" name="dconf" dev="tmpfs" ino=41325 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { read } for  pid=3178 comm="systemd-user-ru" name="gvfs" dev="tmpfs" ino=42315 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:user_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { open } for  pid=3178 comm="systemd-user-ru" path="/run/user/1001/gvfs" dev="tmpfs" ino=42315 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:user_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { getattr } for  pid=3178 comm="systemd-user-ru" path="/run/user/1001/gvfs" dev="tmpfs" ino=42315 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:user_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { rmdir } for  pid=3178 comm="systemd-user-ru" name="gvfs" dev="tmpfs" ino=42315 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:user_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { read } for  pid=3178 comm="systemd-user-ru" name="dbus-1" dev="tmpfs" ino=39557 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:session_dbusd_runtime_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { open } for  pid=3178 comm="systemd-user-ru" path="/run/user/1001/dbus-1" dev="tmpfs" ino=39557 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:session_dbusd_runtime_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { getattr } for  pid=3178 comm="systemd-user-ru" path="/run/user/1001/dbus-1" dev="tmpfs" ino=39557 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:session_dbusd_runtime_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { search } for  pid=3178 comm="systemd-user-ru" name="dbus-1" dev="tmpfs" ino=39557 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:session_dbusd_runtime_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { write } for  pid=3178 comm="systemd-user-ru" name="dbus-1" dev="tmpfs" ino=39557 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:session_dbusd_runtime_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { remove_name } for  pid=3178 comm="systemd-user-ru" name="services" dev="tmpfs" ino=39558 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:session_dbusd_runtime_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { rmdir } for  pid=3178 comm="systemd-user-ru" name="services" dev="tmpfs" ino=39558 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:session_dbusd_runtime_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { open } for  pid=3178 comm="systemd-user-ru" path="/run/user/1001/pulse" dev="tmpfs" ino=41258 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:pulseaudio_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { getattr } for  pid=3178 comm="systemd-user-ru" path="/run/user/1001/pulse" dev="tmpfs" ino=41258 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:pulseaudio_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { search } for  pid=3178 comm="systemd-user-ru" name="pulse" dev="tmpfs" ino=41258 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:pulseaudio_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { write } for  pid=3178 comm="systemd-user-ru" name="pulse" dev="tmpfs" ino=41258 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:pulseaudio_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { remove_name } for  pid=3178 comm="systemd-user-ru" name="native" dev="tmpfs" ino=41259 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:pulseaudio_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { unlink } for  pid=3178 comm="systemd-user-ru" name="native" dev="tmpfs" ino=41259 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:pulseaudio_tmp_t:s0 tclass=sock_file permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { rmdir } for  pid=3178 comm="systemd-user-ru" name="pulse" dev="tmpfs" ino=41258 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:pulseaudio_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { unlink } for  pid=3178 comm="systemd-user-ru" name="bus" dev="tmpfs" ino=41239 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:session_dbusd_runtime_t:s0 tclass=sock_file permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { read } for  pid=3178 comm="systemd-user-ru" name="gnupg" dev="tmpfs" ino=42225 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:dirmngr_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { open } for  pid=3178 comm="systemd-user-ru" path="/run/user/1001/gnupg" dev="tmpfs" ino=42225 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:dirmngr_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { getattr } for  pid=3178 comm="systemd-user-ru" path="/run/user/1001/gnupg" dev="tmpfs" ino=42225 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:dirmngr_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { search } for  pid=3178 comm="systemd-user-ru" name="gnupg" dev="tmpfs" ino=42225 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:dirmngr_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { write } for  pid=3178 comm="systemd-user-ru" name="gnupg" dev="tmpfs" ino=42225 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:dirmngr_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { remove_name } for  pid=3178 comm="systemd-user-ru" name="S.gpg-agent" dev="tmpfs" ino=41252 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:dirmngr_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { unlink } for  pid=3178 comm="systemd-user-ru" name="S.gpg-agent" dev="tmpfs" ino=41252 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:dirmngr_tmp_t:s0 tclass=sock_file permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { rmdir } for  pid=3178 comm="systemd-user-ru" name="gnupg" dev="tmpfs" ino=42225 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:dirmngr_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { open } for  pid=3178 comm="systemd-user-ru" path="/run/user/1001/systemd" dev="tmpfs" ino=39472 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:systemd_user_runtime_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { getattr } for  pid=3178 comm="systemd-user-ru" path="/run/user/1001/systemd" dev="tmpfs" ino=39472 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:systemd_user_runtime_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { search } for  pid=3178 comm="systemd-user-ru" name="systemd" dev="tmpfs" ino=39472 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:systemd_user_runtime_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { write } for  pid=3178 comm="systemd-user-ru" name="systemd" dev="tmpfs" ino=39472 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:systemd_user_runtime_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { remove_name } for  pid=3178 comm="systemd-user-ru" name="private" dev="tmpfs" ino=41230 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:systemd_user_runtime_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { unlink } for  pid=3178 comm="systemd-user-ru" name="private" dev="tmpfs" ino=41230 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:systemd_user_runtime_t:s0 tclass=sock_file permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { unlink } for  pid=3178 comm="systemd-user-ru" name="notify" dev="tmpfs" ino=41226 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:systemd_user_runtime_notify_t:s0 tclass=sock_file permissive=1
Jul 18 14:27:53 jh-mba audit[3178]: AVC avc:  denied  { rmdir } for  pid=3178 comm="systemd-user-ru" name="units" dev="tmpfs" ino=39473 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:systemd_user_runtime_t:s0 tclass=dir permissive=1
Jul 18 14:27:53 jh-mba systemd[2501]: run-user-1001.mount: Succeeded.
Jul 18 14:27:53 jh-mba systemd[1]: run-user-1001.mount: Succeeded.
Jul 18 14:27:53 jh-mba systemd[2839]: run-user-1001.mount: Succeeded.
Jul 18 14:27:53 jh-mba systemd[1]: user-runtime-dir@1001.service: Succeeded.
Jul 18 14:27:53 jh-mba systemd[1]: Stopped User Runtime Directory /run/user/1001.


Log with crash (5.7):

Jul 18 14:30:09 jh-mba kernel: Linux version 5.7.0-1-amd64 (debian-kernel@lists.debian.org) (gcc version 9.3.0 (Debian 9.3.0-14), GNU ld (GNU Binutils for Debian) 2.34) #1 SMP Debian 5.7.6-1 (2020-06-24)
Jul 18 14:35:10 jh-mba audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=user@1001 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
Jul 18 14:35:10 jh-mba systemd[1]: Stopping User Runtime Directory /run/user/1001...
Jul 18 14:35:10 jh-mba audit[3163]: AVC avc:  denied  { read } for  pid=3163 comm="systemd-user-ru" name="dconf" dev="tmpfs" ino=39541 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:35:10 jh-mba audit[3163]: AVC avc:  denied  { open } for  pid=3163 comm="systemd-user-ru" path="/run/user/1001/dconf" dev="tmpfs" ino=39541 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:35:10 jh-mba audit[3163]: SYSCALL arch=c000003e syscall=257 success=yes exit=4 a0=3 a1=55edb4e41073 a2=f0800 a3=0 items=0 ppid=1 pid=3163 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="systemd-user-ru" exe="/usr/lib/systemd/systemd-user-runtime-dir" subj=system_u:system_r:systemd_user_runtime_dir_t:s0 key=(null)
Jul 18 14:35:10 jh-mba audit: PROCTITLE proctitle=2F6C69622F73797374656D642F73797374656D642D757365722D72756E74696D652D6469720073746F700031303031
Jul 18 14:35:10 jh-mba audit[3163]: AVC avc:  denied  { getattr } for  pid=3163 comm="systemd-user-ru" path="/run/user/1001/dconf" dev="tmpfs" ino=39541 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:35:10 jh-mba audit[3163]: SYSCALL arch=c000003e syscall=5 success=yes exit=0 a0=4 a1=7fff95e523b0 a2=7fff95e523b0 a3=7fff95e52414 items=0 ppid=1 pid=3163 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="systemd-user-ru" exe="/usr/lib/systemd/systemd-user-runtime-dir" subj=system_u:system_r:systemd_user_runtime_dir_t:s0 key=(null)
Jul 18 14:35:10 jh-mba audit: PROCTITLE proctitle=2F6C69622F73797374656D642F73797374656D642D757365722D72756E74696D652D6469720073746F700031303031
Jul 18 14:35:10 jh-mba audit[3163]: AVC avc:  denied  { search } for  pid=3163 comm="systemd-user-ru" name="dconf" dev="tmpfs" ino=39541 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:35:10 jh-mba audit[3163]: AVC avc:  denied  { write } for  pid=3163 comm="systemd-user-ru" name="dconf" dev="tmpfs" ino=39541 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:35:10 jh-mba audit[3163]: AVC avc:  denied  { remove_name } for  pid=3163 comm="systemd-user-ru" name="user" dev="tmpfs" ino=39542 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=dir permissive=1
Jul 18 14:35:10 jh-mba audit[3163]: AVC avc:  denied  { unlink } for  pid=3163 comm="systemd-user-ru" name="user" dev="tmpfs" ino=39542 scontext=system_u:system_r:systemd_user_runtime_dir_t:s0 tcontext=user_u:object_r:gconf_tmp_t:s0 tclass=file permissive=1
Jul 18 14:35:10 jh-mba audit[3163]: SYSCALL arch=c000003e syscall=263 success=yes exit=0 a0=4 a1=55edb4e490b3 a2=0 a3=4 items=2 ppid=1 pid=3163 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="systemd-user-ru" exe="/usr/lib/systemd/systemd-user-runtime-dir" subj=system_u:system_r:systemd_user_runtime_dir_t:s0 key=(null)
Jul 18 14:35:10 jh-mba kernel: BUG: kernel NULL pointer dereference, address: 0000000000000060
Jul 18 14:35:10 jh-mba kernel: #PF: supervisor read access in kernel mode
Jul 18 14:35:10 jh-mba kernel: #PF: error_code(0x0000) - not-present page
Jul 18 14:35:11 jh-mba kernel: PGD 0 P4D 0
Jul 18 14:35:11 jh-mba kernel: Oops: 0000 [#1] SMP PTI
Jul 18 14:35:11 jh-mba kernel: CPU: 1 PID: 3163 Comm: systemd-user-ru Tainted: P           OE     5.7.0-1-amd64 #1 Debian 5.7.6-1
Jul 18 14:35:11 jh-mba kernel: Hardware name: Apple Inc. MacBookAir6,2/Mac-7DF21CB3ED6977E5, BIOS 110.0.0.0.0 09/17/2018
Jul 18 14:35:11 jh-mba kernel: RIP: 0010:d_path+0x35/0x140
Jul 18 14:35:11 jh-mba kernel: Code: 49 89 fc 48 83 ec 28 48 8b 7f 08 89 54 24 04 65 48 8b 04 25 28 00 00 00 48 89 44 24 20 31 c0 48 63 c2 48 01 f0 48 89 44 24 08 <48> 8b 47 60 48 85 c0 74 22 48 8b 40 48 48 85 c0 74 19 48 3b 7f 18
Jul 18 14:35:11 jh-mba kernel: RSP: 0018:ffffb71e411cfe18 EFLAGS: 00010282
Jul 18 14:35:11 jh-mba kernel: RAX: ffff9a525f18700b RBX: ffff9a524fc52060 RCX: 00000000000004dd
Jul 18 14:35:11 jh-mba kernel: RDX: 000000000000100b RSI: ffff9a525f186000 RDI: 0000000000000000
Jul 18 14:35:11 jh-mba kernel: RBP: ffffb71e411cfe48 R08: ffff9a52672b0060 R09: 0000000000000006
Jul 18 14:35:11 jh-mba kernel: R10: ffff9a522c99e6c0 R11: ffff9a532c99e030 R12: ffff9a524fc522b0
Jul 18 14:35:11 jh-mba kernel: R13: ffff9a52658d3708 R14: ffff9a524fc52000 R15: 0000000000000000
Jul 18 14:35:11 jh-mba kernel: FS:  00007ff68934e980(0000) GS:ffff9a5267280000(0000) knlGS:0000000000000000
Jul 18 14:35:11 jh-mba kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jul 18 14:35:11 jh-mba kernel: CR2: 0000000000000060 CR3: 0000000226ce6002 CR4: 00000000001606e0
Jul 18 14:35:11 jh-mba kernel: Call Trace:
Jul 18 14:35:11 jh-mba kernel:  audit_log_d_path+0x75/0xd0
Jul 18 14:35:11 jh-mba kernel:  audit_log_exit+0x63d/0xcf0
Jul 18 14:35:11 jh-mba kernel:  ? audit_filter_inodes+0x2e/0x100
Jul 18 14:35:11 jh-mba kernel:  __audit_syscall_exit+0x23b/0x2a0
Jul 18 14:35:11 jh-mba kernel:  syscall_slow_exit_work+0x117/0x140
Jul 18 14:35:11 jh-mba kernel:  do_syscall_64+0x10e/0x180
Jul 18 14:35:11 jh-mba kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Jul 18 14:35:11 jh-mba kernel: RIP: 0033:0x7ff689f8eb67
Jul 18 14:35:11 jh-mba kernel: Code: 73 01 c3 48 8b 0d 29 d3 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 07 01 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f9 d2 0c 00 f7 d8 64 89 01 48
Jul 18 14:35:11 jh-mba kernel: RSP: 002b:00007fff95e52468 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
Jul 18 14:35:11 jh-mba kernel: RAX: 0000000000000000 RBX: 00007ff68934e830 RCX: 00007ff689f8eb67
Jul 18 14:35:11 jh-mba kernel: RDX: 0000000000000000 RSI: 000055edb4e490b3 RDI: 0000000000000004
Jul 18 14:35:11 jh-mba kernel: RBP: 0000000000000004 R08: 000055edb4e490a0 R09: 00007ff68a05cbe0
Jul 18 14:35:11 jh-mba kernel: R10: 0000000000000004 R11: 0000000000000246 R12: 000055edb4e49040
Jul 18 14:35:11 jh-mba kernel: R13: 0000000000000000 R14: 000055edb4e490a0 R15: 000055edb4e490b3
Jul 18 14:35:11 jh-mba kernel: Modules linked in: rfcomm bnep xt_CHECKSUM cpufreq_powersave xt_MASQUERADE cpufreq_conservative cpufreq_userspace xt_tcpudp nft_compat bridge stp llc overlay fuse nft_chain_nat nf_nat nf_log_ipv6 nf_log_ipv4 nf_log_common nft_log veth intel_rapl_msr btusb btrtl btbcm joydev binfmt_misc btintel nls_ascii nls_cp437 vfat fat bluetooth nft_counter drbg intel_rapl_common asix ansi_cprng ecdh_generic usbnet ecc mii vrf libphy x86_pkg_temp_thermal intel_powerclamp applesmc snd_hda_codec_hdmi snd_hda_codec_cirrus snd_hda_codec_generic coretemp ledtrig_audio evdev wireguard kvm_intel curve25519_x86_64 libcurve25519_generic libchacha20poly1305 snd_hda_intel kvm bcm5974 wl(POE) snd_intel_dspcfg chacha_x86_64 poly1305_x86_64 ip6_udp_tunnel efi_pstore udp_tunnel irqbypass snd_hda_codec libblake2s cfg80211 intel_cstate snd_hda_core blake2s_x86_64 libblake2s_generic libchacha snd_hwdep intel_uncore iTCO_wdt i915 iTCO_vendor_support intel_rapl_perf snd_pcm nft_ct sg ef
 ivars pcspkr nf_conntrack
Jul 18 14:35:11 jh-mba kernel:  watchdog rfkill snd_timer nf_defrag_ipv6 nf_defrag_ipv4 drm_kms_helper mei_me snd mei cec soundcore i2c_algo_bit sbs sbshc acpi_als kfifo_buf industrialio apple_bl ac button bonding nf_tables parport_pc(E) nfnetlink ppdev(E) lp(E) drm parport(E) sunrpc efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 btrfs blake2b_generic zstd_decompress zstd_compress hid_apple hid_generic usbhid hid dm_crypt dm_mod raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod uas usb_storage sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_pclmul crct10dif_common crc32_pclmul crc32c_intel ghash_clmulni_intel ahci libahci xhci_pci aesni_intel xhci_hcd libaes crypto_simd libata cryptd glue_helper usbcore scsi_mod i2c_i801 thunderbolt lpc_ich mfd_core usb_common spi_pxa2xx_platform dw_dmac video dw_dmac_core
Jul 18 14:35:11 jh-mba kernel: CR2: 0000000000000060
Jul 18 14:35:11 jh-mba kernel: ---[ end trace 01b46d19ab2d30bf ]---
Jul 18 14:35:11 jh-mba kernel: RIP: 0010:d_path+0x35/0x140
Jul 18 14:35:11 jh-mba kernel: Code: 49 89 fc 48 83 ec 28 48 8b 7f 08 89 54 24 04 65 48 8b 04 25 28 00 00 00 48 89 44 24 20 31 c0 48 63 c2 48 01 f0 48 89 44 24 08 <48> 8b 47 60 48 85 c0 74 22 48 8b 40 48 48 85 c0 74 19 48 3b 7f 18
Jul 18 14:35:11 jh-mba kernel: RSP: 0018:ffffb71e411cfe18 EFLAGS: 00010282
Jul 18 14:35:11 jh-mba kernel: RAX: ffff9a525f18700b RBX: ffff9a524fc52060 RCX: 00000000000004dd
Jul 18 14:35:11 jh-mba kernel: RDX: 000000000000100b RSI: ffff9a525f186000 RDI: 0000000000000000
Jul 18 14:35:11 jh-mba kernel: RBP: ffffb71e411cfe48 R08: ffff9a52672b0060 R09: 0000000000000006
Jul 18 14:35:11 jh-mba kernel: R10: ffff9a522c99e6c0 R11: ffff9a532c99e030 R12: ffff9a524fc522b0
Jul 18 14:35:11 jh-mba kernel: R13: ffff9a52658d3708 R14: ffff9a524fc52000 R15: 0000000000000000
Jul 18 14:35:11 jh-mba kernel: FS:  00007ff68934e980(0000) GS:ffff9a5267280000(0000) knlGS:0000000000000000
Jul 18 14:35:11 jh-mba kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jul 18 14:35:11 jh-mba kernel: CR2: 0000000000000060 CR3: 0000000226ce6002 CR4: 00000000001606e0
Jul 18 14:35:11 jh-mba kernel: BUG: kernel NULL pointer dereference, address: 0000000000000060
Jul 18 14:35:11 jh-mba kernel: #PF: supervisor read access in kernel mode
Jul 18 14:35:12 jh-mba kernel: #PF: error_code(0x0000) - not-present page
Jul 18 14:35:13 jh-mba kernel: PGD 0 P4D 0
Jul 18 14:35:13 jh-mba kernel: Oops: 0000 [#2] SMP PTI
Jul 18 14:35:13 jh-mba kernel: CPU: 1 PID: 3163 Comm: systemd-user-ru Tainted: P      D    OE     5.7.0-1-amd64 #1 Debian 5.7.6-1
Jul 18 14:35:13 jh-mba kernel: Hardware name: Apple Inc. MacBookAir6,2/Mac-7DF21CB3ED6977E5, BIOS 110.0.0.0.0 09/17/2018
Jul 18 14:35:13 jh-mba kernel: RIP: 0010:d_path+0x35/0x140
Jul 18 14:35:13 jh-mba kernel: Code: 49 89 fc 48 83 ec 28 48 8b 7f 08 89 54 24 04 65 48 8b 04 25 28 00 00 00 48 89 44 24 20 31 c0 48 63 c2 48 01 f0 48 89 44 24 08 <48> 8b 47 60 48 85 c0 74 22 48 8b 40 48 48 85 c0 74 19 48 3b 7f 18
Jul 18 14:35:13 jh-mba kernel: RSP: 0018:ffffb71e411cfde0 EFLAGS: 00010282
Jul 18 14:35:13 jh-mba kernel: RAX: ffff9a525f18500b RBX: ffff9a524fc52060 RCX: 00000000000004e0
Jul 18 14:35:13 jh-mba kernel: RDX: 000000000000100b RSI: ffff9a525f184000 RDI: 0000000000000000
Jul 18 14:35:13 jh-mba kernel: RBP: ffffb71e411cfe10 R08: ffff9a52672b0060 R09: 0000000000000006
Jul 18 14:35:13 jh-mba kernel: R10: ffff9a522c99cec0 R11: ffff9a532c99c830 R12: ffff9a524fc522b0
Jul 18 14:35:13 jh-mba kernel: R13: ffff9a52658d35e8 R14: ffff9a524fc52000 R15: 0000000000000000
Jul 18 14:35:13 jh-mba kernel: FS:  00007ff68934e980(0000) GS:ffff9a5267280000(0000) knlGS:0000000000000000
Jul 18 14:35:13 jh-mba kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jul 18 14:35:13 jh-mba kernel: CR2: 0000000000000060 CR3: 0000000226ce6002 CR4: 00000000001606e0
Jul 18 14:35:13 jh-mba kernel: Call Trace:
Jul 18 14:35:13 jh-mba kernel:  audit_log_d_path+0x75/0xd0
Jul 18 14:35:13 jh-mba kernel:  audit_log_exit+0x63d/0xcf0
Jul 18 14:35:13 jh-mba kernel:  ? audit_log_d_path+0x75/0xd0
Jul 18 14:35:13 jh-mba kernel:  ? audit_filter_inodes+0x2e/0x100
Jul 18 14:35:13 jh-mba kernel:  __audit_free+0x233/0x260
Jul 18 14:35:13 jh-mba kernel:  do_exit+0x8d3/0xb50
Jul 18 14:35:13 jh-mba kernel:  ? syscall_slow_exit_work+0x117/0x140
Jul 18 14:35:13 jh-mba kernel:  rewind_stack_do_exit+0x17/0x20
Jul 18 14:35:13 jh-mba kernel: RIP: 0033:0x7ff689f8eb67
Jul 18 14:35:13 jh-mba kernel: Code: 73 01 c3 48 8b 0d 29 d3 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 07 01 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f9 d2 0c 00 f7 d8 64 89 01 48
Jul 18 14:35:13 jh-mba kernel: RSP: 002b:00007fff95e52468 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
Jul 18 14:35:13 jh-mba kernel: RAX: 0000000000000000 RBX: 00007ff68934e830 RCX: 00007ff689f8eb67
Jul 18 14:35:13 jh-mba kernel: RDX: 0000000000000000 RSI: 000055edb4e490b3 RDI: 0000000000000004
Jul 18 14:35:13 jh-mba kernel: RBP: 0000000000000004 R08: 000055edb4e490a0 R09: 00007ff68a05cbe0
Jul 18 14:35:13 jh-mba kernel: R10: 0000000000000004 R11: 0000000000000246 R12: 000055edb4e49040
Jul 18 14:35:13 jh-mba kernel: R13: 0000000000000000 R14: 000055edb4e490a0 R15: 000055edb4e490b3
Jul 18 14:35:13 jh-mba kernel: Modules linked in: rfcomm bnep xt_CHECKSUM cpufreq_powersave xt_MASQUERADE cpufreq_conservative cpufreq_userspace xt_tcpudp nft_compat bridge stp llc overlay fuse nft_chain_nat nf_nat nf_log_ipv6 nf_log_ipv4 nf_log_common nft_log veth intel_rapl_msr btusb btrtl btbcm joydev binfmt_misc btintel nls_ascii nls_cp437 vfat fat bluetooth nft_counter drbg intel_rapl_common asix ansi_cprng ecdh_generic usbnet ecc mii vrf libphy x86_pkg_temp_thermal intel_powerclamp applesmc snd_hda_codec_hdmi snd_hda_codec_cirrus snd_hda_codec_generic coretemp ledtrig_audio evdev wireguard kvm_intel curve25519_x86_64 libcurve25519_generic libchacha20poly1305 snd_hda_intel kvm bcm5974 wl(POE) snd_intel_dspcfg chacha_x86_64 poly1305_x86_64 ip6_udp_tunnel efi_pstore udp_tunnel irqbypass snd_hda_codec libblake2s cfg80211 intel_cstate snd_hda_core blake2s_x86_64 libblake2s_generic libchacha snd_hwdep intel_uncore iTCO_wdt i915 iTCO_vendor_support intel_rapl_perf snd_pcm nft_ct sg ef
 ivars pcspkr nf_conntrack
Jul 18 14:35:13 jh-mba kernel:  watchdog rfkill snd_timer nf_defrag_ipv6 nf_defrag_ipv4 drm_kms_helper mei_me snd mei cec soundcore i2c_algo_bit sbs sbshc acpi_als kfifo_buf industrialio apple_bl ac button bonding nf_tables parport_pc(E) nfnetlink ppdev(E) lp(E) drm parport(E) sunrpc efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 btrfs blake2b_generic zstd_decompress zstd_compress hid_apple hid_generic usbhid hid dm_crypt dm_mod raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod uas usb_storage sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_pclmul crct10dif_common crc32_pclmul crc32c_intel ghash_clmulni_intel ahci libahci xhci_pci aesni_intel xhci_hcd libaes crypto_simd libata cryptd glue_helper usbcore scsi_mod i2c_i801 thunderbolt lpc_ich mfd_core usb_common spi_pxa2xx_platform dw_dmac video dw_dmac_core
Jul 18 14:35:13 jh-mba kernel: CR2: 0000000000000060
Jul 18 14:35:13 jh-mba kernel: ---[ end trace 01b46d19ab2d30c0 ]---
Jul 18 14:35:13 jh-mba kernel: RIP: 0010:d_path+0x35/0x140
Jul 18 14:35:13 jh-mba kernel: Code: 49 89 fc 48 83 ec 28 48 8b 7f 08 89 54 24 04 65 48 8b 04 25 28 00 00 00 48 89 44 24 20 31 c0 48 63 c2 48 01 f0 48 89 44 24 08 <48> 8b 47 60 48 85 c0 74 22 48 8b 40 48 48 85 c0 74 19 48 3b 7f 18
Jul 18 14:35:13 jh-mba kernel: RSP: 0018:ffffb71e411cfe18 EFLAGS: 00010282
Jul 18 14:35:13 jh-mba kernel: RAX: ffff9a525f18700b RBX: ffff9a524fc52060 RCX: 00000000000004dd
Jul 18 14:35:13 jh-mba kernel: RDX: 000000000000100b RSI: ffff9a525f186000 RDI: 0000000000000000
Jul 18 14:35:13 jh-mba kernel: RBP: ffffb71e411cfe48 R08: ffff9a52672b0060 R09: 0000000000000006
Jul 18 14:35:13 jh-mba kernel: R10: ffff9a522c99e6c0 R11: ffff9a532c99e030 R12: ffff9a524fc522b0
Jul 18 14:35:13 jh-mba kernel: R13: ffff9a52658d3708 R14: ffff9a524fc52000 R15: 0000000000000000
Jul 18 14:35:13 jh-mba kernel: FS:  00007ff68934e980(0000) GS:ffff9a5267280000(0000) knlGS:0000000000000000
Jul 18 14:35:13 jh-mba kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jul 18 14:35:13 jh-mba kernel: CR2: 0000000000000060 CR3: 0000000226ce6002 CR4: 00000000001606e0
Jul 18 14:35:13 jh-mba kernel: Fixing recursive fault but reboot is needed!
Jul 18 14:35:10 jh-mba audit[3163]: SYSCALL arch=c000003e syscall=263 a0=4 a1=55edb4e490b3 a2=0 a3=4 items=2 ppid=1 pid=3163 auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="systemd-user-ru" exe="/usr/lib/systemd/systemd-user-runtime-dir" subj=system_u:system_r:systemd_user_runtime_dir_t:s0 key=(null)
Jul 18 14:35:14 jh-mba systemd[1]: systemd-hostnamed.service: Succeeded.
Jul 18 14:35:14 jh-mba audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'

Line information from the debian linux-image-5.7.0-1-amd64 (version 5.7.6-1) package, duplicates ommitted:

Reading symbols from /usr/lib/debug/boot/vmlinux-5.7.0-1-amd64...
(gdb) l *d_path+0x35
0xffffffff812dcee5 is in d_path (fs/d_path.c:275).
270              *
271              * Some pseudo inodes are mountable.  When they are mounted
272              * path->dentry == path->mnt->mnt_root.  In that case don't call d_dname
273              * and instead have d_path return the mounted path.
274              */
275             if (path->dentry->d_op && path->dentry->d_op->d_dname &&
276                 (!IS_ROOT(path->dentry) || path->dentry != path->mnt->mnt_root))
277                     return path->dentry->d_op->d_dname(path->dentry, buf, buflen);
278
279             rcu_read_lock();
(gdb) l *audit_log_d_path+0x75
0xffffffff8114f175 is in audit_log_d_path (kernel/audit.c:2046).
2041            pathname = kmalloc(PATH_MAX+11, ab->gfp_mask);
2042            if (!pathname) {
2043                    audit_log_string(ab, "<no_memory>");
2044                    return;
2045            }
2046            p = d_path(path, pathname, PATH_MAX+11);
2047            if (IS_ERR(p)) { /* Should never happen since we send PATH_MAX */
2048                    /* FIXME: can we save some information here? */
2049                    audit_log_string(ab, "<too_long>");
2050            } else
(gdb) l *audit_log_exit+0x63d
0xffffffff8115445d is in audit_log_exit (kernel/auditsc.c:1342).
1337                    case 0:
1338                            /* name was specified as a relative path and the
1339                             * directory component is the cwd
1340                             */
1341                            audit_log_d_path(ab, " name=", &context->pwd);
1342                            break;
1343                    default:
1344                            /* log the name's directory component */
1345                            audit_log_format(ab, " name=");
1346                            audit_log_n_untrustedstring(ab, n->name->name,
(gdb) l *audit_filter_inodes+0x2e
0xffffffff81155e2e is in audit_filter_inodes (kernel/auditsc.c:835).
830      */
831     void audit_filter_inodes(struct task_struct *tsk, struct audit_context *ctx)
832     {
833             struct audit_names *n;
834
835             if (auditd_test_task(tsk))
836                     return;
837
838             rcu_read_lock();
839
(gdb) l *__audit_syscall_exit+0x23b
0xffffffff8115661b is in __audit_syscall_exit (kernel/auditsc.c:1710).
1705
1706                    audit_filter_syscall(current, context,
1707                                         &audit_filter_list[AUDIT_FILTER_EXIT]);
1708                    audit_filter_inodes(current, context);
1709                    if (context->current_state == AUDIT_RECORD_CONTEXT)
1710                            audit_log_exit();
1711            }
1712
1713            context->in_syscall = 0;
1714            context->prio = context->state == AUDIT_RECORD_CONTEXT ? ~0ULL : 0;
(gdb) l *syscall_slow_exit_work+0x117
0xffffffff81005197 is in syscall_slow_exit_work (include/linux/audit.h:316).
311     {
312             if (unlikely(audit_context())) {
313                     int success = is_syscall_success(pt_regs);
314                     long return_code = regs_return_value(pt_regs);
315
316                     __audit_syscall_exit(success, return_code);
317             }
318     }
319     static inline struct filename *audit_reusename(const __user char *name)
320     {
(gdb) l *do_syscall_64+0x10e
0xffffffff8100543e is in do_syscall_64 (arch/x86/entry/common.c:276).
warning: Source file is more recent than executable.
271             /*
272              * First do one-time work.  If these work items are enabled, we
273              * want to run them exactly once per syscall exit with IRQs on.
274              */
275             if (unlikely(cached_flags & SYSCALL_EXIT_WORK_FLAGS))
276                     syscall_slow_exit_work(regs, cached_flags);
277
278             local_irq_disable();
279             prepare_exit_to_usermode(regs);
280     }
(gdb) l *entry_SYSCALL_64_after_hwframe+0x44
0xffffffff8180008c is at /build/linux-iTqI2R/linux-5.7.6/arch/x86/entry/entry_64.S:184.
179     /build/linux-iTqI2R/linux-5.7.6/arch/x86/entry/entry_64.S: No such file or directory.
(gdb) l *__audit_free+0x233
0xffffffff81156283 is in __audit_free (kernel/auditsc.c:1602).
1597
1598                    audit_filter_syscall(tsk, context,
1599                                         &audit_filter_list[AUDIT_FILTER_EXIT]);
1600                    audit_filter_inodes(tsk, context);
1601                    if (context->current_state == AUDIT_RECORD_CONTEXT)
1602                            audit_log_exit();
1603            }
1604
1605            audit_set_context(tsk, NULL);
1606            audit_free_context(context);
(gdb) l *do_exit+0x8d3
0xffffffff81088ce3 is in do_exit (include/linux/audit.h:301).
296             return !p || *(int *)p;
297     }
298     static inline void audit_free(struct task_struct *task)
299     {
300             if (unlikely(task->audit_context))
301                     __audit_free(task);
302     }
303     static inline void audit_syscall_entry(int major, unsigned long a0,
304                                            unsigned long a1, unsigned long a2,
305                                            unsigned long a3)
(gdb) l *syscall_slow_exit_work+0x117
0xffffffff81005197 is in syscall_slow_exit_work (include/linux/audit.h:316).
311     {
312             if (unlikely(audit_context())) {
313                     int success = is_syscall_success(pt_regs);
314                     long return_code = regs_return_value(pt_regs);
315
316                     __audit_syscall_exit(success, return_code);
317             }
318     }
319     static inline struct filename *audit_reusename(const __user char *name)
320     {
(gdb) l *rewind_stack_do_exit+0x17
(gdb)

-- 
bauen1
https://dn42.bauen1.xyz/

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

