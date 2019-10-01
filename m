Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 663DFC351D
	for <lists+linux-audit@lfdr.de>; Tue,  1 Oct 2019 15:04:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AC7618C427C;
	Tue,  1 Oct 2019 13:04:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CF245C223;
	Tue,  1 Oct 2019 13:04:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B15674E58A;
	Tue,  1 Oct 2019 13:03:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x914S5jp027825 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 1 Oct 2019 00:28:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E8165D717; Tue,  1 Oct 2019 04:28:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6670A5D6D0;
	Tue,  1 Oct 2019 04:28:03 +0000 (UTC)
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A09BA44AF2;
	Tue,  1 Oct 2019 04:28:00 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id p11so5183946ybc.1;
	Mon, 30 Sep 2019 21:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=DjYdC98brcXZh3IguLEyiA6YNZpi2Jdl+glnmVEH2Lc=;
	b=PfUcBlFMD6Vh+1taZWX41bzlayWkAZ85pJWJZhVOXhfrtxlVsm5MsufsjVb2PvTDHG
	0JoEJcj4dDUMWJx06/tnchtjf7bJFA2NLhLU2mAxxCFWTWsFJ50NQDsNg1VMRNLwXLNZ
	0sltPIt2AZ2BoU4ZJlQa1vJqa10jpYAnPLe5fHVNo4HN7h4OBGFFycwcuML6/ws8aywC
	upljZN6yYCSwlRImJYZeIQTlH5+28uph+WG7O7OVaUISwoiKKOYjJuDvWlJoT/+QNz0g
	cQVmlBOxVSbBu74YKsPB+kFLzS9DaBCBPniOmH+wKefZ8v1q6PyiMX1baPjA8rrWZflh
	ICBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mime-version:content-disposition:user-agent;
	bh=DjYdC98brcXZh3IguLEyiA6YNZpi2Jdl+glnmVEH2Lc=;
	b=ViyRydBVJ2dKaDqcL8s6CizXQW+fwQ0h4+hKl6rQWZxhLALjDr42WAutodFOxXFgbP
	iDPKLO8ZQxurKeAct5h74DpwjVxtdr1yCkZ5OyIeyCEo9Z09tEVyIaGuQLZpVOUXiHRY
	cVbRg5/Pj5fnFdwrjqCDE2hvOkwk5YNVGy0yT/c6GRmSRPLsgd/5cZGIYD4RmYPKCFvu
	QAc0LS/FHWRlQscvMqrPeEtf3VlCGZsYUpzt1mjp6Vj31eIgP3xcf3O8Mfm1HRv3LYHJ
	fc6vHdLHoZuDIuzVW5yBDnoo2dB6VJ/T2Wl5y1uLUKe4R1G3P3tSpL3o/f0E2ijw9GJt
	JNTg==
X-Gm-Message-State: APjAAAWXH+T8HCJV+ON1bSvnb3TRx4wWfjlx7Qs3YkQf8t2wsaa4p92D
	KEJpbNucvX6hyoYsrKE2goAEzi23
X-Google-Smtp-Source: APXvYqyQGS0oD/V5qqGxkQJ7xuM/YnkLO1ZZbz9o+rfp5RHRvGs70EJ2U4RiSBoHRaDQyBHzhMGfJg==
X-Received: by 2002:a5b:3:: with SMTP id a3mr17072389ybp.296.1569904079352;
	Mon, 30 Sep 2019 21:27:59 -0700 (PDT)
Received: from vps.qemfd.net (vps.qemfd.net. [173.230.130.29])
	by smtp.gmail.com with ESMTPSA id
	r63sm3355278ywg.36.2019.09.30.21.27.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Sep 2019 21:27:58 -0700 (PDT)
Received: from schwarzgerat.orthanc (schwarzgerat.danknet [10.88.0.2])
	by vps.qemfd.net (Postfix) with ESMTP id 4790F2B639;
	Tue,  1 Oct 2019 00:27:58 -0400 (EDT)
Received: by schwarzgerat.orthanc (Postfix, from userid 1000)
	id 3DCC86006AD; Tue,  1 Oct 2019 00:27:58 -0400 (EDT)
Date: Tue, 1 Oct 2019 00:27:58 -0400
From: Nick Black <nickblack@linux.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: [PATCH] audit_set_pid: add wmode to man page
Message-ID: <20191001042758.GA9135@schwarzgerat.orthanc>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Tue, 01 Oct 2019 04:28:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Tue, 01 Oct 2019 04:28:00 +0000 (UTC) for IP:'209.85.219.194'
	DOMAIN:'mail-yb1-f194.google.com'
	HELO:'mail-yb1-f194.google.com' FROM:'dankamongmen@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.219.194 mail-yb1-f194.google.com 209.85.219.194
	mail-yb1-f194.google.com <dankamongmen@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 01 Oct 2019 09:03:44 -0400
Cc: linux-audit@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Tue, 01 Oct 2019 13:04:07 +0000 (UTC)

audit_set_pid: add wmode to man page

The audit_set_pid man page is missing the third parameter. I've
added it, and briefly extended the usage.
Signed-off-by: Nick Black <nickblack@linux.com>
---
 docs/audit_set_pid.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/audit_set_pid.3 b/docs/audit_set_pid.3
index d2b33db..87c41fb 100644
--- a/docs/audit_set_pid.3
+++ b/docs/audit_set_pid.3
@@ -5,11 +5,11 @@ audit_set_pid \- Set audit daemon process ID
 
 .B #include <libaudit.h>
 .sp
-int audit_set_pid (int fd, int pid);
+int audit_set_pid (int fd, int pid, rep_wait_t wmode);
 
 .SH "DESCRIPTION"
 
-audit_set_pid tells the kernel what the pid is of the audit daemon. When the pid is set to 0, the kernel will log all events to syslog. Otherwise it will try to send events to the netlink connection that has the same pid given by this function. If for some reason the process goes away, the kernel will automatically set the value to 0 itself. Usually this function is called by the audit daemon and not an external program.
+audit_set_pid tells the kernel what the pid is of the audit daemon. When the pid is set to 0, the kernel will log all events to syslog. Otherwise it will try to send events to the netlink connection that has the same pid given by this function. If for some reason the process goes away, the kernel will automatically set the value to 0 itself. Usually this function is called by the audit daemon and not an external program. If wmode is WAIT_YES, the function will wait for an ACK from the kernel.
 
 .SH "RETURN VALUE"
 
-- 
2.23.0

-- 
nick black -=- https://www.nick-black.com
to make an apple pie from scratch,
you need first invent a universe.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
