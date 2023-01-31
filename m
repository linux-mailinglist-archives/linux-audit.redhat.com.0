Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCAC682E76
	for <lists+linux-audit@lfdr.de>; Tue, 31 Jan 2023 14:51:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675173109;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hi8N78td2l/xTcx5S5w2aOPbs2BnCeLa6SL+iKQ0jLs=;
	b=CSlTAoxTodGMe/zEeqh/SqwuXYtL22w60X9lK37HOP3+722voJonQRchaUdAoC95NtHfbJ
	zAqMTs6LqN7StvvLS2sH59DH3c+Gc/gjNM/sOrhEDd0yhUDhOgNHURtDUXjAo3tkoaDNTm
	Ri68fiJJ6hDiTkpevWvuI9WjYNvygrY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-bJz2ZsyUNECNGUaYpFFiQA-1; Tue, 31 Jan 2023 08:51:48 -0500
X-MC-Unique: bJz2ZsyUNECNGUaYpFFiQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F936823D6D;
	Tue, 31 Jan 2023 13:51:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40B502026D4B;
	Tue, 31 Jan 2023 13:51:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A95C41946A49;
	Tue, 31 Jan 2023 13:51:29 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7D3F81946587 for <linux-audit@listman.corp.redhat.com>;
 Tue, 31 Jan 2023 00:58:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4D499422F2; Tue, 31 Jan 2023 00:58:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 458D4422AE
 for <linux-audit@redhat.com>; Tue, 31 Jan 2023 00:58:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26652101A521
 for <linux-audit@redhat.com>; Tue, 31 Jan 2023 00:58:30 +0000 (UTC)
Received: from sonicconh6002-vm0.mail.ssk.yahoo.co.jp
 (sonicconh6002-vm0.mail.ssk.yahoo.co.jp [182.22.37.25]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-XrIjJ440PYanZzXnoVXv3Q-1; Mon, 30 Jan 2023 19:58:26 -0500
X-MC-Unique: XrIjJ440PYanZzXnoVXv3Q-1
X-YMail-OSG: K.vhR_cVM1nkql_USWCLAmUOjaTA7ZB1GYNJM0EodObqfiMzCMz4RR8nc0fMCVn
 kCcb9EFIOGQ.UarjWqx1fn.DPJfQa5aQd2jV8.vlXE.L7o2TBgG6F8uhEHtf__uoJ26bOqmyLRv9
 lvf9RIEP5hYky6P1GXFbPaalHHzW8.StQPrRC0yYlFBWjY9o739j.6Q2z4jkChJzoOGQ0nl0Lvk5
 SHOyv7SNTuq8bclShciPZnphwh0ISAPraNhN9HDZVFvQvywcp3NQF3r_RrVmfTvT3_XkxqxgszIc
 vROukwhVaWE3U2jYEPkIX5GsI3S7Xm3LhPyPDwyOefqAOutc2nWXuRAAjCzi5_8n51sEr5HJwic4
 a_vZh.nH.oiEukb8_rqbdNsXaNkXbkKmMcfatURJaRSRQoZUoyv6SovsvLnhAXeXCfny9js6FPLI
 Iq6X0Ll7zYYQ98zzfw0vQchY8y4ljFDIK.n0SOnvcOqGH01fkJ3A3v.ue5hrg3BGXNZ7ZUgX2PM5
 ZUqOcCVJLV6sCcJoJy7V__QEOkkBdDEgGqNbuhqRVsFJaxsanzeIXAjYyEQXV5IRAkrfZTmK0NSS
 hlusvtgv4P43uxDLJo8MnfLAgen70AEsZpFClCJbS4MhLVot3655VMLTXOEoiEeMQcHW5eK0OBSy
 tGGibFq56o2SOPDREvtUu72hFXuVgTwZmGlsxy7OkTXLM6gZ1_CExU48bg5wlLsbRxVqPWfSmdHl
 hQF1dDzM9UitWdthEN4Oovx1QjS361FGpgGsgacO.y6MaO_phFAlZc_QE8RbR4bAO5R3jWrUuQqZ
 fcghdE6WrXVvaXiNKj70ppIKYTN79ilzJPK_8YguD2OK8_.tGd4NbfC9L79PIebpFDVnQ45_q9gP
 mYj6u_EYIzKU0.43fqxtO4ur4gEl6T.u2_7_3SbQXHOXC_6Rdcz3RFKrb_lTMsElmFNpOdhCnPxW
 qJ09G1tz16vp0_i77iUNKcyRGsSScAb9lRdPL1PTTpAY1MHlhW4ArGtvdSxZvP2AyepscFEN0y_M
 BLm8r.YCEmUPcey8TdS.eDcvqFxIihBTC
Received: from sonicgw.mail.yahoo.co.jp by sonicconh6002.mail.ssk.yahoo.co.jp
 with HTTP; Tue, 31 Jan 2023 00:58:24 +0000
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=ymail20211126; d=ymail.ne.jp;
 h=Date:From:Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References;
 b=h4wOFoggf0xLChkbayv4y5KeJ9rSakHOtvelJPkrv0pJpUQJjOVmDlfIROkCgkmz
 UO3AvfU1wtdsoVpHRbXkGMv1wIX/FrEO4EtqrfZpiSZE2rUFORZ0BlgDqYccVTzuMsU
 8XWMRIwFVd2Cq82hBD3QlOgQ5nmooG9UPeXYyPuQ=
Date: Tue, 31 Jan 2023 09:55:20 +0900 (JST)
From: hiroaki.fuse@ymail.ne.jp
To: linux-audit@redhat.com
Message-ID: <1814878736.609807.1675126520174.JavaMail.yahoo@mail.yahoo.co.jp>
Subject: audit library license
MIME-Version: 1.0
References: <1814878736.609807.1675126520174.JavaMail.yahoo.ref@mail.yahoo.co.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 31 Jan 2023 13:51:24 +0000
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
Reply-To: hiroaki.fuse@ymail.ne.jp
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear All members,

We can find following lines in audit/README file

LICENSE
=======
The audit daemon is released as GPL'd code. The audit daemon's libraries
libaudit.* and libauparse.* are released under LGPL so that it may be
linked with 3rd party software.

I found that latest audit library linked libaucommon.so.

./lib/Makefile.in:AM_CPPFLAGS = -I. -I${top_srcdir} -I${top_srcdir}/auparse -I${top_srcdir}/common ./lib/Makefile.in:libaudit_la_LIBADD = $(CAPNG_LDADD) ${top_builddir}/common/libaucommon.la
./lib/Makefile.in:libaudit_la_DEPENDENCIES = $(libaudit_la_SOURCES) ../config.h ${top_builddir}/common/libaucommon.la

./auparse/Makefile.am:AM_CPPFLAGS = -I. -I${top_srcdir} -I${top_srcdir}/src -I${top_srcdir}/lib -I${top_srcdir}/common ./auparse/Makefile.am:libauparse_la_LIBADD = ${top_builddir}/lib/libaudit.la ${top_builddir}/common/libaucommon.la
./auparse/Makefile.am:libauparse_la_DEPENDENCIES = $(libauparse_la_SOURCES) ${top_builddir}/config.h ${top_builddir}/common/libaucommon.la

Libaucommo.so is created by following files

./common/Makefile.am:libaucommon_la_SOURCES = audit-fgets.c strsplit.c

And the license of audit/common/audit-fgets.c is GPLv2

This mean the license of latest audit libraries are also GPLv2.

Is my understanding correct?

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

