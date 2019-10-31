Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 252C2EB599
	for <lists+linux-audit@lfdr.de>; Thu, 31 Oct 2019 17:59:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572541148;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i6Q676GpGo1bUPVXOc5cQb9cYFxqk8o+Y2y20KG5e8U=;
	b=Cl7AZHbDlkf3SRgV4ODK113U4eU98jZWsALKH3nAZYjAY4aXv4ioBaCB9/U5JTve31KJcA
	f5Pp0slhjPgn7zA6XwrWXveZGe0AbF7jxWZ0mezbk74ab4430XPrAsvO0cw9Y997IIcj3F
	tZc9/XxPNGXp+pjJs1NJg4SX/Hj5vlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-yuUvjo_OO7ez65U2p6KsJg-1; Thu, 31 Oct 2019 12:59:06 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB2372EDD;
	Thu, 31 Oct 2019 16:59:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 216DF67583;
	Thu, 31 Oct 2019 16:58:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6229018034EA;
	Thu, 31 Oct 2019 16:58:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9VGe6bL026100 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 31 Oct 2019 12:40:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 91CD65C28E; Thu, 31 Oct 2019 16:40:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B53A5C1C3
	for <linux-audit@redhat.com>; Thu, 31 Oct 2019 16:40:03 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
	[67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69C335945C
	for <linux-audit@redhat.com>; Thu, 31 Oct 2019 16:40:02 +0000 (UTC)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x9VD6pLc019039
	for <linux-audit@redhat.com>; Thu, 31 Oct 2019 09:40:01 -0700
Received: from maileast.thefacebook.com ([163.114.130.16])
	by m0089730.ppops.net with ESMTP id 2w007412xf-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT)
	for <linux-audit@redhat.com>; Thu, 31 Oct 2019 09:40:01 -0700
Received: from 2401:db00:2050:5076:face:0:7:0 (2620:10d:c0a8:1b::d) by
	mail.thefacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Thu, 31 Oct 2019 09:40:00 -0700
Received: by devvm005.ftw2.facebook.com (Postfix, from userid 8731)
	id 7CACA35494B0F; Thu, 31 Oct 2019 09:39:59 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Chris Mason <clm@fb.com>
Smtp-Origin-Hostname: devvm005.ftw2.facebook.com
To: Paul Moore <paul@paul-moore.com>
Smtp-Origin-Cluster: ftw2c04
Subject: [PATCH] audit: set context->dummy even when audit is off
Date: Thu, 31 Oct 2019 09:39:31 -0700
Message-ID: <20191031163931.1102669-1-clm@fb.com>
In-Reply-To: <CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
References: <CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
X-FB-Internal: Safe
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-31_05:2019-10-30,2019-10-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	phishscore=0
	impostorscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
	priorityscore=1501 suspectscore=0 malwarescore=0 mlxscore=0
	lowpriorityscore=0 spamscore=0 adultscore=0 classifier=spam adjust=0
	reason=mlx scancount=1 engine=8.12.0-1908290000
	definitions=main-1910310136
X-FB-Internal: deliver
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Thu, 31 Oct 2019 16:40:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Thu, 31 Oct 2019 16:40:02 +0000 (UTC) for IP:'67.231.153.30'
	DOMAIN:'mx0b-00082601.pphosted.com'
	HELO:'mx0a-00082601.pphosted.com' FROM:'clm@fb.com' RCPT:''
X-RedHat-Spam-Score: -0.801  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 67.231.153.30 mx0b-00082601.pphosted.com 67.231.153.30
	mx0b-00082601.pphosted.com <prvs=5207ecd98b=clm@fb.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 31 Oct 2019 12:58:45 -0400
Cc: Dave Jones <davej@codemonkey.org.uk>, Kyle McMartin <jkkm@fb.com>,
	linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
	linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: yuUvjo_OO7ez65U2p6KsJg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Dave Jones reported that we're finding a considerable amount of dmesg
traffic from NTP time adjustments being reported through the audit
subsystem.  His original post is here:

https://lore.kernel.org/lkml/20190923155041.GA14807@codemonkey.org.uk/

The confusing part is that we're seeing this on machines that don't have
audit on.  The NTP code uses audit_dummy_context() to decide if it
should log things:

=09static inline void audit_ntp_log(const struct audit_ntp_data *ad)
=09{
=09=09if (!audit_dummy_context())
=09=09=09__audit_ntp_log(ad);
=09}

I confirmed with perf probes that:

=09context->dummy =3D 0
=09audit_n_rules =3D 0
=09audit_enabled =3D 0
=09audit_ever_enabled =3D 1 // seems to be from journald

The box boots, journald turns audit on, some time later our
configuration management runs around and turns audit off.  This journald
feature is discussed here: https://github.com/systemd/systemd/issues/959

>From what I can tell, audit_syscall_entry is responsible for setting
context->dummy, but we never get down to the test for audit_n_rules:

__audit_syscall_entry(int major, unsigned long a1, unsigned long a2,
                           unsigned long a3, unsigned long a4)
{
        struct audit_context *context =3D audit_context();
        enum audit_state     state;

        if (!audit_enabled || !context)
                return;
                ^^^^^^^^^^^^^^^^^^  --- we bail here

=09[ ... ]

        context->dummy =3D !audit_n_rules;

This leaves context->dummy at 0, which appears to be the original value
from kzalloc().

If you've gotten this far, you've read everything I know about the audit
code.  With that said, my preference is to make a single source of truth fo=
r
decisions about logging.  This commit changes __audit_syscall_entry() to
set context->dummy when audit is off.

Reported-by: Dave Jones <davej@codemonkey.org.uk>
Signed-off-by: Chris Mason <clm@fb.com>
---
 kernel/auditsc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 4effe01ebbe2..a5c82d8f9c2b 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1631,8 +1631,19 @@ void __audit_syscall_entry(int major, unsigned long =
a1, unsigned long a2,
 =09struct audit_context *context =3D audit_context();
 =09enum audit_state     state;
=20
-=09if (!audit_enabled || !context)
+=09if (!context)
+=09=09return;
+
+=09if (!audit_enabled) {
+=09=09/*
+=09=09 * ntp clock adjustments and a few other places check for
+=09=09 * a dummy context without checking to see if audit
+=09=09 * is enabled.  Make sure we set context->dummy when audit
+=09=09 * is off, otherwise they will try to log things.
+=09=09 */
+=09=09context->dummy =3D 1;
 =09=09return;
+=09}
=20
 =09BUG_ON(context->in_syscall || context->name_count);
=20
--=20
2.17.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

