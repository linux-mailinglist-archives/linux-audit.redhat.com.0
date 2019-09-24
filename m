Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CCBBD4D6
	for <lists+linux-audit@lfdr.de>; Wed, 25 Sep 2019 00:18:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 439A7309BF06;
	Tue, 24 Sep 2019 22:18:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 040435D9D5;
	Tue, 24 Sep 2019 22:18:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3FD81803B37;
	Tue, 24 Sep 2019 22:18:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8OMI5df019453 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 24 Sep 2019 18:18:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3EE9219C7F; Tue, 24 Sep 2019 22:18:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A64119C70
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 22:18:02 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AE643082137
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 22:18:02 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id x4so4152959qtq.8
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 15:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:date:message-id:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=5k51iv9F3Xd6coZBLdN3GtIlnQ5qdsN9+F3k8umXiD4=;
	b=j+vg2aISs77o6hERK9mt2RdmJuWXwwwoI83duYTYUXOgrg5OIGU/YzJyaAgv+AV1ud
	c+q7MlR9WJ25Z24w43vhRv6y0HxqZlSB4WZHJre9mpDPfDMZgp0Vg+nak6N+5vgIfjlV
	WV0n/0dtkvAh1G0RcGvml7oQmTd2RsnpNTxSTSq3OowIA4rdFG96dbZZb5F0dwrKb7f8
	KBC2mEvJouDrlMXijGy7ldfyfIZSr2IDztdwXBa+vi2IEka/nkFjTZe+cnGX+efQU3mB
	46WQrFEQ7PLPllssxQFD7CRHcpyTih+asiTyZFD4kO0Lg6gr6DUaa53in7dIs1BNkJG/
	kuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:date:message-id:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=5k51iv9F3Xd6coZBLdN3GtIlnQ5qdsN9+F3k8umXiD4=;
	b=ZCIl9nntMePhA3l6IaZdE4/ozoDOjBDJSyXCv47QIgqhIsxXjna3E3hqTh0JCYmbIa
	Ay/bP1Lei2Dx6shT8B0kke0EkqtG9qa8FVfwlKZiWGlMfNEZdVezn7Yynf5p2zgi58BJ
	d5Gav2gRwAvEdl/jPrGpHrxaYz9TreCf4w5o9MM70ovkK33GCCI6zRw4OdhzVbUB+Kps
	KQZZycghjZjqEPgjN/U6O7Szr9WDmNo0gwk5qeiZ5nOPeC0tQLMZJdkFj15f0D9jjWQ6
	HCstkXunoqhRcWNO1B++BdQ0ByocFMfTPymrzekw0E0FP4GfHzxxKSsDHSucgGHDhfG8
	5BgQ==
X-Gm-Message-State: APjAAAUIjxpmwqSo1B7eSCMG9YrsKg0v9b80ly+ruFKLw5CQQBLn43Jk
	lE4C2khVV6JUuXFvQEFqDqmOZafkHg==
X-Google-Smtp-Source: APXvYqzNKVwxknjC9J6RiEMGjShVKku6ZlZNokXk8i+mD1lHwYRbK6XlCwE7cXrbrGmcmGH+/JrR1w==
X-Received: by 2002:ac8:45da:: with SMTP id e26mr5257443qto.75.1569363480732; 
	Tue, 24 Sep 2019 15:18:00 -0700 (PDT)
Received: from localhost (static-96-233-112-89.bstnma.ftas.verizon.net.
	[96.233.112.89]) by smtp.gmail.com with ESMTPSA id
	r19sm2161848qte.63.2019.09.24.15.17.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 15:18:00 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
X-Google-Original-From: Paul Moore <pmoore2@cisco.com>
Subject: [PATCH 1/2] audit-testsuite: use our own version of perltidy in the
	Travis CI tests
To: linux-audit@redhat.com
Date: Tue, 24 Sep 2019 18:17:59 -0400
Message-ID: <156936347936.596476.2601906393423249009.stgit@chester>
In-Reply-To: <156936337513.596476.11307857211925574009.stgit@chester>
References: <156936337513.596476.11307857211925574009.stgit@chester>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 24 Sep 2019 22:18:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Tue, 24 Sep 2019 22:18:02 +0000 (UTC) for IP:'209.85.160.178'
	DOMAIN:'mail-qt1-f178.google.com'
	HELO:'mail-qt1-f178.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.004  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_NONE) 209.85.160.178 mail-qt1-f178.google.com 209.85.160.178
	mail-qt1-f178.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 24 Sep 2019 22:18:24 +0000 (UTC)

From: Paul Moore <paul@paul-moore.com>

Unfortunately the perltidy results differ between moden distros and the
current Travis CI environment.  This patch attempts to address this by
using the current upstream perltidy in the Travis CI tests.

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 .travis.yml |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index 406f4b8..d6eeace 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -6,10 +6,18 @@ addons:
   apt:
     packages:
       - astyle
-      - perltidy
       - python-pip
       - gcc-multilib
 
+before_install:
+  # FYI: known good with HEAD at 8551fc60fc515cd290ba38ee8c758c1f4df52b56
+  - git clone https://github.com/perltidy/perltidy.git perltidy
+  - |
+    (cd perltidy &&
+     perl Makefile.PL &&
+     make &&
+     sudo make install)
+
 install:
   - sudo pip install yapf
 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
