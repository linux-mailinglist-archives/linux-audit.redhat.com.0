Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 92115E5471
	for <lists+linux-audit@lfdr.de>; Fri, 25 Oct 2019 21:37:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572032254;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D2pCM25OurnvjH+g9k8phfHvpS9OIMATRj+KINyXOTU=;
	b=J1vzb9WfNRJf0L6nBws2deBuScw3vFSPKsin84IY1z1K0rY+C4mx1dDP5qNIWCXah+kMJ8
	sMVt2u0gFqj9Ygw3nPmks+q0bDgDk477/MqKrjUVTyFjrHNw/vbFFpLbbl6/169xqEMAVH
	zOyqLFRo2ozpyN1NPDORB/1oauFFdds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-T4rLF3bCP7-6CbeUpaOgMg-1; Fri, 25 Oct 2019 15:37:31 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9964B5E6;
	Fri, 25 Oct 2019 19:37:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB8F75D9CA;
	Fri, 25 Oct 2019 19:37:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92EB64E58A;
	Fri, 25 Oct 2019 19:37:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9PJbG2N023705 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 25 Oct 2019 15:37:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2174560624; Fri, 25 Oct 2019 19:37:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1990060603;
	Fri, 25 Oct 2019 19:37:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9213B85540;
	Fri, 25 Oct 2019 19:37:12 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
	[66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 398DF21D71;
	Fri, 25 Oct 2019 19:37:11 +0000 (UTC)
Date: Fri, 25 Oct 2019 15:37:09 -0400
From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
To: linux-audit@redhat.com
Subject: [PATCH] Fix 100% CPU usage (again) due to log rotate
Message-ID: <20191025153709.2cdbaca5@gandalf.local.home>
MIME-Version: 1.0
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 25 Oct 2019 19:37:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Fri, 25 Oct 2019 19:37:12 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'rostedt@kernel.org' RCPT:''
X-RedHat-Spam-Score: -4.75  (HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<SRS0=mph5=YS=goodmis.org=rostedt@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Srikantha Munipemmareddy <smunipemmareddy@vmware.com>,
	Ravi Soundararajan <ravi@vmware.com>, Clark Williams <williams@redhat.com>,
	Stepan Broz <sbroz@starbug.usersys.redhat.com>,
	Tanmay Nag <Tanmay@vmware.com>, Darren Hart <dvhart@vmware.com>,
	Joseph Zuk <jzuk@vmware.com>,
	Srivatsa Bhat <srivatsab@vmware.com>, Loi Tran <loi@vmware.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: T4rLF3bCP7-6CbeUpaOgMg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

If the num_logs is set to 0 and keep_logs is set, we go back into a
loop of MAX_INT! in rotate_logs().

commit 9145e97c ("Do not rotate logs when num_logs < 2.") fixed the
issue with not going further if num_logs is less than 2, because if
num_logs is zero, we trigger this bug because of the loop:

  for (i=3Dnum_logs - 1; i>1; i--) {

As i is an unsigned int, if num_logs is zero, we initialize i to
"0 - 1" or 4,294,967,295. Thus, runs this loop over 4 billion times!

But this caused a regressing if keep_logs is set, so this
num_logs < 2 was skipped if keep_logs is set, causing the huge loop
to run once again if num_logs is zero!

There's no reason i needs to be unsigned, if i is signed, then if we
pass in num_logs =3D 0, then i will start off as -1, and -1 > 1 will fail
the loop and fix the issue. I don't envision anyone wanting to
keep 2,147,483,648 log files around.

Fixes: a7f9f8b5 ("Fix auditd regression where keep_logs is limited by rotat=
e_logs 2 file test")
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
diff --git a/src/auditd-event.c b/src/auditd-event.c
index 1c93173..68eacd5 100644
--- a/src/auditd-event.c
+++ b/src/auditd-event.c
@@ -1012,8 +1012,8 @@ static void fix_disk_permissions(void)
 =20
 static void rotate_logs(unsigned int num_logs, unsigned int keep_logs)
 {
-=09int rc;
-=09unsigned int len, i;
+=09int rc, i;
+=09unsigned int len;
 =09char *oldname, *newname;
=20
 =09/* Check that log rotation is enabled in the configuration file. There
@@ -1065,7 +1065,7 @@ static void rotate_logs(unsigned int num_logs, unsign=
ed int keep_logs)
 =09=09snprintf(oldname, len, "%s.1", config->log_file);
=20
 =09known_logs =3D 0;
-=09for (i=3Dnum_logs - 1; i>1; i--) {
+=09for (i=3D(int)num_logs - 1; i>1; i--) {
 =09=09snprintf(oldname, len, "%s.%u", config->log_file, i-1);
 =09=09snprintf(newname, len, "%s.%u", config->log_file, i);
 =09=09/* if the old file exists */

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

