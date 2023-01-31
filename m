Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C80F86831E5
	for <lists+linux-audit@lfdr.de>; Tue, 31 Jan 2023 16:53:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675180418;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bsQt2nzQMBFRv45FOHQlERJJr9Kfd6wEIT5+p05HUE8=;
	b=BtpU0vRokOW4wEn/w7c5bo1wp+Uihzm9yn9jKwf+NXPU7aWFw6GB8x2psykHJ6CZay3dk7
	MOrV6nTl+Cl2XuD67jquS8GTooCUMJv2X5zfkQWb22Vol9/XrPuOqgHz7UX4pRoMCXKeLl
	0GCQxrK9783++WuLFSOCj2gsUkxUkPg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610--t164W-JOGeYGUAAZgyiaQ-1; Tue, 31 Jan 2023 10:53:37 -0500
X-MC-Unique: -t164W-JOGeYGUAAZgyiaQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 459DE82401A;
	Tue, 31 Jan 2023 15:53:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C155175A2;
	Tue, 31 Jan 2023 15:53:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8949C19465A0;
	Tue, 31 Jan 2023 15:53:27 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 452351946587 for <linux-audit@listman.corp.redhat.com>;
 Tue, 31 Jan 2023 15:53:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 26404175A2; Tue, 31 Jan 2023 15:53:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.17.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C91A9422F2;
 Tue, 31 Jan 2023 15:53:26 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: audit library license
Date: Tue, 31 Jan 2023 10:53:26 -0500
Message-ID: <4782066.GXAFRqVoOG@x2>
Organization: Red Hat
In-Reply-To: <1814878736.609807.1675126520174.JavaMail.yahoo@mail.yahoo.co.jp>
References: <1814878736.609807.1675126520174.JavaMail.yahoo.ref@mail.yahoo.co.jp>
 <1814878736.609807.1675126520174.JavaMail.yahoo@mail.yahoo.co.jp>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: hiroaki.fuse@ymail.ne.jp
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Monday, January 30, 2023 7:55:20 PM EST hiroaki.fuse@ymail.ne.jp wrote:
> Dear All members,
> 
> We can find following lines in audit/README file
> 
> LICENSE
> =======
> The audit daemon is released as GPL'd code. The audit daemon's libraries
> libaudit.* and libauparse.* are released under LGPL so that it may be
> linked with 3rd party software.
> 
> I found that latest audit library linked libaucommon.so.
> 
> ./lib/Makefile.in:AM_CPPFLAGS = -I. -I${top_srcdir} -I${top_srcdir}/auparse
> -I${top_srcdir}/common ./lib/Makefile.in:libaudit_la_LIBADD =
> $(CAPNG_LDADD) ${top_builddir}/common/libaucommon.la
> ./lib/Makefile.in:libaudit_la_DEPENDENCIES = $(libaudit_la_SOURCES)
> ../config.h ${top_builddir}/common/libaucommon.la
> 
> ./auparse/Makefile.am:AM_CPPFLAGS = -I. -I${top_srcdir} -I${top_srcdir}/src
> -I${top_srcdir}/lib -I${top_srcdir}/common
> ./auparse/Makefile.am:libauparse_la_LIBADD =
> ${top_builddir}/lib/libaudit.la ${top_builddir}/common/libaucommon.la
> ./auparse/Makefile.am:libauparse_la_DEPENDENCIES =
> $(libauparse_la_SOURCES) ${top_builddir}/config.h
> ${top_builddir}/common/libaucommon.la
> 
> Libaucommo.so is created by following files
> 
> ./common/Makefile.am:libaucommon_la_SOURCES = audit-fgets.c strsplit.c
> 
> And the license of audit/common/audit-fgets.c is GPLv2
> 
> This mean the license of latest audit libraries are also GPLv2.
> 
> Is my understanding correct?

The intention stated in the README file is correct. The code in question is 
only used by 3 plugins which are GPL and those functions are hidden from 
external users of libaudit. The code can be relicenced to make it LGPL so 
everything matches the intentions.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

