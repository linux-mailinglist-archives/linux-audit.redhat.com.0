Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFA5620364
	for <lists+linux-audit@lfdr.de>; Tue,  8 Nov 2022 00:10:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667862641;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qICWr6ECxqcHVoFJbZjv/6k/5CADsbfnMoqX/WAuANQ=;
	b=fcOsN12PIY2y0ONU3+e/sbxZk3F0wilux/6sz4ZPr1xhPnclhZeeSYCO8kftpW1fV84OAk
	g95LEqhjvGpqPL4zmGs0WPNIDBcZDdMmy6BwaMoFM6aWNyWYzL6xy6mIT0GYo2YumTr95o
	Wlkd52fhNaZ8ZFtjyz+tmgjXCotMOmk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-qtd9lQFkOhipFXqnlHI09w-1; Mon, 07 Nov 2022 18:10:40 -0500
X-MC-Unique: qtd9lQFkOhipFXqnlHI09w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B49DF85A583;
	Mon,  7 Nov 2022 23:10:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BB2F49AFD;
	Mon,  7 Nov 2022 23:10:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5D56D1946594;
	Mon,  7 Nov 2022 23:10:30 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 10CE81946587 for <linux-audit@listman.corp.redhat.com>;
 Mon,  7 Nov 2022 23:10:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E5E4849BB63; Mon,  7 Nov 2022 23:10:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD54649BB61
 for <linux-audit@redhat.com>; Mon,  7 Nov 2022 23:10:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFCA9811E81
 for <linux-audit@redhat.com>; Mon,  7 Nov 2022 23:10:28 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-1-fnan4HP12W2hofA0a4iQ-1; Mon, 07 Nov 2022 18:10:26 -0500
X-MC-Unique: 1-fnan4HP12W2hofA0a4iQ-1
Received: by mail-oi1-f179.google.com with SMTP id h132so5963163oif.2
 for <linux-audit@redhat.com>; Mon, 07 Nov 2022 15:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C/L1wjrOu2FXdc85i7dLzQ2WP8XFJpr05YEP11uQNCw=;
 b=42JmCwXgMBoFA0et5NpPS5Pz9D+mRxuheA94BhfB/yy/oJmVRscAgUOWifrBqvD3iO
 89/GO5wSl5A9IBsXK/eqUpCjLwBOvCT6U4keNaL+Fat4qxi7iVweiKtA6rc9IFIe/les
 biUAGvUhDGETZaHjnvPh7xbtJuYW8JLspL4PqQxwz/0k0bDahinmeL/5I/U20htyA+ob
 zUQKgAe/bi2ur6uUJ7YsS9+a/a0i1Ou96Lt/hFwrNGQVh1BrXKjc/24ZAgxdoknupsve
 a5cyEByqxAyjGyr2WAnN/jGIeNs/66Sd8GjGXGL7K61cRNlat8ADfzEGdWowjVdpE4pg
 ui2g==
X-Gm-Message-State: ACrzQf19ooOUCRkJ4MTOiU2DpZ7HdZoJ7weCH+CH5XWMVDFWK+JuOet9
 l2OqmxlEI3qmNE4cSDWqSYK0eVuthfwG39r2KZxgLqH+oT1w
X-Google-Smtp-Source: AMsMyM6eWqBRHLpEf8bQJwHdJItEPT5MOsGSoS2ENjJ9mNLglMPqZx9GXKemOe3oFQum55dZh8oMmgrz4ga9a617v8Y=
X-Received: by 2002:a05:6808:1441:b0:35a:4a2d:673b with SMTP id
 x1-20020a056808144100b0035a4a2d673bmr14935862oiv.172.1667862625908; Mon, 07
 Nov 2022 15:10:25 -0800 (PST)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 7 Nov 2022 18:10:15 -0500
Message-ID: <CAHC9VhTv96BsOTQyyBTWSJ80fDuiniacDUhfz1GJrP-huWxJzg@mail.gmail.com>
Subject: [GIT PULL] Audit fixes for v6.1 (#1)
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

A small audit patch to fix an instance of undefined behavior in a
shift operator caused when shifting a signed value too far.  While the
fix is trivial and I can't imagine it causing a problem in a backport,
I'm not explicitly marking it for stable on the off chance that there
is some system out there which is relying on some wonky unexpected
behavior which this patch could break; *if* it does break, IMO it's
better that to happen in a minor or -rcX release and not in a stable
backport.

Please merge for v6.1-rcX.

-Paul

--
The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

 Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

 git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
   tags/audit-pr-20221107

for you to fetch changes up to 986d93f55bdeab1cac858d1e47b41fac10b2d7f6:

 audit: fix undefined behavior in bit shift for AUDIT_BIT
   (2022-10-31 07:29:47 -0400)

----------------------------------------------------------------
audit/stable-6.1 PR 20221107

----------------------------------------------------------------
Gaosheng Cui (1):
     audit: fix undefined behavior in bit shift for AUDIT_BIT

include/uapi/linux/audit.h | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

