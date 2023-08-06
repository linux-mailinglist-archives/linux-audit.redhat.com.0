Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5067716DA
	for <lists+linux-audit@lfdr.de>; Sun,  6 Aug 2023 23:52:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691358762;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+DWNf1IcEWYku1Yu32QWvYTOTp6gAsluoLuabYfsTA0=;
	b=HhrWNF3juffneGidMZ+9ZNOFNeI/8UpZHZY7YJsRvWubTx64yBSXzAA1YA992jfwHirixn
	aSB8ot1M0UxklOitJLvd8tkdd+EHcn7jQF445LtjHi7K58YkakR50yGuRx/kekvPv6xx77
	k2ReIdV3B4flk9B7BVr6ShhnvNFvf2s=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-15kLmRs1PXathAcZVGlmUg-1; Sun, 06 Aug 2023 17:52:38 -0400
X-MC-Unique: 15kLmRs1PXathAcZVGlmUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 322971C05141;
	Sun,  6 Aug 2023 21:52:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3EF11454147;
	Sun,  6 Aug 2023 21:52:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 577CA194658F;
	Sun,  6 Aug 2023 21:52:27 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 93A031946586 for <linux-audit@listman.corp.redhat.com>;
 Sun,  6 Aug 2023 21:52:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 659BA140E952; Sun,  6 Aug 2023 21:52:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.8.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A7081401C2E
 for <linux-audit@redhat.com>; Sun,  6 Aug 2023 21:52:25 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux Audit <linux-audit@redhat.com>
Subject: audit-3.1.2 released
Date: Sun, 06 Aug 2023 17:52:24 -0400
Message-ID: <5867290.DvuYhMxLoT@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I've just released a new version of the audit daemon. It can be
downloaded from http://people.redhat.com/sgrubb/audit. It will also be
in rawhide soon. The ChangeLog is:

- When processing a run level change, make auditd exit
- In auditd, fix return code when rules added in immutable mode
- In auparse, when files are given, also consider EUID for access
- Auparse now interprets unnamed/anonymous sockets (Enzo Matsumiya)
- Disable Python bindings from setting rules due to swig bug (S. Trofimovich)
- Update all lookup tables for the 6.5 kernel
- Don't be as paranoid about auditctl -R file permissions
- In ausearch, correct subject/object search to be an and if both are given
- Adjust formats for 64 bit time_t
- Fix segfault in python bindings around the feed API
- Add feed_has_data, get_record_num, and get/goto_field_num to python bindings

There are various bugfixes, a refresh of the lookup tables for the 6.5 kernel, 
and some sprucing up of the python bindings. Speaking of which, this release 
removes the ability to set audit rules via the python bindings. That means no 
more workaround patch is needed for the swig issue.

SHA256: c0b1792d1f0a88c6f1828710509cbb987059fc68712c97669ca90eae103d287d

Please let me know if you run across any problems with this release.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

