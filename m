Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB89B339C
	for <lists+linux-audit@lfdr.de>; Mon, 16 Sep 2019 04:56:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5398F85A03;
	Mon, 16 Sep 2019 02:55:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDAB260923;
	Mon, 16 Sep 2019 02:55:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF6261800B74;
	Mon, 16 Sep 2019 02:55:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8G2tTE9030131 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 15 Sep 2019 22:55:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D067B600F8; Mon, 16 Sep 2019 02:55:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7F1F600CD;
	Mon, 16 Sep 2019 02:55:27 +0000 (UTC)
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
	by mx1.redhat.com (Postfix) with ESMTP id 92938C049E32;
	Mon, 16 Sep 2019 02:55:25 +0000 (UTC)
Received: from BC-Mail-Ex29.internal.baidu.com (unknown [172.31.51.23])
	by Forcepoint Email with ESMTPS id 729699FAC67F9;
	Mon, 16 Sep 2019 10:55:21 +0800 (CST)
Received: from BJHW-Mail-Ex13.internal.baidu.com (10.127.64.36) by
	BC-Mail-Ex29.internal.baidu.com (172.31.51.23) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1713.5; Mon, 16 Sep 2019 10:55:23 +0800
Received: from BJHW-Mail-Ex13.internal.baidu.com ([100.100.100.36]) by
	BJHW-Mail-Ex13.internal.baidu.com ([100.100.100.36]) with mapi id
	15.01.1713.004; Mon, 16 Sep 2019 10:55:23 +0800
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Paul Moore <paul@paul-moore.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdW1JGQ10gYXVkaXQ6IHNldCB3YWl0IHRpbWUgdG8g?=
	=?utf-8?Q?zero_when_audit_failed?=
Thread-Topic: [PATCH][RFC] audit: set wait time to zero when audit failed
Thread-Index: AQHVaWpIwZPuSgS+uUKlaAzCHP+Gd6ctnETA
Date: Mon, 16 Sep 2019 02:55:23 +0000
Message-ID: <f0efb280c80342049d4c43c9acb42676@baidu.com>
References: <1568258385-10643-1-git-send-email-lirongqing@baidu.com>
	<CAHC9VhRXj2UpdijxpKgMROfNu9tETpXpHdboPqP=HvVF-GuBVQ@mail.gmail.com>
In-Reply-To: <CAHC9VhRXj2UpdijxpKgMROfNu9tETpXpHdboPqP=HvVF-GuBVQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.198.30]
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Mon, 16 Sep 2019 02:55:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Mon, 16 Sep 2019 02:55:26 +0000 (UTC) for IP:'111.202.115.85'
	DOMAIN:'mx20.baidu.com' HELO:'baidu.com'
	FROM:'lirongqing@baidu.com' RCPT:''
X-RedHat-Spam-Score: -0.702  (RCVD_IN_DNSWL_LOW, SPF_HELO_PASS,
	SPF_PASS) 111.202.115.85 mx20.baidu.com 111.202.115.85
	mx20.baidu.com <lirongqing@baidu.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8G2tTE9030131
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 16 Sep 2019 02:55:58 +0000 (UTC)

> >
> > if audit_log_start failed because queue is full, kauditd is waiting
> > the receiving queue empty, but no receiver, a task will be forced to
> > wait 60 seconds for each audited syscall, and it will be hang for a
> > very long time
> >
> > so at this condition, set the wait time to zero to reduce wait, and
> > restore wait time when audit works again
> >
> > it partially restore the commit 3197542482df ("audit: rework
> > audit_log_start()")
> >
> > Signed-off-by: Li RongQing <lirongqing@baidu.com>
> > Signed-off-by: Liang ZhiCheng <liangzhicheng@baidu.com>
> > ---
> > reboot is taking a very long time on my machine(centos 6u4 +kernel
> > 5.3) since TIF_SYSCALL_AUDIT is set by default, and when reboot,
> > userspace process which receiver audit message , will be killed, and
> > lead to that no user drain the audit queue
> >
> > git bitsect show it is caused by 3197542482df ("audit: rework
> > audit_log_start()")
> >
> >  kernel/audit.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> This is typically solved by increasing the backlog using the "audit_backlog_limit"
> kernel parameter (link to the docs below). 

It should be able to avoid my issue, but the default behaviors does not working for me; And not all have enough knowledge about audit, who maybe spend lots of effort to find the root cause, and estimate how large should be "audit_backlog_limit"

> You might also want to investigate
> what is generating some many audit records prior to starting the audit
> daemon.
> 
It is /sbin/readahead-collector, in fact, we stop the auditd; We are doing a reboot test, which rebooting machine continue to test hardware/software.

it is same as below:
auditctl -a always,exit -S all -F pid='xxx'
kill -s 19 `pidof auditd`

then the audited task will be hung

-RongQing



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
