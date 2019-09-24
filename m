Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE67BD4D5
	for <lists+linux-audit@lfdr.de>; Wed, 25 Sep 2019 00:18:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90D683002068;
	Tue, 24 Sep 2019 22:18:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07E86100197A;
	Tue, 24 Sep 2019 22:18:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3EC14E589;
	Tue, 24 Sep 2019 22:18:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8OMHx2J019424 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 24 Sep 2019 18:17:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4220A5D9DC; Tue, 24 Sep 2019 22:17:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D76E5D9D5
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 22:17:57 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C61633083392
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 22:17:55 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id j31so4159614qta.5
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 15:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:date:message-id:user-agent:mime-version
	:content-transfer-encoding;
	bh=SnzdXMIuWH3M90Vskm/XozUyjO/skI+0nXN5ljPhMSM=;
	b=J9zY5pKcvNnKlN5+CJiaZFSf09ZF+Hs4ASWrTWE8L59xdsxXNCdus+pOTmiP23wB2t
	Inj0y/6DQM0HxFk9gaToZC33BIZvXlaMJG/VZC+Qt0tQkbFRbG/Xq4zJpRkigRDgiLYP
	XdBT4pBWDE9RgWdrB4Hj2LzbjDrTxBZukOWC2Ke5g6w3HGp+QYZBZloNSP+MW1Er1Mej
	I4PSfnCpcW3ADd3jGP65OR3DoDa6aUC3aWRQEy9R4vYnE5dRiuCEbX621el7MiQsbc8Q
	iPNxNQJHiufuA7eYzu/JAHIkTMZookXXEyWeNi8Vi9VAkeJ4rtiZuLPaudxm2UDT2TuB
	TMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:date:message-id:user-agent
	:mime-version:content-transfer-encoding;
	bh=SnzdXMIuWH3M90Vskm/XozUyjO/skI+0nXN5ljPhMSM=;
	b=nrzw6iiW6cl43G01MRl/HmiC7o4DXh/7r4DFh4A/Iauayeu51gchLRrBHmun6pIFlW
	c0jqVHYL30DnP1czJAGPUhfRfXr/etb9qSA9oEBHRwX75mC9tRvFapwUyGJ0de5+l86A
	wzwfEeIlMkQxO18Jav1yYjvM/XznJArr/LQWrpAuhClQYExekximRSCTbEjwBLU1w6qB
	cehCZ2QQzkh7kcFnti3mKs/hD+KVD1GQty9MDNTYD7Bw+90At5mY1yxpItCYtSDtL81M
	YKwmFUGKst3tsyRcXtbVQmNCTGOdvqDREep4lxUezpAEW0KtGb8q8gSi2sJoaTkuwWrB
	x5/g==
X-Gm-Message-State: APjAAAVBoJ7P71f6prDnBYbaWm0CXD4w7wZqDgpGcnpY415FSjIjHcZ4
	ojyEpPYbRaM2yp8IGK5kwZc849LNOQ==
X-Google-Smtp-Source: APXvYqyMg+YpjveMryktExizerpQW/oONlNWgDPKcSqwSQGdnIlVN9Mh/kb4QidHeokIbreZc778zA==
X-Received: by 2002:ac8:5216:: with SMTP id r22mr5345935qtn.281.1569363474295; 
	Tue, 24 Sep 2019 15:17:54 -0700 (PDT)
Received: from localhost (static-96-233-112-89.bstnma.ftas.verizon.net.
	[96.233.112.89]) by smtp.gmail.com with ESMTPSA id
	y26sm1812927qtk.22.2019.09.24.15.17.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 15:17:53 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
X-Google-Original-From: Paul Moore <pmoore2@cisco.com>
Subject: [PATCH 0/2] Fix perltidy on Travis CI
To: linux-audit@redhat.com
Date: Tue, 24 Sep 2019 18:17:52 -0400
Message-ID: <156936337513.596476.11307857211925574009.stgit@chester>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 24 Sep 2019 22:17:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 24 Sep 2019 22:17:56 +0000 (UTC) for IP:'209.85.160.171'
	DOMAIN:'mail-qt1-f171.google.com'
	HELO:'mail-qt1-f171.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.160.171 mail-qt1-f171.google.com 209.85.160.171
	mail-qt1-f171.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 24 Sep 2019 22:18:24 +0000 (UTC)

The version of perltidy currently available in Travis CI via
Ubuntu 16.04 LTS doesn't produce the same output as the perltidy
shipped in more modern distros.  This patchset addresses this by
installing perltidy from the upstream sources.

---

Paul Moore (2):
      audit-testsuite: use our own version of perltidy in the Travis CI tests
      audit-testsuite: fix the style according to ./tools/check-syntax


 .travis.yml                                  |   10 +++++++++-
 tests/exec_execve/test                       |    2 +-
 tests/exec_name/test                         |    2 +-
 tests/file_create/test                       |    2 +-
 tests/file_delete/test                       |    2 +-
 tests/file_rename/test                       |    2 +-
 tests/filter_exclude/test                    |    2 +-
 tests/filter_sessionid/test                  |    2 +-
 tests/login_tty/test                         |    2 +-
 tests/lost_reset/test                        |    2 +-
 tests/netfilter_pkt/test                     |    2 +-
 tests/syscall_module/test                    |    2 +-
 tests/syscall_socketcall/test                |    2 +-
 tests/syscalls_file/test                     |    2 +-
 tests/user_msg/test                          |    2 +-
 tests_manual/stress_tree/test                |    2 +-
 tests_manual/syscall_module_path_filter/test |    1 +
 17 files changed, 25 insertions(+), 16 deletions(-)

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
