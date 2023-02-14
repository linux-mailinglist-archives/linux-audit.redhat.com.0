Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 107C8696DC4
	for <lists+linux-audit@lfdr.de>; Tue, 14 Feb 2023 20:23:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676402627;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PlQhNidFFMg+iIKIKE7WoBVXFngoPoj9YxQ11tW+91s=;
	b=gq58ZPfKxFclrdU+Gj5aW/lqqJEmUotxwZkM1HX8oJmRxuKJMexRM1p2obCbFUx/MxoV5h
	DCdeBPBQqtt2rEFSPqbz0+j36WP2Om/OD5zY5t1rUIhDoEePduWaH0VgLrSV/GqQiMc9m6
	A0fGQMwp1KUJmV6iWAyRPDeX2b6GTzo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-NJfVJPpoPbO19nsnPsJq2A-1; Tue, 14 Feb 2023 14:23:44 -0500
X-MC-Unique: NJfVJPpoPbO19nsnPsJq2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F38D585CBE2;
	Tue, 14 Feb 2023 19:23:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38221C15BA0;
	Tue, 14 Feb 2023 19:23:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5656D19465A3;
	Tue, 14 Feb 2023 19:23:32 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 50BBF1946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 14 Feb 2023 19:23:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2FE7C2026D2A; Tue, 14 Feb 2023 19:23:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27A962026D4B
 for <linux-audit@redhat.com>; Tue, 14 Feb 2023 19:23:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 077E318E6C44
 for <linux-audit@redhat.com>; Tue, 14 Feb 2023 19:23:31 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-388-aG61UIt1O7aSjbyjgX89zQ-1; Tue, 14 Feb 2023 14:23:29 -0500
X-MC-Unique: aG61UIt1O7aSjbyjgX89zQ-1
Received: by mail-qt1-f182.google.com with SMTP id q13so18791736qtx.2
 for <linux-audit@redhat.com>; Tue, 14 Feb 2023 11:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iRSbn3sPzhp3l4JYmYg6SXfVRVqk3CbN04sYmrrbxCI=;
 b=UMj+xpm7rOtzsY5mYkv6UW+OkwNZIalT/lZu9jaC2he22IkAZRdFpWhc4cdrN9yQIB
 kj6gHBJt42gkiO9isospnCT+VDG4XvMr8zsUjkYtqkVV8vuYhdNHKgtiw1iHUEn0HViU
 //lDADo6BAabf0MVLGsEv29eDybzRMZ8SgGNZDpe9NXmH7qHy7I7EWnpTZUSIemEB/Go
 xtbRsluPcN/Hn+w0DmATuxrMMyioascIm8RrysIPjZ4UmESwWSEnHA8HSEVtiGg48qS+
 nKQd2ceGDPmVi2GyKffuCJnNlUElLKkrSKTx1OZTKnTmF5EmQtKjt6tXa97nYx8uDLFh
 RHFw==
X-Gm-Message-State: AO0yUKXjhok04HbXC21O73pKMB+F/K81G11dzNzr/sLyx4rPfY6Cc9C2
 N9W4j3eUsQXm2qtBbZmuPn3GvuQA9RRY1eI=
X-Google-Smtp-Source: AK7set+L06wouj7P76/Zizxn7wVluPmzqmdboQa5asw8eAget0+o4mw2MJMbZIqh+PifTMgbFoqo1g==
X-Received: by 2002:a05:622a:1487:b0:3b6:3995:2ec2 with SMTP id
 t7-20020a05622a148700b003b639952ec2mr6302821qtx.19.1676402608141; 
 Tue, 14 Feb 2023 11:23:28 -0800 (PST)
Received: from localhost (pool-108-26-161-203.bstnma.fios.verizon.net.
 [108.26.161.203]) by smtp.gmail.com with ESMTPSA id
 g4-20020ac80704000000b003b63b8df24asm11566239qth.36.2023.02.14.11.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:23:27 -0800 (PST)
From: Paul Moore <paul@paul-moore.com>
To: audit@vger.kernel.org,
	linux-audit@redhat.com
Subject: [PATCH] tests/filter_exclude: euid filtering now possible in exclude
 filter
Date: Tue, 14 Feb 2023 14:23:26 -0500
Message-Id: <20230214192326.239267-1-paul@paul-moore.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Starting with Steve's audit userspace v3.1, an euid exclude filter no
longer results in an error.  Adjust the test accordingly.

Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 tests/filter_exclude/test | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/filter_exclude/test b/tests/filter_exclude/test
index 7a8e3fb..248fc54 100755
--- a/tests/filter_exclude/test
+++ b/tests/filter_exclude/test
@@ -103,7 +103,7 @@ $result = system("auditctl -a exclude,always -F ppid=$ppid >/dev/null 2>&1");
 ok( $result ne 0 );
 system("auditctl -d exclude,always -F ppid=$ppid >/dev/null 2>&1");
 $result = system("auditctl -a exclude,always -F euid=$euid >/dev/null 2>&1");
-ok( $result ne 0 );
+ok( $result, 0 );
 system("auditctl -d exclude,always -F euid=$euid >/dev/null 2>&1");
 $result =
   system("auditctl -a exclude,always -F obj_user=$obj_user >/dev/null 2>&1");
-- 
2.39.1

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

