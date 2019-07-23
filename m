Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1169D71A47
	for <lists+linux-audit@lfdr.de>; Tue, 23 Jul 2019 16:26:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF96530C583B;
	Tue, 23 Jul 2019 14:26:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86FAC1017E3C;
	Tue, 23 Jul 2019 14:26:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4903F1972F;
	Tue, 23 Jul 2019 14:26:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6NCo41E015769 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 23 Jul 2019 08:50:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E2D6A19D7D; Tue, 23 Jul 2019 12:50:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CAC619C59;
	Tue, 23 Jul 2019 12:50:02 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D0A530084BD;
	Tue, 23 Jul 2019 12:50:01 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k189so350661pgk.13;
	Tue, 23 Jul 2019 05:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ScN8WzRMKv9ujMKagsG6pPThL/4YrWzQ0Mh2lGU8I9Q=;
	b=TSyIOGxIgaDKwv/VxCj9bFdSyEYkKmwRWtQYccafT2FZwvSVPVcwGy9p6YB3jYyvfE
	IeYF5PtZPvSwA/3F6zkI8ozhCAqW8aWMETFoQu8cRdcCNYvdZCXrki5P2bKeogpqBf1U
	WMbprsYbetR4G+JcREVUCLaDKpwNV683KXqQjMVypckUH0XsUeWzZmjF92kDBtefSYzV
	pqwB917WJ7+yZsTh8QnRa9ZYQCRByw9Z3GBy9V58gi2Rk3qUvUosmftkhYzYmXk5taoN
	Dn4Cu3sHOB1KHX5a6R+ensmxSRb8PpYckJXntTO3mH+0JCiq2XsT7/my9jVxTIJo1f6L
	FXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ScN8WzRMKv9ujMKagsG6pPThL/4YrWzQ0Mh2lGU8I9Q=;
	b=gwef0rZNVH/VHSGPKG9Mb2rEEGD9tNx2a2e5o8EcTX649gN4ZTZk/gv8CfBLRaagJY
	V9HMewU7qWjf3PK7/iT8yvi2t6rmpwPf6xJePqvKT95gD6Pfl3+iXyMItlD+FUZ8pUci
	JWIEsmBo5stuqnrVX0hjRlr1A6O4amzSbiidHyez881EZ1tq/fJ0KnQLZVSzkzXy1xBO
	WPPzYFTEJHVmpGcpJFHrol03OUBrYLLLpi//JEKQy9eHIguXYYAzKTkUrHMTEJtpbTMu
	4nIIb0Jsu3f36VTYr3yABpZ/sCxk0YBorrari4NVhCI/UiZb8BGbZrJ3zELB2xplbxdo
	hvxA==
X-Gm-Message-State: APjAAAXqNKSKxJc2233xu2WwcW+OPIPKeneed47NNa96tb3eK5zb0NTY
	uSO/W8uF/E35eOA5TCB5LF7fnlb1
X-Google-Smtp-Source: APXvYqxF0qCyIETGsOEUtisC5gjWspQwU9DqLrwTq+1COsi6j95zH/CKSyJl1TUBThdLpBE6qoH3GA==
X-Received: by 2002:a62:4e58:: with SMTP id c85mr5635177pfb.176.1563886200947; 
	Tue, 23 Jul 2019 05:50:00 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
	by smtp.gmail.com with ESMTPSA id
	e17sm33750479pgm.21.2019.07.23.05.49.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jul 2019 05:50:00 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: paul@paul-moore.com, eparis@redhat.com
Subject: [PATCH] kernel: auditfilter: Fix a possible null-pointer dereference
	in audit_watch_path()
Date: Tue, 23 Jul 2019 20:49:51 +0800
Message-Id: <20190723124951.25713-1-baijiaju1990@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 23 Jul 2019 12:50:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 23 Jul 2019 12:50:01 +0000 (UTC) for IP:'209.85.215.194'
	DOMAIN:'mail-pg1-f194.google.com'
	HELO:'mail-pg1-f194.google.com' FROM:'baijiaju1990@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.153  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.215.194 mail-pg1-f194.google.com 209.85.215.194
	mail-pg1-f194.google.com <baijiaju1990@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 23 Jul 2019 10:25:44 -0400
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 23 Jul 2019 14:26:15 +0000 (UTC)

In audit_find_rule(), there is an if statement on line 894 to check
whether entry->rule.watch is NULL:
    else if (entry->rule.watch)

If entry->rule.watch is NULL, audit_compare_rule on 910 is called:
    audit_compare_rule(&entry->rule, &e->rule))

In audit_compare_rule(), a->watch is used on line 720:
    if (strcmp(audit_watch_path(a->watch), ...)

In this case, a->watch is NULL, and audit_watch_path() will use:
    watch->path

Thus, a possible null-pointer dereference may occur in this case.

To fix this possible bug, an if statement is added in
audit_compare_rule() to check a->watch before using a->watch.

This bug is found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 kernel/auditfilter.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index b0126e9c0743..b0ad17b14609 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -717,6 +717,8 @@ static int audit_compare_rule(struct audit_krule *a, struct audit_krule *b)
 				return 1;
 			break;
 		case AUDIT_WATCH:
+			if (!a->watch)
+				break;
 			if (strcmp(audit_watch_path(a->watch),
 				   audit_watch_path(b->watch)))
 				return 1;
-- 
2.17.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
