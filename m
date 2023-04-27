Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C493E6F0CAB
	for <lists+linux-audit@lfdr.de>; Thu, 27 Apr 2023 21:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682624686;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L10z9Iiv4Scj9h1wcEYFgKc9PxYD/XTRFMiMSJMm5Jk=;
	b=UjwAU+rYzOZZ4YWJyna2xepZQt1lzYb3qMtU7ZW+oEXPatc9popV/M3RQnszauxprjJtLl
	dGtfSC/2IGcl3xWIzC9jhIH04R18jJnDDGbZZ+4w7KZ9JzsDKVr/JgZ0VQFuccdbcNLATx
	i/LTC3FhtBldMKa6BmY3sBfzMpI1Ihg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-No5rZfkoPQS__vJME0Wc3w-1; Thu, 27 Apr 2023 15:44:41 -0400
X-MC-Unique: No5rZfkoPQS__vJME0Wc3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEC8F3806628;
	Thu, 27 Apr 2023 19:44:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E04AC16026;
	Thu, 27 Apr 2023 19:44:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E39D51946A54;
	Thu, 27 Apr 2023 19:44:29 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 20BF51946A45 for <linux-audit@listman.corp.redhat.com>;
 Thu, 27 Apr 2023 19:44:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 149BE2166B41; Thu, 27 Apr 2023 19:44:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.9.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED65B2166B46
 for <linux-audit@redhat.com>; Thu, 27 Apr 2023 19:44:28 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux Audit <linux-audit@redhat.com>
Subject: audit-3.1.1 released
Date: Thu, 27 Apr 2023 15:44:28 -0400
Message-ID: <6001988.lOV4Wx5bFT@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I've just released a new version of the audit daemon. It can be
downloaded from http://people.redhat.com/sgrubb/audit. It will also be
in rawhide soon. The ChangeLog is:

- Add user friendly keywords for signals to auditctl
- In ausearch, parse up URINGOP and DM_CTRL records
- Harden auparse to better handle corrupt logs
- Fix a CFLAGS propogation problem in the common directory
- Move the audispd af_unix plugin to a standalone program

The most relevant thing to packagers is to know about the last item above. 
Due to a timing race in the af_unix plugin, it was possible to get auditd to 
not accept any more af_unix connections. You have to be root to connect, so 
this is nothing a normal user could trigger. The fix was to pull the af_unix 
plugin out of auditd to be a standalone program.

auditctl --signal can now use: stop, reload, rotate, resume, and state. This 
can be used where people want to stop using the service command.

One last thing to mention, ausearch/auparse have been hardened to better deal 
with corrupted logs.

SHA256: 46e46b37623cce09e6ee134e78d668afc34f4e1c870c853ef12e4193078cfe87

Please let me know if you run across any problems with this release.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

